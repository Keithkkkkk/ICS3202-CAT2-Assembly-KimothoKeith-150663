## Control.asm
The control.asm program, is a program that prompts a user to enter a number which it will then determine whether it is a positive, negative or zero using branching logic.

### To run the program run the following commands
```
 nasm -f elf64 control.asm -o control.o -g
 ld control.o -o control
 ./control
```
 ### Insights 
 From this task i was able to understand that when receiving user input, it is not stored as direct decimals but rather as ascii characters, which need further conversion in order to operate on them 

 ## Array.asm
 The array.asm programs accepts 5 digits as input from the user and reverses it then outputs the results.

 ### To run the program run the following commands
 ```
 nasm -f elf64 array.asm -o array.o -g
 ld array.o -o array
 ./array
```
 ### Insights 
From this task i was able to understand how an array would be stored continously in a memory location and how to access the values in the memory.

 ## Factor.asm
 The factor.asm program accepts a number as input from the user and calculates its factorial.
 To see the results, one must use a debugger such as gdb to track the states of various registers.
 
 ### To run the program run the following commands
 ```
 nasm -f elf64 factor.asm -o factor.o -g
 ld factor.o -o factor
./factor
```
no output should be expected but the contents of the register can be viewed by running the following command and stepping through the code
 ```
gdb -silent factor
```
 ### Challenges
 The biggest challenge faced while creating this program was implementing a function to output the stored results. Converting the stored value into ascii values that can be outputted by the terminal proved difficult.

 ## Control.asm
 The control.asm program is a program meant to simulate a control program that sets various bits of a memory location to simulate a program that influences the actions of a motor and an alarm
  ### To run the program run the following commands
  ```
 nasm -f elf64 control.asm -o control.o -g
 ld control.o -o control
 ./control
```
no output should be expected but the contents of the register can be viewed by running the following command and stepping through the code
 ```
gdb -silent factor
```
 ### Insights
From this task i was able to learn and understand the concept of bit manipulation. 
 
 
