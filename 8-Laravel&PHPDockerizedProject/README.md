### Complex Setup: A Laravel & PHP Dockerized Project

test `composer` container 

```Bash
docker compose run --rm  composer create-project --prefer-dist laravel/laravel . 
```

test our services

```Bash
docker compose up -d server php mysql

# or #
docker compose up -d server

# use `--build` to force rebuild if something changed  #
docker compose up -d --build server
```
