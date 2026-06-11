# Security Remediation Plan

Companion to [security-posture.md](security-posture.md). Strategy: **retire, don't
patch.** The dynamic features (authentication, RSVP, message and place suggestions) have
had no purpose since October 2016, so the cheapest secure state is a static site with no
server-side execution, no database and no authentication.

## Decision

Patching was rejected: upgrading Ruby 2.2/Rails 4.2 to supported versions is a rewrite
of an application whose features are all dead, and would leave a permanent maintenance
obligation. A static site reduces the attack surface to "what a web server serves",
eliminates all 139 Gemfile.lock alerts at the root, and keeps the sentimental value (the
original look) via a static reproduction.

## Actions

| # | Action | Addresses | Delivered in |
|---|--------|-----------|--------------|
| 1 | Document original architecture before removal | knowledge loss | PR 1 |
| 2 | This assessment + plan | — | PR 2 |
| 3 | New TypeScript/Vite static project (`site/`) with CI (build + lint) and `dependabot.yml` for npm | no-CI, future supply chain | PR 3 |
| 4 | Copy only the theme assets the archive page needs; drop CDN scripts (respond.js, html5shiv), drop `http://` font links in favor of HTTPS | mixed content, SRI-less CDNs, unused attack surface | PR 4 |
| 5 | Static reproduction of the 2016 page with: IBAN/BIC redacted, phone numbers removed, Google Analytics removed, Google Maps API removed, all forms inert (no backend) | personal/financial data exposure, trackers, dead endpoints | PR 5 |
| 6 | New anniversary landing page (modern, dependency-light, bundled) | — | PR 6 |
| 7 | Remove the Rails application (incl. `Gemfile.lock`, `config/secrets.yml`), rewrite README, add SECURITY.md, CSP meta tags, GitHub Pages deploy | the 139 Dependabot alerts, committed dev secrets, defunct CI/badges | PR 7 |

## Residual risks (accepted)

- **Git history** still contains the IBAN, phone numbers and dev `secret_key_base`.
  Rewriting public history would break forks/links and the data has been public for a
  decade; accepted. The dev/test keys are useless once no Rails app exists. The bank
  account referenced should be confirmed closed/rotated by the owner.
- **Legacy jQuery 1.11/Bootstrap 3 JS on `/archive/*`**: served verbatim for fidelity.
  Known CVEs in these libraries are DOM XSS vectors requiring attacker-controlled input
  into jQuery APIs; the archive pages are fully static, take no user input, hold no
  credentials/cookies of value, and are isolated to their own path. Accepted, documented.
- **Spotify iframe** on the archive page is a third-party embed; kept for fidelity
  (or downgraded to a plain link if the playlist is gone).
- **Heroku database**: the production PostgreSQL instance holding guest PII should be
  confirmed deleted (outside the repo's control; owner action).

## Verification

- After PR 7 merges: Dependabot alert count on the default branch reaches 0 open
  Ruby alerts (alerts auto-resolve when the manifest leaves the default branch).
- `git grep` on the built `dist/` output contains no IBAN, BIC, or phone numbers.
- CI is green (build + lint) on every PR in the series.
