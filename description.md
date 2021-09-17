Guide for deploying the Hello World Kotlin app.

Using Tomas' [Dockerfile](https://github.com/Tomenos18/lab1-git-race/blob/master/Dockerfile) and [Guide for the basic Docker Deployment] (https://github.com/Tomenos18/lab1-git-race/blob/master/README.md)

Requirements:
* Minikube single node cluster
* Kubectl 
* Docker
* Helm

Steps to reproduce (Adapted from [this tutorial](https://dev.to/gateixeira/deploying-a-spring-boot-kotlin-app-on-kubernetes-with-docker-and-helm-589p)):

* Create the following files:
  
  * Dockerfile in root dir
  * /charts/values.yaml
  * /charts/Chart.yaml
  * /charts/templates/deployment.yaml
  * /charts/templates/service.yaml
  
  Only difference with the original tutorial is values.yaml, where appName is now demo-minikube, and image/registry is now your DockerID.

* Switch Docker environment (From Dockerfile directory):
  * MacOS / Linux: `eval $(minikube docker-env)`
  * Windows: `minikube docker-env | Invoke-Expression`

* Build image: `docker build -t <DockerID>/demo-minikube:latest .`
* Install App inside Minikube: `helm upgrade --install demo-minikube charts --values charts/values.yaml`
* Tunnel app to publicly accesible url: `minikube service demo-minikube --url`

From here, a URL specifying the localhost should appear.
