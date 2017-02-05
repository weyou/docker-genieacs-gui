# Environment variables

* SECRET_KEY_BASE: 32 characters random alphanumeric string.
* PORT
* REDIS_HOST
* REDIS_PORT
* GENIEACS_API_HOST: GeniaACS host
* GENIEACS_API_PORT: GenieACS NBI port
* RAILS_ENV: production

# User configuration

You could use a text file to save user configuration. An example, 

```
admin:
    password: admin
    roles: [admin]
user:
    password: user
    roles: [view]
```

and share this information with the container using a volume mapping this file to `/config/users.yml`.

# Example usage

```
# docker run --name genieacs-GUI \
    -e SECRET_KEY_BASE=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX \
    PORT=3000 REDIS_HOST=redis.host REDIS_PORT=6379 \
    GENIEACS_API_HOST=genieacs.host GENIEACS_API_PORT=7557 \
    RAILS_ENV=production \
    -p 3000:3000 \
    -v ./config/users.yml:/config/users.yml \
    -d genieacs-gui
```

