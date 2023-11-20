### 12 - Kubernetes in Action - Diving into the Core Concepts

![](./imgs/Core.png)

- build the image

```Bash
docker build -t kub-1-app-img .
```

- create a deployment object (imperative approach)

```Bash
# retag the img #
docker tag kub-1-app-img mmsaeed509/kub-1-app-img

# push the img to registry #
docker push mmsaeed509/kub-1-app-img 

kubectl create deployment first-app --image=mmsaeed509/kub-1-app-img
```

- create a new service object to Exposes Pods to the Cluster or Externally(imperative approach)
    - e.g: to open the app(website) via browser
    - `--type`
        - `--type=ClusterIP` is the default type which basically means it will **only**  be reachable inside the cluster
        - `--type=NodePort` means this deployment should be exposes with help off the IP address of the worker node on which it's running, distant actually would be accessible from outside.
        - `--type=LoadBalancer` utilizes a LoadBalancer which has to exist in the infrastructure on which our cluster runs, this LoadBalancer will generate a unique address for this service and distribute incoming traffic across all pods.
            - > **_NOTE:_** it's only available if your cluster and infrastructure supports it.


```Bash
$ kubectl expose deployment first-app --type=LoadBalancer --port=8080
service/first-app exposed

# list all services
$ kubectl get services
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
first-app    LoadBalancer   10.98.223.29   <pending>     8080:31204/TCP   53s
kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          3d15h

# to access the app
$ minikube service first-app
|-----------|-----------|-------------|---------------------------|
| NAMESPACE |   NAME    | TARGET PORT |            URL            |
|-----------|-----------|-------------|---------------------------|
| default   | first-app |        8080 | http://192.168.49.2:31204 |
|-----------|-----------|-------------|---------------------------|
🎉  Opening service default/first-app in default browser...
```
- Scaling
  - a **Replica** is simply an instance of a pod/container.
  - `5` **Replica** means that the same pod/container is running 3 times

```Bash
kubectl scale deployment/first-app --replicas=5 
```

- update deployments (e.g the image is updated)
  - `kubectl set image <deployment_name> <container_name>=<new_image_name>`
  - `kubectl set image deployment/first-app kub-1-app-img=mmsaeed509/kub-1-app-img`

```Bash
kubectl set image deployment/first-app kub-1-app-img=mmsaeed509/kub-1-app-img
# roll out the deployment #
kubectl rollout status deployment/first-app
```
