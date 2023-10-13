- interact with the container

```bash
docker run -it node
```
- To see the file size of your containers

```bash
docker ps -a --size
```
- list all containers

```bash

# list running containers
docker ps

# list all containers
docker ps -a

# list all containers with the size for each container
docker ps -a --size

# list all available options
docker ps --help

```
- run / start / stop container

```bash

# stop container
docker stop <CONTAINER_ID or CONTAINER_NAME>
docker stop 246728e7b25f
docker stop sharp_albattani

# start an existing container
docker start <CONTAINER_ID or CONTAINER_NAME>
docker start 246728e7b25f
docker start sharp_albattani

# create a new container based on an image and start it
docker run <IMAGE_ID or IMAGE_TAG>
docker run b211bbfa3d
docker run -p 80:80 b211bbfa3d

```