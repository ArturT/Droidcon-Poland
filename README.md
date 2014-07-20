# Droidcon Poland

Conference Website


# Development env

    /config/database.yml.example.mysql


## Carrierwave gem requires

    # MacOS
    $ brew install imagemagick
    $ brew install gs

    # Ubuntu
    $ sudo apt-get install imagemagick


# Production env

Set ENVs. Generate them with `rake secret`.

    ENV['SECRET_TOKEN']
    ENV['DEVISE_SECRET_KEY']


## Tips

Remove `admin@example.com` user with password `password` after deploy to production.


# API

    /api/speakers
    /api/schedules
    /api/rooms


# Deploy

Your ssh key should be on server.

    $ cap production deploy
