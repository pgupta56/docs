---
layout: default
title: Domain Driven Design
nav_order: 3
parent: Architecture
has_children: false
---
# Domain Driven Design
## Steps 1
- Analyze domain
- Defined bounded contexts
- Define entities, aggregates, and services
- Identify microservices

## Steps 2
- Building Domain Knowledge
- The Ubiquitous Language
- Model Driven Design
- Refactoring Toward Deeper Insight
- Preserving Model Integrity

## Building Objects
* Entity
* Value Object
* Services
* Repositories
* Aggregations
#### Aggregations
* Cluster of objects (Entity) that can be treated as Unit
* Typically Business entities are Aggregates
##### Rules
* 
* Transaction = processing one command by one aggregate
* Transaction scope = NoSQL database 'transanction' , Service boundries
#### Data consistency across Aggregates
* Event-Drivent (eventually cosnsitent) 
* Create Event is each State change for Aggregates
* Reliably publish Event when state changes
  * Event Sourcing

##### Event Sourcing
* Define Event classes from Domain 
* Treat Event as first class citizene. Model evenet fisrt 
* Persist Event NOT Current State


## Reference 
https://medium.com/design-and-tech-co/implementing-domain-driven-design-for-microservice-architecture-26eb0333d72e