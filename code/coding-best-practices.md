# Coding Best Practices
## Common
#### Syntax and Structure
* Naming conventions should be consistent (camelCase and variable name should be descriptive enough to indicate it's use )
* Function parameter should contains mandatory fields first and optional fields afterwards
* Return Empty Collections instead of Null

#### Approach
* There should be one central function (e.g. process()) which will give overview of all the functional flow of the Program 
* Function should handle once specific concerns only (Refactor funtiion creating more functions to fix this)
* Function parameter should be of type final ( Unless we really need to change the Object being passed for some wired reason ) 


#### Documentation

## SPRING BOOT
### Best Practices
* Always externalize properties. Use [@ConfigurationProperties](https://www.baeldung.com/configuration-properties-in-spring-boot) for all property injection . No @Value on any Service classes 
