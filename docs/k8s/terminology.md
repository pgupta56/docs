---
layout: default
title: Terminology
nav_order: 5
parent: Kubernetes
has_children: false
---
# Terminology
## Node
>A worker machine in Kubernetes, part of a cluster.

## Cluster
>A set of Nodes that run containerized applications managed by Kubernetes. For this example, and in most common Kubernetes deployments, nodes in the cluster are not part of the public internet.

## Service
>A Kubernetes Service that identifies a set of Pods using label selectors. Unless mentioned otherwise, Services are assumed to have virtual IPs only routable within the cluster network

## Cluster network
>A set of links, logical or physical, that facilitate communication within a cluster according to the Kubernetes networking model

## Edge router
>A router that enforces the firewall policy for your cluster. This could be a gateway managed by a cloud provider or a physical piece of hardware.

## Ingress
>Rules for routing the Inbound traffic to cluster resources