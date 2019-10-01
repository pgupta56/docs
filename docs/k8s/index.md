---
layout: default
title: Kubernetes
nav_order: 7
has_children: false
has_toc: false
---
# Kubernetes
## What is K8s
### Container
>A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.
>Docker created a logical isolation of underlying OS Resources like CPU , RAM ,Network and provides Process Isolation , Network Interface , IPC , Filesystem Mounts and Isolation on Kernel   Data Volumets  
>Container systems usually provide service isolation between containers. As a result, container services such as file systems or network support can have limited resource access.
### Application Architecture on Kubernetes
![Architecture Shift](https://github.com/atishch/handbook/blob/master/assets/k8s/compare-traditional-arch.png "Architecture Shift")

## Core Concepts 
### Pods

>Pod is a group of containers that are deployed together on the same host. For single process deployment artifact, we can generally replace the word "pod" with "container" and accurately understand the concept.

>Pods operate at one level higher than individual containers. By design, all of the containers in a pod are connected to facilitate intra-pod communication and Shared resources. All container shared CPU, RAM , Network (Same IP but bound to different PORT) , Volumes (Mounts)


- Use `localhost` with co-located container `PORT`
- it enabled **Adaptor Patter** to suport common abstraction like Monitoring , Logging , Poroxy or Reusable Clients.

***Commands***
- View all Pods `kcs get pods` or event try `kcs get pods -o wide`
- See a pod details  `kcs describe pod/<pod_name>` (Events , Resource alocated , Laster Run status etc.)  

***As we go through we will discuss***
- Pods are created via Deployment , StatefulSet so that Self-healing , Auto Scaling and Rollup are handled via K8s
- Health and Diagnostic check done by K8s. Usage of `livenessProbe` , `readinessProbe` and `startupProbe` 
- **Advanced** Gracefully stoping of container and enable preStop hook with 30s wait time `--grace-period=30` 

***Tips***
- If application takes time on startup configure a [startupProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-startup-probes)
- 


### Create and Configure Basic Pods

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-app #Name of the Pod
  labels: #Key Value pair 
    app: example-app
    key1: value1 
spec:
  containers:
  - name: example-app #Name of the Pod
    image: polinux/stress
    resources:
      limits:
        memory: "200Mi"
      requests:
        memory: "100Mi"
```
### Application’s resource requirements 	
### Configuration using ConfigMaps , Secrets
### Services – ClusterIP , NodePort , LoadBalancer
### Basic understanding of NetworkPolicies
### PersistentVolumeClaims for storage
### Use of Service , ConfigMaps , Secrets
### How to use Labels, Selectors, and Annotations

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