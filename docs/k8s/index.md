---
layout: default
title: Kubernetes
nav_order: 7
has_children: true
has_toc: true
---

# Kubernetes
>Before we Understand we need to understand how Container (with Docker) works

## What is Docker Container
>Containers are a type of software that can virtually package and isolate applications for deployment. It shared the underlying OS and resources rather than running it's own

- It created a logical isolation of underlying OS Resources like CPU , RAM ,Network and provides Process Isolation , Network Interface , IPC , Filesystem Mounts and Isolation on Kernel   Data Volumets  

- Containers are Running instance of an Image. An image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

- We should be aware that , It
  -  Provide service isolation between containers
  -  Provides consisten Runtime with Low Overhead
  -  Container have limited resource access

- Read more on Containers on
  - [Google Article](https://cloud.google.com/containers/)
  - [TechTarget Blogs](https://searchitoperations.techtarget.com/definition/container-containerization-or-container-based-virtualization)

### Application Architecture on Kubernetes
>How Application Architecture is comparable to VM
![Architecture Shift](https://raw.githubusercontent.com/atishch/handbook/master/assets/k8s/compare-traditional-arch.png)

- K8s provides Platform resources (Container,Service,Configuration,Volume Mounts,..) as a Service and it can be enabled via **Resource Definition** 

### Resource Definition

A sample yaml definition file looks as below
```yaml
apiVersion: v1 #K8s API version. (mandatory)
kind: Pod #K8s object type. (mandatory)
metadata:
  name: example-app #Name of the Pod.(mandatory) Each resource's unique identifier
spec: #Detailed specification for Resource kind (mandatory) 
```
**Commands**
- Get all Resources `kcs api-resources`  
- Read the OpenDocs API /openapi/v2 (e.g. https://k8scluster.vmware.com:6443/openapi/v2)