# Droidcon Poland

Conference Website


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

Your ssh key should be on server.

    $ cap production deploy


# API

    GET /api/speakers
    GET /api/schedules
    GET /api/rooms
