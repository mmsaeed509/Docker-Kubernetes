Commands

```Bash
# build the image docker image #
docker build -t mmsaeed509/kub-data-demo .

# push the docker image to docker hub #
docker push mmsaeed509/kub-data-demo

# start k8s #
minikube start

# launch the deployment #
kubectl apply -f deployment.yaml -f service.yaml

# open k8s dashboard #
minikube dashboard --url

# expose the service #
minikube service list
```

when running `minikube service list` if you see this error or something like this

```Bash
W1205 20:30:15.985391  140329 main.go:291] Unable to resolve the current Docker CLI context "default": context "default": context not found: open /home/o0xwolf/.docker/contexts/meta/37a8eec1ce19687d132fe29051dca629d164e2c4958ba141d5f4133a33f0688f/meta.json: no such file or directory
```

run

```Bash
docker context use default
# clean #
kubectl delete -f deployment.yaml -f service.yaml
```

clean

```Bash
kubectl delete -f deployment.yaml -f service.yaml
```