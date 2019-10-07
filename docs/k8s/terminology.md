---
layout: default
title: Terminology
nav_order: 5
parent: Kubernetes
has_children: false
---
# Master Components
- Components needed to deliver a functioning Kubernetes cluster.
- Master components make global decisions about the cluster (for example, scheduling), and they detect and respond to cluster events

![K8s Cluster Arch](https://raw.githubusercontent.com/atishch/handbook/master/assets/k8s/k8s-cluster-arch.png)

**Cluster**
A set of Nodes that run containerized applications managed by Kubernetes. For this example, and in most common Kubernetes deployments, nodes in the cluster are not part of the public internet.

**Node**
A worker machine in Kubernetes, part of a cluster.

## kube-apiserver
## etcd
## kube-scheduler
## kube-controller-manager
## cloud-controller-manager

# Node Components



# Common Terminologies
## Service
>A Kubernetes Service that identifies a set of Pods using label selectors. Unless mentioned otherwise, Services are assumed to have virtual IPs only routable within the cluster network

## Cluster network
>A set of links, logical or physical, that facilitate communication within a cluster according to the Kubernetes networking model

## Edge router
>A router that enforces the firewall policy for your cluster. This could be a gateway managed by a cloud provider or a physical piece of hardware.

## Ingress
>Rules for routing the Inbound traffic to cluster resources