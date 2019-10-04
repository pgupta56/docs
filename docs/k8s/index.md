---
layout: default
title: Kubernetes
nav_order: 7
has_children: true
has_toc: true
---

# Kubernetes
## What is K8s
### Container
>A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

Docker created a logical isolation of underlying OS Resources like CPU , RAM ,Network and provides Process Isolation , Network Interface , IPC , Filesystem Mounts and Isolation on Kernel   Data Volumets  

Container systems usually provide service isolation between containers. As a result, container services such as file systems or network support can have limited resource access.

### Application Architecture on Kubernetes

![Architecture Shift](https://raw.githubusercontent.com/atishch/handbook/master/assets/k8s/compare-traditional-arch.png)

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