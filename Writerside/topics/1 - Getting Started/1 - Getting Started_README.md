```bash
# build img #
docker build .
```

docker id `2e1b68f731f5dd9a10c356a6a70ae055a47e0a9fb4cbb1813521473e01b62b92`


```bash
# run container #
docker run -p 3000:3000 2e1b68f731f5 
```

visit your localhost via any browser `http://localhost:3000/`

stop/destroy container

```bash
# list all container #
docker ps

# stop container #
docker stop condescending_goodall

```
