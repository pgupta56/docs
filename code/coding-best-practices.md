# Coding Best Practices
### Maintainable Code
* Write it for other people to read. This means a combination of good names, good comments, and simple code statements.
* Be consistent. Do not change styles in your code. Follow fixed Naming conventions for variable , functions , class/file , packages/folder
* A function should handle once specific concerns only. Refactor function creating more readable function to fix this
* One central entry point function which will give overview of all the functional flow of the Program. Create a driver function which calls other functions to perform all the tasks
 
### Syntax and Structure
* Naming conventions should be consistent (e.g For Jaba camelCase and variable name should be descriptive enough to indicate it's use )
* Function parameter should contains mandatory fields first and optional fields afterwards

### Secure Code
* Refer https://github.com/OWASP/CheatSheetSeries/tree/master/cheatsheets 

#### Java
* Function parameter should be of type final. Unless we really need to change the Object being passed for some wired reason
* Return Empty Collections instead of Null

#### SPRING BOOT
* Always externalize properties. Use [@ConfigurationProperties](https://www.baeldung.com/configuration-properties-in-spring-boot) for all property injection . No @Value on any Service classes
* 

