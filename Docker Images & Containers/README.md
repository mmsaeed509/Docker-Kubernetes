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
- Attaching to an already-running Container

By default, if you run a Container without `-d`, you run in "attached mode".

If you started a container in detached mode (i.e. with `-d`), you can still attach to it afterwards without restarting the Container with the following command:

```bash
docker attach <CONTAINER_ID or CONTAINER_NAME>

docker attach 246728e7b25f
docker attach sharp_albattani
```
attaches you to a running Container with an ID or name of `CONTAINER`.

___

- interact with the container `rng.py`
  - `-i` for interactve
  - `-t` to allocate a pseudo TTY(terminal)

```bash
docker run -it 223960672fbf75d12a20a07c

# user input #
Please enter the min number: 23
Please enter the max number: 33

# output #
28

# restart container with attaced mode (interact with the container) #
docker start -ai <CONTAINER_ID or CONTAINER_NAME>

docker start -ai 1ec44b011c54
docker start -ai laughing_shannon
```
___

- remove container
  - ***NOTE***: the container should be stopped
  
```bash
# remove container #
docker rm <CONTAINER_ID or CONTAINER_NAME>

docker rm 3d5b87482717
docker rm priceless_archimedes

# or
docker container rm <CONTAINER_ID or CONTAINER_NAME>

docker container rm 246728e7b25f
docker container rm sweet_rhodes

# remove all stopped containers #
docker container prune

# remove container Automatically when it stopped #
docker run -p 3000:3000 2e1b68f731f5 --rm
```
___

- remove images
  - ***NOTE***: the container that uses the image must be removed

```bash
# list all images #
docker image ls -a
# or
docker images

docker rmi <IMAGE_ID or IMAGE_TAG>
docker rmi 2e1b68f731f5

# remove unused images #
docker image prune
```