Test the Deployment

```Bash
# --build to rebuild the image
docker compose up -d --build
```

if this error occurs

```Bash
[+] Building 0.6s (3/3) FINISHED                                                                                                                                                                                    docker:default
 => [stories internal] load build definition from Dockerfile                                                                                                                                                                  0.1s
 => => transferring dockerfile: 471B                                                                                                                                                                                          0.0s
 => [stories internal] load .dockerignore                                                                                                                                                                                     0.1s
 => => transferring context: 68B                                                                                                                                                                                              0.0s
 => ERROR [stories internal] load metadata for docker.io/library/node:14-alpine                                                                                                                                               0.4s
------
 > [stories internal] load metadata for docker.io/library/node:14-alpine:
------
failed to solve: node:14-alpine: error getting credentials - err: exit status 1, out: `error getting credentials - err: exit status 1, out: `no usernames for https://index.docker.io/v1/``
```

run 

```Bash
docker pull node:14-alpine
docker compose up -d --build
docker compose down
```
