### commands

```Bash
docker build -t kub-1-app-img .

kubectl create deployment first-app --image=mmsaeed509/kub-1-app-img

kubectl expose deployment first-app --type=LoadBalancer --port=8080

kubectl get services

minikube service first-app

kubectl scale deployment/first-app --replicas=5 
```
