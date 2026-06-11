# WedWip — Mauro & Beatrice

The wedding website of Mauro & Beatrice, married in Bergamo on **1 October 2016** —
rebuilt for their **10th wedding anniversary** as a fully static site.

## What's here

```
site/                 the static website (Vite + TypeScript)
  index.html          10th anniversary landing page
  src/                landing page TypeScript + CSS (bundled)
  public/archive/     static reproduction of the original 2016 site (IT + EN),
                      served verbatim with the original Vitality theme assets
docs/                 architecture & security documentation
```

- **`/`** — anniversary landing page with a time-since-the-wedding counter.
- **`/archive/`** and **`/archive/en/`** — the 2016 site as it was: same theme, images
  and copy, with personal data redacted, trackers removed and forms inert.

## Development

Requires Node 22 (`site/.nvmrc`).

```bash
cd site
npm ci
npm run dev      # dev server
npm run lint     # eslint + prettier
npm run build    # static output in dist/
npm run preview  # serve the built output
```

CI builds and lints every PR; pushes to `master` deploy `site/dist/` to GitHub Pages.

## History

This repository hosted the original dynamic application: Ruby on Rails 4.2 with Devise
authentication, where guests RSVP'd, suggested honeymoon stops on a map and left
messages. It served its purpose in 2016 and was retired ten years later in favour of
this static site — the unmaintained stack had accumulated 139 open security advisories.

- The Rails application is preserved in git history (last full state on the
  pre-removal commits) and documented in [docs/architecture/](docs/architecture/).
- The security assessment and the reasoning behind the retirement are in
  [docs/security/](docs/security/).
