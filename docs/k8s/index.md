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



## Production Grade K8s
### LivenessProbes and ReadinessProbes
### Container logging
### How to monitor applications in Kubernetes
***Prometheus***
***Grafana***
### how to perform Rolling updates and Rollbacks

## Debugging in Kubernetes
***Commands***
`kcs describe pod_name`

## Advanced Usecases
### Multi-Container Pod design patterns 
### Using Jobs and CronJobs
### Inter service communication