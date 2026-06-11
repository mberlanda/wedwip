# Security Posture Assessment

Date: 2026-06-11
Scope: the `wedwip` repository as of `master` (last functional change: 2016).

## Summary

The application has been unmaintained for ~10 years. Every layer of the stack is years
past end-of-life, GitHub Dependabot reports **139 open vulnerability alerts (9 critical,
59 high, 60 moderate, 11 low)**, all in `Gemfile.lock`, and the repository publishes
personal and financial data. The application no longer serves its dynamic purpose (the
wedding RSVP closed in 2016), so the risk/benefit of patching the Rails stack is
strongly negative. The recommended remediation — implemented by this PR series — is to
**retire the dynamic application entirely** and replace it with a static site
(see [remediation-plan.md](remediation-plan.md)).

## 1. End-of-life stack

| Component | Version in repo | Status (2026) |
|-----------|-----------------|----------------|
| Ruby | 2.2.1 (2015) | EOL since 2018-03-31 |
| Rails | 4.2.6 (2016) | EOL since 2017 (4.2 series fully unsupported) |
| PostgreSQL | 9.4 | EOL since 2020-02-13 |
| jQuery | 1.11.0 (vendored) | EOL; multiple XSS CVEs (CVE-2015-9251, CVE-2019-11358, CVE-2020-11022/11023) |
| Bootstrap | 3.3.5 (vendored) | EOL since 2019; XSS CVEs in data attributes (CVE-2018-14041/14042, CVE-2019-8331) |
| Devise, simple_form, haml, puma, nokogiri, rack… | 2016 versions | dozens of published CVEs each |
| Travis CI, Codacy badges | — | services/configs defunct for this repo |

No supported upgrade path exists short of a full rewrite: Rails 4.2 → 8.x crosses
multiple breaking major versions, and Ruby 2.2 cannot run modern Rails.

## 2. Dependency vulnerabilities (Dependabot)

139 open alerts, all from `Gemfile.lock`. Aggregated by package
(via `gh api repos/mberlanda/wedwip/dependabot/alerts`, 2026-06-11):

| Package | Critical | High | Moderate | Low | Notes |
|---------|---------:|-----:|---------:|----:|-------|
| nokogiri | 4 | 23 | 12 | 3 | XML/HTML parsing RCE & DoS chain (bundled libxml2) |
| rack | 1 | 16 | 14 | 2 | request smuggling, DoS, info leaks |
| puma | 2 | 3 | 6 | 1 | HTTP request smuggling |
| actionview / actionpack / activerecord / activesupport / activejob | 1 | 8 | 11 | 4 | Rails core: XSS, SQLi, deserialization |
| rails-html-sanitizer / loofah | — | 2 | 8 | — | sanitizer bypass XSS |
| devise | — | — | 4 | — | token/timing issues |
| simple_form | 1 | — | — | — | file disclosure (CVE-2019-16676) |
| others (addressable, tzinfo, sprockets, i18n, json, rdoc, rake, haml, globalid, bcrypt) | — | 7 | 2 | 1 | assorted |

Additional unflagged exposure: the vendored frontend (`vendor/assets/`) contains
jQuery 1.11.0, Bootstrap 3.3.5 and a constellation of 2014-era jQuery plugins that
Dependabot does not scan because they are not in a package manifest.

`i18n-js` is pinned to a GitHub branch (`github: 'fnando/i18n-js'`), i.e. an unpinned,
unauditable moving target at install time.

## 3. Secrets and sensitive data in the repository

| Finding | Location | Severity | Notes |
|---------|----------|----------|-------|
| `secret_key_base` for development & test committed | `config/secrets.yml` | Medium | 128-hex-char keys in git history. Production correctly reads `ENV["SECRET_KEY_BASE"]`. If these keys were ever reused in production, session cookies could be forged (Rails 4.2 cookie sessions allow marshal deserialization → RCE). |
| **Real personal IBAN + BIC** | `config/locales/views/static_pages/{it,en}.yml` (`gift.iban.number`, `gift.bic.number`) | Medium (privacy/fraud) | Bank account details of the couple, also rendered on the page. |
| Personal phone numbers | `app/views/static_pages/_messages.html.haml` (hardcoded) | Low/Medium (privacy) | Two personal mobile numbers. |
| Personal email | `config/locales/layouts/{it,en}.yml` | Low | Contact mailbox. |
| Guest PII by design | PostgreSQL (`guests`, `messages`, `places`) | n/a | Names, phone numbers, free-text messages of wedding guests. Not in the repo; the Heroku database should be confirmed deleted. |

Git history retains all of the above permanently; rewriting public history is out of
scope (the repository has been public since 2016), but **newly rendered pages must not
republish the IBAN/BIC or phone numbers** — the static reproduction redacts them.

## 4. Application-level weaknesses (historical)

Relevant if the app were ever booted again:

- **Self-registration open to the internet** (`devise :registerable`): anyone could
  create an account; the entire site was gated only by "has an account".
- **Client-side "encryption" of the RSVP code**: `application.js` SHA-512-hashes the
  invitation code in the browser (`js/plugins/jshash/`) — obfuscation, not security; the
  hash simply becomes the password-equivalent.
- **Unscoped data exposure**: `PlacesController`/`DatatableList` expose *all* users'
  suggestions (`Place.all`, `Model.includes(:user).all`) to any signed-in user, including
  guest names and free-text via the datatable JSON endpoints.
- **JSON params parsed manually**: `GuestsController#create` parses a raw JSON string
  from params (`guest_params.fetch("guest_json")`) — fragile input handling, though
  ActiveRecord parameterization prevents direct SQLi.
- **Mixed content**: Google Fonts loaded over plain `http://`; analytics and CDN scripts
  (MaxCDN respond.js/html5shiv) loaded without subresource integrity.
- **Google Analytics** (`UA-80424858-1`) and Google Maps API usage without any consent
  banner (predates GDPR; would be non-compliant if redeployed in the EU).
- **No security headers**: no CSP, no HSTS, default Rails 4.2 header set only.
- Development database guidance in the README sets PostgreSQL local auth to `trust` and
  creates a `SUPERUSER` role (dev convenience, but worth flagging).

## 5. Supply chain / CI

- Travis CI configuration is dead (travis-ci.org shut down); no working CI exists.
- No Dependabot configuration file; alerts are GitHub defaults on `Gemfile.lock`.
- No branch protection assumptions are made in this assessment.

## Risk conclusion

The repository is not currently deployed (Heroku free dynos were discontinued in 2022;
the app cannot boot on supported platforms). The live risk is therefore concentrated in:

1. **Published personal/financial data** (IBAN, BIC, phone numbers) — actionable now.
2. **Vulnerable manifests on the default branch** — noise that masks real signal, and a
   real risk if anyone ever tries to `bundle install && rails s` the project.
3. **No CI/no maintenance** — any future change lands unverified.

All three are addressed by the remediation plan: replace with a static site, redact
personal data in anything newly rendered, remove the Ruby manifests from the default
branch, and add modern CI + Dependabot for the new (minimal) npm toolchain.
