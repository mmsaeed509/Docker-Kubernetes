### Docker Compose

Docker Compose: is a tool that allows you to replace `docker build` and `docker run` commands,
and they're not just one `docker build` and `docker run` commands, but potentially multiple `docker build` and `docker run` commands
with just one configuration file(`compose.yaml`), and then a set of orchestration commands to start all those services, 
all these containers at once and build all necessary images, if it should be required.

and you then also can use one command to stop everything and bring everything down.

>_NOTE:_
> 
> you can use docker compose to run one container

>_What Docker Compose is NOT:_
>
> - Docker Compose does **NOT** replace `Dockerfiles` for custom Images
> - Docker Compose does **NOT** replace Images or Containers
> - Docker Compose is **NOT** suited for managing multiple containers on
**different hosts** (machines)

>_NOTE:_
>
> we don't have to create a network as **docker compose** create automatically network for all services(containers) 
> and configure it out of the box for all services(containers)
> 
> also, you can add you network.

start all services(containers)
```Bash
docker compose up

# run in detached mode #
docker compose up -d
```
___

stop all services(containers)
removing all containers and network
to remove volumes use `-v`

```Bash
docker compose down

# clean up with removing all volumes #
docker compose down -v
```
