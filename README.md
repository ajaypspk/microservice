# microservice
### Build container image 
```bash
$ docker build -t ajaypspk/microservice .
Sending build context to Docker daemon  32.08MB
Step 1/4 : FROM openjdk:11.0.8-jre-slim
 ---> a982abd9eead
Step 2/4 : COPY microservice.jar /usr/app/microservice.jar
 ---> Using cache
 ---> acf00e726a78
Step 3/4 : EXPOSE 8080
 ---> Using cache
 ---> 5f8f548ae1bf
Step 4/4 : ENTRYPOINT ["java","-jar","/usr/app/microservice.jar"]
 ---> Using cache
 ---> a3826f555d65
Successfully built a3826f555d65
```

### Push container image to dockerhub
```bash
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: ajaypspk
Password:
WARNING! Your password will be stored unencrypted in /home/anandnevase01/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store


$ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
ajaypspk/microservice   latest              a3826f555d65        1 hours ago         221MB
openjdk                 11.0.8-jre-slim     a982abd9eead        2 days ago          204MB 

$ docker push ajaypspk/microservice:latest
```

### Deploy image using helm chart

```bash
$ cd helm-deployment/microservice/

$ helm lint .
==> Linting .
[INFO] Chart.yaml: icon is recommended

1 chart(s) linted, 0 chart(s) failed


$ helm upgrade --install microservice .
Release "microservice" does not exist. Installing it now.
NAME: microservice
LAST DEPLOYED: Sat Sep 12 13:29:40 2020
NAMESPACE: hello
STATUS: deployed
REVISION: 1

$ kubectl get po
NAME                            READY     STATUS    RESTARTS   AGE
microservice-7bf776f9dc-xwp49   1/1       Running   0          1m

$ kubectl get svc
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP                   PORT(S)          AGE
microservice   LoadBalancer   172.30.189.61   172.29.68.108,172.29.68.108   8080:31207/TCP   5m
```
