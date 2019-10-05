---
layout: default
title: Kubernetes
nav_order: 7
has_children: true
has_toc: true
---

# Kubernetes
Before we deep dive into **Kubernetes** we need to understand what is a Container (with Docker) , why we use it.

## What is Docker Container
Containers are a type of software that can virtually package and isolate applications for deployment. It shared the underlying OS and resources rather than running it's own

- Logical isolation of underlying OS Resources like CPU , RAM ,Network
- Provides Process Isolation , Network Interface , IPC , Filesystem Mounts (Data volumets) and Isolation on Kernel  

- We should be aware that , Container
  -  Provides service isolation between containers (inherently processes and software packages)
  -  Provides consistent Runtime with Low Overhead
  -  Container have limited resource
  
- Containers are Running instance of an Image
  - An ***image*** is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

- Read more on Containers on
  - [Google Article](https://cloud.google.com/containers/)
  - [TechTarget Blogs](https://searchitoperations.techtarget.com/definition/container-containerization-or-container-based-virtualization)

## Some Mictoservice Architecture Patterns
It's essential to understand below patterns as K8s has been built to natively support it.
- ***Scalability*** , Scaling of Process (**Horizontal Scalling**) as needed
- ***Availability*** , Automatically recover from faliure of service/process
- ***Service Discovery*** , How a service discover another service's instance which is healthy to call
- ***Reliability*** , Revover from service failures. Enter **Self Healing** , **Health Check** and most importantly  **Automatic Rollouts**
- ***Observability*** , some aspects are supported nativily namely **Health Check** at least in a Primitive way
- And many more...
  
## Application Architecture on Kubernetes
How Application Architecture is comparable to VM as well as Netflix based Microservice

### "Processes on VMs" vs "Microservice on K8s"


![Architecture Shift](https://raw.githubusercontent.com/atishch/handbook/master/assets/k8s/compare-traditional-arch.png)

### "Microservice on PCF with Netflix OSS" vs "Microservice on K8s"

![Microservice Architecture](https://raw.githubusercontent.com/atishch/handbook/master/assets/k8s/pcfnetflix-vs-k8s.png)



- K8s provides Platform resources (Container,Service,Configuration,Volume Mounts,..) as a Service and it can be enabled by calling API and defining **Object Spec** 
- Benefits of using K8s
  - Workload Scalability by providing easy Horizontal infrastructure scaling , Auto-scaling
  - Decoupled microservice architectures by providing Namespace , Service and Pod/Container isolation
  - Abstraction of Infrastructure by allowing custom **Ingress Controller** and **Load Balancer**
  - Self Healing Systems
  - And more... DNS management, resource monitoring, Secrets Management , logging and storage orchestration

## How to provide Object Spec

- Object Specs are described via a yaml file 
- Each Specs should have apiVersion , type and name along with the desired state Specification
- Kubernetes takes care of making necessary changes to achieve that desired state
- An yaml file can be run to create the K8s object via `kubectl apply -f file_name.yaml` 
- A sample yaml  definition file looks as below

```yaml
apiVersion: v1 #K8s API version. (mandatory)
kind: Pod #K8s object type. (mandatory)
metadata:
  name: example-app #Name of the Pod.(mandatory) Each resource's unique identifier
spec: #Detailed specification for Resource kind (mandatory) 
```
## Namespance
Before we start using K8s we need to have our own **Namespace** on the Cluster

- Namespaces are a way to divide cluster resources between multiple users/teams
- Each Namespance have allocaed quota on Memory and CPU. Also have certain permission on what K8s Resorces it can create/use
- Resources in namespace can be found by `kubectl api-resources --namespaced=true`
