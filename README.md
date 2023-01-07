# Jenifael.jl
object oriented julia because f u

The idea is to use macro to emulate OO programming in julia. Should be faster than to put functions as fields as it does not inflate their sizes. 3 Macros are used for the moment. `@OOCall` that allows to use a method, `@public` that must be put before the definition of the function in the struct definition and `@OO` that must be put before the definition of a struct that behave as a OO struct. 

In the futur, other macro should be added, such as `@private` and `@static`. Furthermore, I might force the harder for the args and return types, force the user to create a new file for each structs that will be considered as a class to make Jenifael as syntax and gross as Java.