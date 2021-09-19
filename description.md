# Guide for deploying the Hello World Kotlin app

Using Tomas' [Dockerfile](https://github.com/Tomenos18/lab1-git-race/blob/master/Dockerfile) and [Guide for the basic Docker Deployment](https://github.com/Tomenos18/lab1-git-race/blob/master/README.md)

Requirements:

* Minikube single node cluster
* Kubectl
* Docker
* Helm

Steps to reproduce (adapted from [this tutorial](https://dev.to/gateixeira/deploying-a-spring-boot-kotlin-app-on-kubernetes-with-docker-and-helm-589p)):

* Create the following files:
  
  * `Dockerfile` in root dir
  * `/charts/values.yaml`
  * `/charts/Chart.yaml`
  * `/charts/templates/deployment.yaml`
  * `/charts/templates/service.yaml`
  
  The only difference with the original tutorial is in `values.yaml` file, where `appName` is now `demo-minikube`, and `image/registry` is now your DockerID.

* Switch Docker environment (from `Dockerfile` directory):
  * MacOS / Linux:

    ```bash
     eval $(minikube docker-env)
    ```

  * Windows:

    ```cmd
    minikube docker-env | Invoke-Expression
    ```

* Build image:

  ```bash
  docker build -t <DockerID>/demo-minikube:latest .
  ```

* Install App inside Minikube:

  ```bash
  helm upgrade --install demo-minikube charts --values charts/values.yaml
  ```

* Tunnel app to publicly accesible url:

  ```bash
  minikube service demo-minikube --url
  ```

From here, a URL specifying the localhost should appear.
