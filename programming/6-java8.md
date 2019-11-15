---
layout: default
title: Java8 - Streams
nav_order: 6
parent: Programming
has_children: false
---
# What is Stream in Java8
- Java 8 Streams concept is based on converting Collections to a Stream, processing the elements in parallel and then gathering the resulting elements into a Collection
- functional-style operations on streams of elements, such as map-reduce transformations on collections
- streams are wrappers around a data source, allowing us to operate with that data source and making bulk processing convenient and fast
- A stream pipeline consists of a stream source, followed by zero or more intermediate operations, and a terminal operation
- 
## Operations on Streams
```java 
List<string> names = students.stream()
.map(Student::getName)
.filter(name->name.startsWith("A"))
.collect(Collectors.toList());

//This is equvelent to 
List<String> names =newArrayList<>();
for(Student student : students){
    if(student.getName().startsWith("A")){
    names.add(student.getName());
    }
}
```
### Intermediate Operation
### Terminal Operation


## Creating a Stream
- Number Streams using ***IntStream, DobuleStream,LongStream***
```java
IntStream.rangeClosed(1, 10).forEach(num -> System.out.print(num)); // ->12345678910
IntStream.range(1, 10).forEach(num -> System.out.print(num)); // ->123456789
```

- Creating Stream of hardcoded Strings and printing each String
```java
Stream.of("This", "is", "Java8", "Stream").forEach(System.out::println);
```

- Creating stream of arrays
```java
String[] stringArray = new String[]{"Streams", "can", "be", "created", "from", "arrays"};
Arrays.stream(stringArray).forEach(System.out::println);
```

- Creating BufferedReader for a file
```java
BufferedReader reader = Files.newBufferedReader(Paths.get("File.txt"), standardCharsets.UTF_8);
//BufferedReader's lines methods returns a stream of all lines
reader.lines().forEach(System.out::println);
```
