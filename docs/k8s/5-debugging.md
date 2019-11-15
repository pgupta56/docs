---
layout: default
title: Troubleshooting
nav_order: 8
parent: Kubernetes
has_children: false
---

# Pods

**Tips**

- If application takes time on startup configure a [startupProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-startup-probes)

**As we go through we will discuss**
- Pods are created via Deployment , StatefulSet so that Self-healing , Auto Scaling and Rollup are handled via K8s
- Health and Diagnostic check done by K8s. Usage of `livenessProbe` , `readinessProbe` and `startupProbe` 
- **Advanced** Gracefully stoping of container and enable preStop hook with 30s wait time `--grace-period=30` 
