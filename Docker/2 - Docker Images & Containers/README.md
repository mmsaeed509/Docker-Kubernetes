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
  - `-i` for interactive
  - `-t` to allocate a pseudo TTY(terminal)

```bash
docker run -it 223960672fbf75d12a20a07c

# user input #
Please enter the min number: 23
Please enter the max number: 33

# output #
28

# restart container with attached mode (interact with the container) #
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
docker image prune -a
```
___

- Copying Files from/into a container
  - ***NOTE***: it will create the path if it doesn't exist
  - `docker cp <src> <des>`
    - for `<src>` & `<des>` container:
    - `<CONTAINER_ID:PATH or CONTAINER_NAME:PATH>`
  
```bash
# Copying Files into a container #
docker cp <src> <CONTAINER_ID:PATH or CONTAINER_NAME:PATH>


docker cp git-push.sh 246728e7b25f:/test
docker cp git-push.sh sweet_rhodes:/test

# Copying Files from a container #
docker cp <CONTAINER_ID:PATH or CONTAINER_NAME:PATH> <des>

docker cp 246728e7b25f:/test/git-push.sh ./
docker cp sweet_rhodes:/test/git-push.sh ./
```
___

### Naming Containers & Tagging Images(naming imgs)

- Naming Containers

```bash
docker run --name <name> <IMAGE_ID or IMAGE_TAG>

docker run --name nodeJSApp b211bbfa3d4a5ea
docker run -p 3000:80 --name NodeJSApp b211bbfa3d4a5ea

```
- Tagging Images
  - consist of two parts `name` & `tag` (`name`:`tag`)
    - `name` : for defining an image or a group of images
    - `tag`  : for defining a specialized image within a group of images or defining the version of an image
      - `tag` can be a word or a number, totally up to you
    - Combined them: A unique identifier

```bash
docker build . -t <name>:<tag>

docker build . -t wolf-node:latest
docker build . -t wolf-node:13

# rename image #
docker tag <old-tag> <new-tag>
docker tag <old-tag> <docker_hub_id/repo_name:tag>

docker tag wolf-node:13 mmsaeed509/wolf-node:latest
docker tag wolf-node:13 mmsaeed509/wolf-node:16
docker tag wolf-node:13 mmsaeed509/wolf-node
```
___

- Pushing Images to Docker Hub
  - login to docker
  - push the image

```bash
docker login

docker push <img-name>

docker push mmsaeed509/wolf-node:latest
```
___

- Pull Images from Docker Hub

```bash
docker pull <img-name>:<tag>

docker pull alpine # pull the latest img #
docker pull mmsaeed509/wolf-node:15
```