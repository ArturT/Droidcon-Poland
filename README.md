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

Set `ENV['SECRET_TOKEN']`. Generate it with `rake secret`.


## Tips

Remove `admin@example.com` user with password `password` after deploy to production.


# API

    /api/speakers
    /api/schedules
    /api/rooms


# Deploy

Not yet.
