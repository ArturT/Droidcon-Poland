# Droidcon Poland

Conference Website
[http://droidcon.pl](http://droidcon.pl)

Master branch [![Build Status](https://api.shippable.com/projects/540e77c53479c5ea8f9e91dd/badge?branchName=master)](https://app.shippable.com/projects/540e77c53479c5ea8f9e91dd/builds/latest)

Production branch [![Build Status](https://api.shippable.com/projects/540e77c53479c5ea8f9e91dd/badge?branchName=production)](https://app.shippable.com/projects/540e77c53479c5ea8f9e91dd/builds/latest)

See difference between [production and master](https://github.com/ArturT/Droidcon-Poland/compare/production...master).


# Development

## What do I need?

You need ruby. You can use [Ruby Version Manager (RVM)](http://rvm.io) with latest ruby version:

    $ \curl -sSL https://get.rvm.io | bash -s stable

Install [Bundler](http://bundler.io):

    $ gem install bundler

You need MySQL.

## Set up project on your machine

    $ git clone git@github.com:ArturT/Droidcon-Poland.git
    $ cd Droidcon-Poland

    $ cp config/database.yml.example config/database.yml
    # Update your username and password for MySQL in config/database.yml file

    # install gems
    $ bundle install

    # create database
    $ bundle exec rake db:create

    # run db migrations
    $ bundle exec rake db:migrate

    # run db migrations for test database
    $ RAILS_ENV=test bundle exec rake db:migrate

    # run seed - it will create an admin user
    # login: admin@example.com
    # password: password
    # http://0.0.0.0:3000/admin
    # It will create fake rooms, speakers and schedules too.
    $ bundle exec rake db:seed

## How to clean

If you want to remove records created by seeds you can use this rake task `lib/taks/clean.rake`:

    $ bundle exec rake app:clean

You can also run this to clean records and run new seeds:

    $ bin/reset_seed

## How to run tests

    $ bundle exec rspec spec

## How to run rails sever

    $ bundle exec rails server

Open in your browser [http://0.0.0.0:3000](http://0.0.0.0:3000).

## Carrierwave gem requires

    # MacOS
    $ brew install imagemagick
    $ brew install gs

    # Ubuntu
    $ sudo apt-get install imagemagick

# Front-end changes

Application is using [Zurb Foundation](http://foundation.zurb.com/docs/) framework. Keep it in mind during html changes.

# Continuous Integration

If you have access to this repository you can sign in to [shippable.com](https://shippable.com) with github account then you will see the project's builds.

# Production

Set ENVs. Generate them with `rake secret`.

    ENV['SECRET_TOKEN']
    ENV['DEVISE_SECRET_KEY']

Check `scripts/examples` directory.


# Deploy

## Manual deploy

Your ssh key should be on server.

    $ cap production deploy

## Run db migrations

    $ cap production deploy:migrate


## Autodeploy

Please merge master into production branch. App will be deployed to production if tests pass.

You can use [bin/publish](bin/publish) script to do that:

    $ bin/publish


## Other helpful commands

Start or stop unicorn server:

    $ cap production unicorn:start
    $ cap production unicorn:stop


# API

Change `en` to other language to get localized data.

    GET /en/api/v1/speakers
    GET /en/api/v1/rooms
    GET /en/api/v1/schedules
    # schedules with speaker and room data
    GET /en/api/v1/schedules/extra
    GET /en/api/v1/brands

# Digital Ocean server configuration

See `/etc/nginx/sites-enabled/2014.droidcon.pl`
