# Original Page Structure & Frontend (2016)

The site's look and feel comes from **"Vitality"**, a commercial Bootstrap 3 one-page
theme (Start Bootstrap), used in its **vintage** style variant (`body.vintage`) with the
**yellow** color scheme (`css/vitality-yellow.css`). All theme assets are vendored under
`vendor/assets/` and served through the Rails asset pipeline.

## Layout

`app/views/layouts/application.html.haml`:

- `lang="it"`, IE8/IE9 conditional classes, `viewport` meta
- `_stylesheets` partial (theme + plugin CSS, Google Fonts over plain HTTP)
- `body.vintage#page-top`
- page yield → `static_pages/home`
- `_footer` partial
- `_javascripts` partial (jQuery + plugins + theme JS)
- inline **Google Analytics** snippet (`UA-80424858-1`)
- per-page `:page_title`, `:page_stylesheet`, `:page_javascript` content blocks

## Home page composition

`static_pages/home.html.haml` renders, in order:

| # | Partial | Section id / element | Content |
|---|---------|----------------------|---------|
| 1 | `layouts/_navigation` | `nav.navbar-inverse.navbar-fixed-top` | Logo (`img/fashion/logo.png`); links vary by auth state: signed-in users on the root page get anchors (About, Locations, Partecipa, FAQ, Musica, Luna di Miele, Regalo) + language switch; anonymous users get Login/Register anchors |
| 2 | `_header` | `header` | Full-screen hero, background `img/castle.jpg`, "Mauro e Beatrice — Con grande gioia annunciano il loro matrimonio", "Scopri" button, scroll-down arrow |
| 3 | `_about` | `#about` | "Il nostro matrimonio — Sabato 1 Ottobre 2016", two icon cards linking to RSVP (`fa-edit`) and gift (`fa-gift`) sections |
| 4 | `_locations` | `#locations.pricing` | Background `img/chiesa.jpg`; two cards: Cerimonia (Basilica di Sant'Alessandro in Colonna, Bergamo, 16.00) and Ricevimento (Tenuta Serradesca, Scanzorosciate, 18.30), each with a "Mappa" modal button |
| 5 | `_participations` | `#participations.bg-gray` | RSVP. Final state: read-only list of confirmed guests rendered with jsrender from `/guests` JSON; the original code-validation + add-guest forms are commented out (deadline passed) |
| 6 | `_quote` | `aside.cta-quote` | Schopenhauer quote over `img/proposta.jpg` |
| 7 | `_faq` | `#faq.bg-gray` | Four icon cards: Parcheggio, Passaggi in Auto, Alloggio, Cibo |
| 8 | `_messages` | `#message.bg-gray` | "Contattaci": couple's phone numbers + message/phone form POSTing JSON to `/messages` |
| 9 | inline | `aside.cta-quote` | Image break, `img/shuttle.jpg` |
| 10 | `_playlist` | `#playlist.bg-gray` | Spotify playlist embed (380×380 iframe) + "Apri la Playlist" button |
| 11 | inline | `aside.cta-quote` | Image break, `img/menu.jpg` |
| 12 | `_honey_moon` | `#trip.bg-gray.testimonials` | "Viaggio di Nozze": honeymoon description + Google Maps search box where guests dropped markers (saved to `places` via JSON) |
| 13 | `_gift` | `#gift.bg-gray` | "Lista nozze": bank transfer details (recipient, IBAN, BIC), 11% progress bar, three columns describing what gifts fund (Festa e Cerimonia / Viaggio di Nozze / Quotidianità); PayPal button disabled |
| 14 | `_map_modals` | `#churchMap`, `#restaurantMap`, `#searchMapModal` | Bootstrap modals: church/restaurant Google Maps embeds and the "why do you suggest this place" form |

Footer (`layouts/_footer`): black background, three columns — countdown to
`2016/10/01 16:00` (jquery.countdown), "Bergamo, Italy", mailto link — plus Spotify and
GitHub icons and "© 2016 Mauro e Beatrice".

Shared partials `shared/_login`, `shared/_register`, etc. render the Devise screens with
the same theme for anonymous visitors.

## Stylesheets (load order)

1. `css/bootstrap/bootstrap.css` (Bootstrap 3.3.5, vendored as SCSS)
2. `font-awesome/css/font-awesome.css` (vendored, with `fonts/`)
3. Google Fonts: Roboto, Raleway (default), Montserrat, Cardo (modern), Sanchez, Cardo
   (vintage) — all over `http://`
4. Plugin CSS: owl-carousel (3 files), magnific-popup, background, animate.css
5. Theme: `css/vitality-yellow.css` (other colour variants vendored but commented out)
6. `application.css` (small app overrides, ~80 lines)
7. Inline page CSS: maps search-box styles, embed-container styles in the modals partial

## JavaScript (load order)

1. Conditional IE<9: respond.js + html5shiv from MaxCDN
2. `js/plugins/retina/retina.js`
3. Core: `js/jquery.js` (1.11.0), `js/jquery.countdown.js`, `js/jsrender.js`,
   `js/bootstrap/bootstrap.js` (3.3.5)
4. Plugins: jquery.easing, classie, cbpAnimatedHeader, owl.carousel, magnific-popup,
   background (core/transition/background), jquery.mixitup, wow.js, contact_me.js,
   jqBootstrapValidation
5. Theme: `js/vitality.js` (smooth scroll, navbar collapse, wow init, popups)
6. Hashing: `js/plugins/jshash/{sha512,md5}.js` (used to "encrypt" the RSVP code
   client-side — see security assessment)
7. `application.js`: helpers (`capitalize`, `supplant`, `encrypt` = SHA-512 of lowercased
   input) + footer countdown to the wedding date
8. `i18n.js` (i18n-js translations)
9. Per-page inline scripts rendered from ERB partials:
   `static_pages/javascripts/_guests.js.erb` (RSVP JSON calls + jsrender rendering),
   `_messages.js.erb` (contact form POST), `_maps_search_box.js.erb` (Google Maps Places
   search, marker drop, suggestion modal POST to `/places`)
10. DataTables (`js/jquery.dataTables.min.js`, `js/dataTables.bootstrap.min.js`) on the
    `guests`/`messages`/`places` index pages

## Images actually referenced by the home page

From `vendor/assets/img/` (served under the `img/` logical path):

- `img/castle.jpg` — hero header background
- `img/chiesa.jpg` — locations section background
- `img/proposta.jpg`, `img/shuttle.jpg`, `img/menu.jpg` — quote/image breaks
- `img/fashion/logo.png` (+ `logo@2x.png` via retina.js) — navbar brand

The rest of `vendor/assets/img/` (fashion gallery, people, portfolio, valdemossa,
garden, terrace, stockholm…) ships with the theme demo or earlier drafts and is unused
on the final page. `app/assets/images/stockholm.jpg` is likewise unused.

## Theme directory map

```
vendor/assets/
├── img/
│   ├── img/                  # theme + wedding images (castle, chiesa, proposta, …)
│   │   └── fashion/          # logo, profile, gallery (mostly unused on final page)
│   └── plugins/datatables/   # sort icons
├── javascripts/js/           # jquery, bootstrap, plugins/, vitality.js, datatables
└── stylesheets/
    ├── css/                  # bootstrap/, plugins/, vitality-*.css (10 colour variants)
    └── font-awesome/         # css + fonts
```
