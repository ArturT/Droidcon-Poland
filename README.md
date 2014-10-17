# Droidcon Poland

[![Build Status](https://api.shippable.com/projects/540e77c53479c5ea8f9e91dd/badge?branchName=master)](https://app.shippable.com/projects/540e77c53479c5ea8f9e91dd/builds/latest)

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

Check `scripts/examples` directory.


## Tips

Remove `admin@example.com` user with password `password` after deploy to production.


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
