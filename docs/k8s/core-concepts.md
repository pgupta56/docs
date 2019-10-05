---
layout: default
title: Core Concepts
nav_order: 1
parent: Kubernetes
has_children: false
---
# Core Concepts
## Pods

Pod is a group of containers that are deployed together on the same host. For single process deployment artifact, we can generally think "pod" as a "container" to accurately understand the concept. Pods operate at one level higher than individual containers. 

- Represents as One unit
- Not concern with routing
- Containers in a pod are 
  - Connected to facilitate intra-pod communication and share resources. `localhost` with co-located container `PORT` can be used to communicate
  - Shares Network (Same IP but bound to different PORT) , Volumes (Mounts)
- it enabled **Adaptor Patter** to suport common abstraction like Monitoring , Logging , Proxy or Reusable container

### How to Create a Pod

```yaml
apiVersion: v1 #K8s API version (mandatory)
kind: Pod #K8s object type. (mandatory)   Note: Rather use Deployment and StatefulSet for Production deployment
metadata:
  name: example-app #Name of the Pod (mandatory)  This will be displayed via `kcs get pods`
  labels: #Custom open ended labels/tagging. Note: While defining Service these will be used as selectors 
    app: hello-world
    owner: digital-marketing
    tire: backend
    key1: value1
spec:
  containers:
  - name: hello-world-cntr #Name of the Container inside the Pod
    image: library/hello-world #Docker Image
    resources: #Resources configuration for Docker Image Container
      limits:
        memory: "200Mi"
        cpu: "200m"
      requests:
        memory: "100Mi"
        cpu: "100m"
   
```
### Application’s resource requirements
- CPU and memory are collectively referred to as compute resources. 
- Each Container of a Pod can specify one or more resources configuration for `requests` and `limit`
- K8s select the Node where to run the Pod based on the resources availabilty as defined by above configuration
- **Memory** are measured in bytes (e.g 2Gi, 512Mi, 1024Ki)
- **CPU** resources are measured in cpu units and can have fractions upto 0.1 level (e.g. 1 , 0.5 , 0.1)
  - It's better to define it on millicore. 0.1 CPU = 100m 
- If a Container exceeds 
  - memory limit, it might be terminated or got into mutiple restart
  - CPU limit , It will not be killed. But it not allowed for extended periods of time and process might starve

### Why Label ? How to use it 
- Labels are key/value pairs that are attached to objects as part of Object Spec
- Allowed character are ([a-z0-9A-Z]) with dashes (-), underscores (_), dots (.)

We will see how it can be used as **Selector** to easily enable Service for Pods

### Commands
- View all Pods `kcs get pods` or even try `kcs get pods -o wide`
- See a pod details  `kcs describe pods/<pod_name>` (Events , Resource alocated , Laster Run status etc.) - Get last status `kcs get pods/<pod_name> -o go-template="{{range .status.containerStatuses}}{{.lastState.terminated.reason}}{{end}}"`

## Services
Service is an abstraction (across namespace) which defines a logical set of Pods and a policy by which to access them.

Service provides traffic [Proxying](https://kubernetes.io/docs/concepts/services-networking/service/#ips-and-vips) , [Network Address Translation](https://kubernetes.io/docs/tutorials/services/source-ip/#source-ip-for-services-with-type-nodeport) and [NameService](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#a-records) via K8s `kube-proxy` and `CoreDNS`

So what we want is to Traffic to flow through the **External LoadBalancer/Internet** to K8s cluster

![Traffic Flow](https://raw.githubusercontent.com/atishch/handbook/master/assets/k8s/service-high1.png)


### A Service Spec sample
```yaml
apiVersion: v1
kind: Service
metadata:
  name: hello-world-service #Name of the service.
spec:
  type: NodePort #Will discuss this below.  
  selector:
    app: hello-world  #App names from where the ClusterIPs will be pulled 
  ports:
    - protocol: TCP
      port: 80 #Service Port
      targetPort: 9376 #Target Pod's PORT
      nodePort: 30620 #Will discuss this below. Nodes port from where kube-proxy can forward the traffic
```
### Selectors, and Annotations
- The label selector is the core grouping primitive in Kubernetes. Via Label selector client/user can identify a set of objects. 


### ClusterIP 
(Default) Exposes the Service on a cluster-internal IP. This makes the Service only reachable from within the cluster via just `{servicename}` or `{servicename}.{namespace}.svc.cluster.local`
- A Service can map any incoming `port` to a `targetPort`. By default and for convenience, the targetPort is set to the same value as the port field.

### NodePort
Exposes the Service on each Node’s IP at a static port (the NodePort). Service can be accessed via `<NodeIP>:<NodePort>` from Outside.
- **NodePort** is an open port on every node of your cluster
- Kubernetes transparently routes incoming traffic on the NodePort to your service, even if your application is running on a different node.



### LoadBalancer
Exposes the Service externally using a cloud provider’s load balancer. NodePort and ClusterIP Services, to which the external load balancer routes, are automatically created.

>Using a ***LoadBalancer*** service type automatically deploys an external load balancer. This external load balancer is associated with a specific IP address and routes external traffic to a Kubernetes service in your cluster.

- The exact implementation of a LoadBalancer is dependent on your cloud provider. GCP , AWS , Azure and DECC have `LoadBalancer` implementation to support it 


![Traffic Flow](https://raw.githubusercontent.com/atishch/handbook/master/assets/k8s/service-flow1.png)

### ExternalName
Maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record

## Configuration Management
### ConfigMaps
### Secrets

## Pods in Details

**Tips**
- If application takes time on startup configure a [startupProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-startup-probes)

**As we go through we will discuss**
- Pods are created via Deployment , StatefulSet so that Self-healing , Auto Scaling and Rollup are handled via K8s
- Health and Diagnostic check done by K8s. Usage of `livenessProbe` , `readinessProbe` and `startupProbe` 
- **Advanced** Gracefully stoping of container and enable preStop hook with 30s wait time `--grace-period=30` 


### Basic understanding of NetworkPolicies
### PersistentVolumeClaims for storage