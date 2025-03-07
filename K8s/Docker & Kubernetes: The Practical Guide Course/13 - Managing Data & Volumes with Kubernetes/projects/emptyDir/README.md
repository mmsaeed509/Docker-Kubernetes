### emptyDir in Kubernetes

The `emptyDir` volume type in Kubernetes is a simple, ephemeral storage option that is created and tied to a Pod's lifecycle. It is primarily used for sharing data between containers within the same Pod.
> So, this volume is still alive, and it contains data. If the container restarts, the data will be retained, but it will be removed when removing the pod.

#### Key Characteristics:

- **Ephemeral Storage:** The data stored in an `emptyDir` volume is transient and is deleted when the Pod is terminated or rescheduled.

- **Pod-Level Scope:** The `emptyDir` volume is shared among all containers within the same Pod, making it suitable for communication or data exchange between these containers.

- **Storage Medium:** It is backed by the underlying storage of the node where the Pod is running. As a result, the performance characteristics are dependent on the node's storage.

#### Use Cases:

- **Inter-Container Communication:** Containers within a Pod can use `emptyDir` to share files or data during the Pod's lifetime.

- **Temporary Storage:** Useful for storing temporary data or cache that can be regenerated if lost.

#### Example YAML Snippet:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: container1
    image: nginx
    volumeMounts:
    - name: shared-data
      mountPath: /data
  - name: container2
    image: busybox
    volumeMounts:
    - name: shared-data
      mountPath: /data
  volumes:
  - name: shared-data
    emptyDir: {}
```

In this example, both `container1` and `container2` share an `emptyDir` volume named `shared-data`, allowing them to exchange data at the `/data` path.


This Markdown provides a concise overview of `emptyDir` in Kubernetes, its characteristics, use cases, and a simple YAML example.

___

Hands-on

```Bash
# build the image docker image #
docker build -t mmsaeed509/kub-data-demo-emptydir:v1 .

# push the docker image to docker hub #
docker push mmsaeed509/kub-data-demo-emptydir:v1

# start k8s #
minikube start

# launch the deployment #
kubectl apply -f deployment.yaml -f service.yaml

# open k8s dashboard #
minikube dashboard --url

# expose the service #
minikube service list

# clean #
kubectl delete -f deployment.yaml -f service.yaml
```
