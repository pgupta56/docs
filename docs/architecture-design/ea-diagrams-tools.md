---
layout: default
title: Architecture Diagram and Tools
nav_order: 3
parent: Architecture
has_children: false
---

# Architecture Diagrams
## Data Flow Diagram
- Graphical representation of system’s flow of information
- How data is processed by a system in terms of inputs , outputs and where that information is stored.


***Data Flow Diagram symbols are standardized notations***
- External entity
  - Represented in `rectangles` with a `short-text labels` haveing the Domain o
  - Outside system that sends or receives data
  - Might be an outside organization or person, a computer system or a business system
- Process
  - Represented in `circle` with a `short-text labels` have Process action
  - Any process that changes the data, producing an output
- Data store
  - Represented in `Data rectagles` (with right border open) with a `short-text labels` having what Model is stored
  - Files or repositories that hold information for later use
- Data flow
  - Represented in `Arrow` with a `short-text labels` having what data is flowing
  - route that data takes between the external entities, processes and data stores

***DFD rules and tips***
- Each process should have at least one input and an output.
- Each data store should have at least one data flow in and one data flow out.
- Data stored in a system must go through a process.
- All processes in a DFD go to another process or a data store.

### Levels
**Level 0**
- System as a Block Box process highlighting 
- It's called `Context Diagram`
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU5MjUyMTk5MV19
-->