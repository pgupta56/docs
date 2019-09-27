# Domain Driven Design
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
* 