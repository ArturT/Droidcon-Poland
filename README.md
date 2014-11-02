# Droidcon Poland

[![Build Status](https://api.shippable.com/projects/540e77c53479c5ea8f9e91dd/badge?branchName=master)](https://app.shippable.com/projects/540e77c53479c5ea8f9e91dd/builds/latest)

Conference Website
[http://droidcon.pl](http://droidcon.pl)


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
    $ bundle exec rake db:seed

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


# Production

Set ENVs. Generate them with `rake secret`.

    ENV['SECRET_TOKEN']
    ENV['DEVISE_SECRET_KEY']

Check `scripts/examples` directory.


# Deploy

## Manual deploy

Your ssh key should be on server.

    $ cap production deploy


## Autodeploy

Please merge master into production branch. App will be deployed to production if tests pass.


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
