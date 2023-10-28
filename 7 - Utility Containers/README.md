to execute command inside the container use `dokcer exec`

```Bash
docker exec -it <container_name> <command>
docker exec -it node-react npm init
```

we used `-it` to interact with the container(to answer all questions form npm) 

---
using utility with Docker compose

```Docker
FROM node:14-alpine

WORKDIR /app

ENTRYPOINT ["npm"]
```

```yaml
version: "3.8"
services:
  npm:
    build: ./
    stdin_open: true
    tty: true
    volumes:
      - ./:/app
```

when using docker compose instead of using `docker compose up`(`docker compose up init`) we use 

- using `exec`
  - `docker compose exec <command>`

```Bash
docker compose exec init
```

- using `run`
    - `docker compose run <service_name> <command>`

```Bash
docker compose run npm init
```
