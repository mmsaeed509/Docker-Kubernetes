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

___

`CMD` and `ENTRYPOINT` are both instructions used in Docker to specify how a container should behave when it is run, but they serve different purposes and have distinct characteristics:

1. CMD:

  - The `CMD` instruction is used to provide default arguments for an executable when the container is run. It specifies the command to run within the container, along with any arguments. These arguments can be overridden when the container is started.

  - The `CMD` instruction is typically used to define the main application that should run inside the container.

  - If the Dockerfile contains multiple `CMD` instructions, only the last one takes effect, as it will overwrite any previous `CMD` instructions.

  - The `CMD` instruction can be overridden when starting the container using the `docker run` command by specifying a new command and its arguments as parameters.

  - Example:
    ```Dockerfile
    CMD ["python", "app.py"]
    ```

2. ENTRYPOINT:

  - The `ENTRYPOINT` instruction is used to set the primary command that should be executed when the container starts. It also allows you to provide default arguments that can be overridden when the container is run.

  - When `ENTRYPOINT` is used, any command-line arguments passed when running the container are treated as arguments to the `ENTRYPOINT` command.

  - The `CMD` instruction can be used in conjunction with `ENTRYPOINT`. When both are present in a Dockerfile, the `CMD` arguments will be appended to the `ENTRYPOINT` command, allowing you to create a more flexible container where the primary command is defined by `ENTRYPOINT`, and additional arguments can be provided using `CMD`.

  - Example:
    ```Dockerfile
    ENTRYPOINT ["python", "app.py"]
    CMD ["--debug"]
    ```

In summary, the key difference is that `CMD` is used to specify the default command and arguments for a container, while `ENTRYPOINT` is used to define the main executable command that should run when the container starts, and `CMD` can be used to provide default arguments. You can override both `CMD` and `ENTRYPOINT` when running a container if needed, allowing for flexibility and customization.

<ins>For Example:</ins>

`ENTRYPOINT` allows you to run the command `init` instead of `npm init`, or `install` instead of `npm install` as we set `ENTRYPOINT ["npm"]`
