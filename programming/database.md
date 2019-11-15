---
layout: default
title: Database
nav_order: 7
parent: Programming
has_children: false
---
# Database
## Concepts
### Index
| Clustered Index | Non-Clustered Index |
|--|--|
| It physically sorts the rows of a table based on the primary key or on a column that is unique and not null (generally we use primary key). | This is an index structure that is separate from the actual table which sorts one or more selected columns. Think of it as another table with few columns sorted together. For example, if you have a phone_book table where it is sorted by the name of a person and you want to know the count of people living in a specific country. What you’ll do? You’ll make another table with columns ‘country’ and ‘count_of_people’ which is sorted by the country name. Now finding the number of people in a given country will be much faster otherwise you will have to do the full table scan to get the answer. This is a non-clustered index. |
| 

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExMDI2MjQ4MDVdfQ==
-->