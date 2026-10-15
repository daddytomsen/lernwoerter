// Schreibfuchs service worker: lets the app start without internet and picks up new versions on the next launch.
const CACHE = 'lernwoerter-v0.10';
const CORE = ['./', './index.html', './werkstatt.html', './manifest.webmanifest',
  './fonts/playwrite-de-grund.woff2', './fonts/andika-latin.woff2',
  './apple-touch-icon.png', './icon-192.png', './icon-512.png'];

self.addEventListener('install', event => {
  event.waitUntil(caches.open(CACHE).then(c => c.addAll(CORE)).then(() => self.skipWaiting()));
});

self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

function store(req, res) {
  if (res && res.ok) {
    const copy = res.clone();
    caches.open(CACHE).then(c => c.put(req, copy));
  }
  return res;
}

self.addEventListener('fetch', event => {
  const req = event.request;
  if (req.method !== 'GET') return;
  const url = new URL(req.url);
  if (url.origin !== self.location.origin) return;

  // Pages and weekly word lists: network first, so updates and new weeks arrive; offline the cached copy.
  if (req.mode === 'navigate' || url.pathname.endsWith('.html') || url.pathname.includes('/wochen/')) {
    event.respondWith(
      fetch(req).then(res => store(req, res)).catch(() =>
        caches.match(req, { ignoreSearch: true }).then(hit => hit || caches.match('./index.html'))
      )
    );
    return;
  }

  // Fonts, manifest, icons: from the cache, fetched once.
  event.respondWith(caches.match(req).then(hit => hit || fetch(req).then(res => store(req, res))));
});
