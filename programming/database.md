---
layout: default
title: RDBMS
nav_order: 7
parent: Programming
has_children: false
---
# Relational Database Management System
## Concepts
### Index
| Clustered Index | Non-Clustered Index |
|--|--|
| It physically sorts the rows of a table based on the primary key or on a column that is unique and not null (generally we use primary key). | This is an index structure that is separate from the actual table which sorts one or more selected columns. Think of it as another table with few columns sorted together. For example, if you have a phone_book table where it is sorted by the name of a person and you want to know the count of people living in a specific country. What you’ll do? You’ll make another table with columns ‘country’ and ‘count_of_people’ which is sorted by the country name. Now finding the number of people in a given country will be much faster otherwise you will have to do the full table scan to get the answer. This is a non-clustered index. |
| Querying data is fast. A typical use case can be where there are range-based queries on the primary key. | Querying data is faster when there is no index in a table. A scenario where it can be used is when you want to find no. of people from a particular country in the phonebook. Even if the phonebook is sorted by name, you would like to have some kind of mapping of country with no. of people living there for a faster answer to such queries. |
| There can only be one clustered index per table | There can be many non-clustered indexes per table. |
| It doesn’t need extra disk space. | It requires extra space to store those indexes. |
| It is faster than the non-clustered index. | It is slower than the clustered index in terms of SELECT queries. |
| Updation and Insertion are slow as the sorted order has to be maintained (can be faster when insertion always happens at the last, e.g.: Index on ID col). | Updation and Insertion are slow as the sorted order has to be maintained. |

### Try Catch
```sql
BEGIN TRY
	--divide-by-zero error
    SELECT 5 / 0 AS Error;
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_STATE() AS ErrorState,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
```
-   **ERROR_NUMBER():** As the name says, it returns the error number.
-   **ERROR_STATE():** It returns the state number of the error.
-   **ERROR_SEVERITY():** This function returns the severity value of the error.
-   **ERROR_PROCEDURE():** It returns the name of the stored procedure or function in which the error has occurred.
-   **ERROR_LINE():** Returns the line number at which the error has occurred.
-   **ERROR_MESSAGE():** Returns the message about the error.

> Sources
- [InterviewBit](https://www.interviewbit.com/sql-server-interview-questions/)
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTA5NjYzODYyNywtMjc4NzgwNjI4XX0=
-->