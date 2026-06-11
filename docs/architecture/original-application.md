# Original Application Architecture (2016)

`wedwip` ("Wedding Work In Progress") was the wedding website of Mauro & Beatrice,
married on **1 October 2016**. It was a single-page-style dynamic website where invited
guests registered, confirmed attendance (RSVP), suggested honeymoon stops and music, and
left messages for the couple. This document describes the application as it was built in
2016, for historical reference now that the dynamic application is retired.

## Stack

| Layer | Technology | Version |
|-------|-----------|---------|
| Language | Ruby | 2.2.1 |
| Framework | Ruby on Rails | 4.2.6 |
| App server | Puma | (Gemfile, unpinned) |
| Database | PostgreSQL | 9.4 |
| Templates | Haml (`haml-rails`) | — |
| Auth | Devise | (unpinned) |
| Forms | simple_form | — |
| Decorators | Draper | — |
| JS i18n | i18n-js | github master |
| Asset pipeline | Sprockets + sass-rails + uglifier + coffee-rails | — |
| Frontend | jQuery 1.11.0, Bootstrap 3.3.5, "Vitality" theme | vendored |
| Hosting | Heroku (`Procfile`, `rails_12factor`) | — |
| CI | Travis CI | Ruby 2.2.1 + PostgreSQL 9.4 |
| Code quality | Codacy, Code Climate, RuboCop, ESLint, csslint | — |
| Tests | RSpec (`rspec-rails` ~> 3.0), Capybara | — |

A `dropbox-sdk` gem is declared in the Gemfile (intended for photo uploads) but is not
used anywhere in the application code.

## Request flow

```
Browser ──> Heroku (Puma) ──> Rails 4.2 ──> PostgreSQL 9.4
                                │
                                ├─ Devise (authentication, registration, password reset)
                                ├─ StaticPagesController#home  (the whole site, auth-gated)
                                ├─ Guests / Messages / Places  (JSON endpoints + datatables)
                                └─ Sprockets asset pipeline (vendored theme assets)
```

The site is effectively a **single page** (`static_pages#home`) rendered server-side from
Haml partials, with jQuery making JSON calls back to the Rails controllers for the
dynamic features. **The entire home page required login** (`before_action
:authenticate_user!`); anonymous visitors only saw the Devise login/registration screens.

## Routing

All public routes are wrapped in an optional `(:locale)` scope (`/en|it/`, default `it`):

- `root` → `static_pages#home`
- Devise (`users`): custom paths — `login`, `logout`, `secret` (password), `register`,
  with overridden `passwords`, `registrations` and `sessions` controllers
- `guests`, `messages`, `places`:
  - localized `index` views (datatable listings for the couple)
  - unlocalized `create` (+ `destroy` for guests) JSON endpoints used by the home page
  - `GET …/datatable_list` JSON collection endpoints
- `users#check` (async email existence check used by the password-reset flow) and
  `users#update_password`

## Data model

```
users ──< guests        (RSVP: name, surname; unique [name, surname]; capitalized on save)
      ──< messages      (text, phone_number)
      ──< places        (marker jsonb, address, reason — honeymoon suggestions from Google Maps)
```

`users` is the standard Devise table (database_authenticatable, registerable,
recoverable, rememberable, trackable, validatable). Each invited household registered
its own account; guests/messages/places rows belong to the registering user.

Schema version: `20160613063039` (7 migrations, April–June 2016).

## Server-side components

- **Controllers** (`app/controllers/`)
  - `ApplicationController`: CSRF protection (`:exception`), `set_locale` from params.
  - `StaticPagesController#home`: loads the current user's guests and all place markers.
  - `GuestsController`: JSON create/destroy of the current user's RSVP'd guests
    (client sends a JSON string in `guest_json`).
  - `MessagesController`, `PlacesController`: JSON `create` endpoints.
  - `Users::*`: Devise overrides (sessions, registrations, passwords) plus
    `UsersController#check` / `#update_password`.
  - `DatatableList` concern: generic `datatable_list` action resolving model and Draper
    decorator by controller name and rendering `shared/search.json.jbuilder`.
- **Decorators** (`app/decorators/`): `GuestDecorator`, `MessageDecorator`,
  `PlaceDecorator` format rows for the jQuery DataTables admin listings.
- **Helpers**: `HtmlHelper`, `ApplicationHelper` (includes `is_root?` used by the navbar).
- **lib/**: `datatables_decorators.rb` plus Haml scaffold templates.

## Internationalization

Full IT/EN duplication via the `(:locale)` URL scope. `config.i18n.default_locale = :it`.
Locale files are split by concern: `config/locales/{layouts,models,views/*}/{en,it}.yml`
plus Devise and simple_form dictionaries. `i18n-js` exposed translations to JavaScript.

## Mail

Devise mailers (password reset etc.) with views overridden under
`app/views/devise/mailer/`. No custom mailers.

## Testing & CI

RSpec + Capybara under `spec/`; Travis CI ran migrations and the default rake task
against PostgreSQL 9.4 on Ruby 2.2.1. Badges: Codacy, Code Climate, Travis.

## Deployment

Heroku: `Procfile` (`puma -t 5:5 -p $PORT`), `rails_12factor` for logging/static assets,
`SECRET_KEY_BASE` from the environment in production. Database provisioning documented in
the original README (PostgreSQL 9.4 with `trust` local auth — development convenience).

## Third-party integrations

- **Google Analytics** (`UA-80424858-1`) inline snippet in the layout.
- **Google Maps JavaScript API + Places** for the honeymoon "suggest a stop" search box.
- **Spotify** embedded playlist iframe + public playlist link.
- **PayPal** donate button (disabled before the wedding due to fees; replaced by a bank
  transfer IBAN displayed on the page).
- **Google Fonts** (Roboto, Raleway, Montserrat, Cardo, Sanchez) loaded over `http://`.
