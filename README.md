# Simple Web Server Demo
This example demonstrates how to use **NodePort** and **Pod** objects to deploy a Express server to the local Kubernetes cluster.

## Steps
### Downloading the project
```
$ git clone git@github.com:WISE-PaaS/simple-web-k8s.git
$ cd simple-web-k8s/
```

### Building and pushing the image
```
$ docker build -t {DOCKER_HUB_ACCOUNT}/{IMAGE_NAME}:{TAG_NAME} .
$ docker push {DOCKER_HUB_ACCOUNT}/{IMAGE_NAME}:{TAG_NAME}
```

### Applying the configurations
```
$ kubectl apply -f k8s/
```

### Checking the status
Example:
```
$ kubectl get all
NAME          READY   STATUS    RESTARTS   AGE
pod/web-pod   1/1     Running   0          55m

NAME                       TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
service/kubernetes         ClusterIP   10.96.0.1     <none>        443/TCP          21h
service/server-node-port   NodePort    10.96.0.211   <none>        3050:31515/TCP   55m
```

### Verifying the APIs

- Getting the minikube IP

  Example:
  ```
  $ minikube ip
  192.168.64.12
  ```

- Inside the browser, go to the following address using the IP that you just got. You also need to specify the port in the URL. For example, ``{minikubeIP}:31515``. Then, you should see a gretting saying "How are you doing".

- Back to the terminal, type the following command to stream the real-time logs to the STDIO.
  ```
  $ kubectl logs -f pod/web-pod

  > @ start /usr/app
  > node index.js

  Listening on port 8080

  ```
- Type the following URL in the browser: ``{minikubeIP}:31515/name/{YOUR_NAME}`` (Relace {YOUR_NAME} with your name). Then, you should see the response in the termal.
  ```
  Hi, {YOUR_NAME}!
  ```
