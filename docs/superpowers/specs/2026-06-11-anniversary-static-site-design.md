# 10th Wedding Anniversary Static Site — Design

Date: 2026-06-11
Status: approved (autonomous execution per owner's goal)

## Background

`wedwip` is the wedding website of Mauro & Beatrice (married 2016-10-01), built in 2016 as a
Ruby on Rails 4.2 application and untouched for ~10 years. The stack is end-of-life
(Ruby 2.2.1, Rails 4.2.6, jQuery 1.11, Bootstrap 3) and GitHub reports hundreds of
Dependabot security alerts. The original dynamic features (Devise authentication, RSVP,
guest messages, honeymoon place suggestions) are long past their purpose: the wedding
happened, the RSVP deadline expired in 2016.

## Goal

For the 10th wedding anniversary (2026-10-01):

1. Document the original architecture and project structure under `docs/`.
2. Evaluate the security posture and document remediation.
3. Replace the dynamic Rails app with a **secure static website**:
   - a new anniversary landing page, and
   - a faithful **static reproduction of the original 2016 site** (same layout, theme,
     images, copy) reachable from the landing page.
4. No authentication, no database, no server-side code.
5. Assets are built/bundled from a TypeScript project.
6. Deliver the work as a series of small atomic commits grouped into stacked PRs.

## Non-goals

- Reviving any dynamic feature (RSVP, login, message form submission, map suggestions).
- Pixel-perfect rendering across legacy browsers (IE8/IE9 shims dropped).
- Migrating git history or rewriting it to purge old secrets (documented instead).

## Approaches considered

1. **Vite + TypeScript multi-page site, original theme assets served verbatim for the
   archive page (chosen).** The new landing page is a modern, minimal, bundled page. The
   archive page is plain static HTML using the original Vitality theme CSS/JS/images copied
   as-is — maximal fidelity with minimal risk, since a static page with no user input and no
   secrets neutralizes the old jQuery/Bootstrap CVE exposure.
2. Rewrite the archive page with modern CSS imitating the old look. Safer dependencies but
   poor fidelity and much more work; rejected.
3. Single hand-written HTML files with no build step. Simple, but the goal explicitly asks
   for a TypeScript build, and a bundler gives minification, hashing and a dev server;
   rejected.

## Architecture

```
/                      ← legacy Rails app (removed in final PR)
docs/                  ← architecture + security documentation
site/                  ← new TypeScript static site (Vite)
  index.html           ← 10th anniversary landing page (bundled TS/CSS)
  src/                 ← TypeScript + CSS for the landing page
  archive/index.html   ← static reproduction of the 2016 site (Italian)
  archive/en/index.html← English version
  public/archive/      ← original theme assets served verbatim (css/, js/, img/, fonts)
```

- **Build**: Vite multi-page (`index.html`, `archive/index.html`, `archive/en/index.html`
  as rollup inputs). `npm run build` emits a fully static `dist/`.
- **Landing page**: small TypeScript module (e.g. years/days-since counter), modern CSS,
  links to `/archive/` and `/archive/en/`.
- **Archive page**: HTML translated 1:1 from the original HAML partials (navigation,
  header, about, locations, participations, quote, faq, contact, playlist quotes,
  honeymoon, gift, map modals, footer), rendered as the "signed-in" root view since
  authentication is retired. Original Vitality CSS/JS and images load from
  `/archive/{css,js,img}/` unchanged.

### Security-driven changes in the reproduction

- **Redact personal/financial data**: real IBAN and BIC replaced with placeholders;
  personal phone numbers removed; contact email kept (already public on the repo).
- **No third-party trackers/APIs**: Google Analytics snippet removed; Google Maps
  Places API (required a key) replaced with static map links/images; Spotify embed kept as
  a passive iframe or reduced to a plain link.
- **No form submissions**: RSVP/contact/suggestion forms rendered visually but inert
  (disabled, with an "archived" note) — there is no backend.
- **Legacy JS scope**: old jQuery/Bootstrap JS only on `/archive/*` pages, which contain
  no user input handling and no sensitive data.
- **Hardening**: `dependabot.yml` for npm, CI build+lint on PRs, CSP meta tag on new
  pages, SECURITY.md, README rewrite.

## PR series (stacked, each off the previous)

| # | Branch | Content |
|---|--------|---------|
| 1 | `docs/original-architecture` | This spec + original architecture & page-structure docs |
| 2 | `docs/security-posture` | Security assessment + remediation plan |
| 3 | `feat/static-site-scaffold` | Vite+TS scaffold, lint, CI, dependabot config |
| 4 | `feat/archive-theme-assets` | Original theme css/js/img copied into `site/public/archive/` |
| 5 | `feat/archive-static-pages` | Static reproduction (IT + EN) of the 2016 home page |
| 6 | `feat/anniversary-landing` | 10th anniversary landing page + navigation |
| 7 | `chore/retire-rails-app` | Remove legacy Rails app, README, SECURITY.md, Pages deploy |

PR 7 is the step that actually clears the Dependabot alerts (the vulnerable `Gemfile.lock`
leaves the default branch). The Rails app remains available in git history and is fully
described in `docs/`.

## Testing / verification

- `npm run build` and `npm run lint` green in CI on every PR.
- Visual check of `dist/` pages via `vite preview` (landing + both archive locales).
- Grep gate in review: no IBAN/BIC/phone numbers in any built output.
