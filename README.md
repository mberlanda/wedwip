# WedWip


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