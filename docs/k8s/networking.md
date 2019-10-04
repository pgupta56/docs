---
layout: default
title: Networking | Kubernetes
nav_order: 8
parent: Kubernetes
has_children: false
---
# Networking in K8s
## Service
**External Service as K8s Service**
- Create a Service with ExternalName
- While DNS resolving `my-service.{namespace}.svc.cluster.local` will resolve to `my.database.example.com` 
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
  namespace: prod
spec:
  type: ExternalName
  externalName: my.database.example.com
```