to execute command inside the container use `dokcer exec`

```Bash
docker exec -it <container_name> <command>
docker exec -it node-react npm init
```

we used `-it` to interact with the container(to answer all questions form npm) 
