---
layout: default
title: K8s
parent: Quick Help
has_children: false
---

# Kubernetes
## Basics
- Get all status `kcs get all`
- Get Node IP `kcs get pod/map-bulk-eloqua-sync-dev-849f775b7b-jjnhl  -o go-template="{{.status.hostIP}}`
## Debugging K8s App
- Get last status `kcs get pod/<pod_name> -o go-template="{{range .status.containerStatuses}}{{.lastState.terminated.reason}}{{end}}"`
