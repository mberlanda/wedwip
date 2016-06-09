# WedWip

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e997b7a95b0b4a3096d7291bfcac6ce7)](https://www.codacy.com/app/m-berlanda/wedwip?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mberlanda/wedwip&amp;utm_campaign=Badge_Grade)
[![Code Climate](https://codeclimate.com/github/mberlanda/wedwip/badges/gpa.svg)](https://codeclimate.com/github/mberlanda/wedwip)
[![Build Status](https://travis-ci.org/mberlanda/wedwip.svg?branch=master)](https://travis-ci.org/mberlanda/wedwip)

The purpose of this application is to create a template for a wedding website.

### How to setup your [postgresql db](http://www.postgresql.org/download/linux/ubuntu/)

```bash
sudo apt-get install postgresql-9.4
sudo apt-get install libpq-dev
sudo su postgres -c psql
CREATE USER user WITH PASSWORD 'password' SUPERUSER;
sudo vim /etc/postgresql/9.4/main/pg_hba.conf
# change from 
   local   all             all                                peer
# to
   local   all             all                                trust
sudo service postgresql restart
```

### How to setup [devise]()
```bash

rails generate devise:install

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

rails generate devise MODEL
```

### Add CloudMailIn to Heroku to send emails
```
https://elements.heroku.com/addons/cloudmailin
```

### I18n
```
rake i18n:js:export
```