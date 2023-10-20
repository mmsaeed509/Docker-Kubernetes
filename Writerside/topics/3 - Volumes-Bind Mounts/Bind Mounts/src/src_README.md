
```bash
docker build . -t feedback:volumes

docker run -p 3000:80 -d --name feedback-app-volumes -v feedback:/app/feedback -v /home/o0xwolf/GitHub/Docker-Kubernetes/3\ -\ Volumes-Bind\ Mounts/Bind\ Mounts/src:/app  feedback:volumes
```
or you can add the path via: 
- macOS / Linux `-v $(pwd):/app`
- Windows: `-v "%cd%":/app`
> **_NOTE:_** 
> 
> **recommend using `""` double quote to give the absolute path to avoid any error that occurs, as the path may contain a special character (e.g space)
> e.g `-v "$(pwd)":/app`.**


```bash
docker run -p 3000:80 -d --name feedback-app-volumes -v feedback:/app/feedback -v $(pwd):/app  feedback:volumes
```

add annonymous volume for node modules(needed pkgs) to prevent overwriting

```bash
-v /app/node_modules
```
or

add this to Dockerfile
  
```Dockerfile
VOLUME [ "/app/node_modules" ]
```

finally!!

```bash
docker run -p 3000:80 -d --name feedback-app-volumes -v feedback:/app/feedback -v "$(pwd)":/app -v /app/node_modules feedback:volumes
```
