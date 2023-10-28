- create a network for containers

```Bash
docker network create goals-network
```

- run mongodb container

```Bash
# download mongodb img #
docker pull mongo

# run mongodb container #
docker run --name mongodb -v data:/data/db \
-e MONGO_INITDB_ROOT_USERNAME=root \
-e MONGO_INITDB_ROOT_PASSWORD=secret \
--rm -d --network goals-network mongo
```

- run backend container

```Bash
# build backend img #
docker build ./backend -t goals-node 

# run backend container #
docker run --name goals-backend --rm -d -p 80:80 \
-v "$(pwd)/backend":/app -v logs:/app/logs \
-v /app/node_modules \
-e MONGODB_USERNAME=root \
-e MONGODB_PASSWORD=secret \
--network goals-network goals-node
```

- run frontend container

```Bash
# build frontend img #
docker build ./frontend -t goals-react 

# run frontend container #
docker run --name goals-frontend --rm -it -p 3000:3000 \
-v "$(pwd)/frontend/src":/app/src -v /app/node_modules \
goals-react
```

- clean up

```Bash
# list all running containers  #
docker ps -a
# remove all containers #
docker stop goals-frontend goals-backend mongodb

# list all volume  #
docker volume ls 
# remove all volume #
docker volume prune -a
# or
docker volume rm data logs

# list all images  #
docker image ls -a
# or
docker images
# remove all images #
docker image prune -a
```
