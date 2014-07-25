# Droidcon Poland

[![Build Status](https://api.shippable.com/projects/53d2cc3b35ad6c640220fa87/badge/master)](https://www.shippable.com/projects/53d2cc3b35ad6c640220fa87)

Conference Website
[http://droidcon.pl](http://droidcon.pl)


# Development - setup project

    $ cp config/database.yml.example config/database.yml


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


## Tips

Remove `admin@example.com` user with password `password` after deploy to production.


# Deploy

## Manual deploy

Your ssh key should be on server.

    $ cap production deploy

## Autodeploy

Please merge master into production branch. App will be deployed to production if tests pass.


# API

    GET /api/speakers
    GET /api/schedules
    GET /api/rooms
