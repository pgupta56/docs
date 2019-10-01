---
layout: default
title: K8s
parent: Quick Help
has_children: false
---

# Kubernetes
## Basics
## Debugging K8s App
- Get all status
`kcs get all`
** Pod Crash **
- Get last status
`kcs get pod/<pod_name> -o go-template="{{range .status.containerStatuses}}{{.lastState.terminated.reason}}{{end}}"`
