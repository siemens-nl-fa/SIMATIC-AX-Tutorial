# 2. Write your application in ST

## :mortar_board: Goal for this training chapter :mortar_board:

After this training chapter, you will:

- be able to configure plc tasks in the `configuration.st`
- know how to define global variables and IO in the `configuration.st`
- know how to implement AX libraries in your code
- be able to code simple program logic

## :raised_hands: Configuring tasks and global variables (hands-on) :raised_hands:

1. Open the **explorer** pane by clicking the icon in the activity bar
2. Open the `src/configuration.st`, the file will now open in the editor

The file will have a basic configuration section inside, like the one in the following code block.

```
CONFIGURATION MyConfiguration                       //start of the configuration section
    TASK Main(Interval := T#1000ms, Priority := 1); //defines a plc task with name Main at a interval of 1000ms with priority 1
    PROGRAM P1 WITH Main: MyProgram;                //defines that program p1 will run with task Main and will exist of code within MyProgram

    VAR_GLOBAL                                      //Defines the start of the global var section

    END_VAR
END_CONFIGURATION
```

3. Change the Interval to 500ms
4. Let's add some variables into the `GLOBAL_VAR` section:

```
VAR_GLOBAL
   toggle : BOOL;                                   //defines a variable of type bool with name toggle  
   output_signal AT %Q0.1 : BOOL;                   //defines a output signal of type bool with name output_signal at PLC adress %Q0.1  
   count_value : LINT;                              //defines a variable of type LINT with name count_value
   power_value : LINT;                              //defines a variable of type LINT with name power_value
 END_VAR
```


## :raised_hands: Coding program logic (hands-on) :raised_hands:

1. Open the `src/program.st`, this file contains the basic structure of a `PROGRAM` section in structured text.
2. In the `VAR_EXTERNAL` section we can define the Global variables that are required for our program. Add the following variables to the `VAR_EXTERNAL` section:

```
VAR_EXTERNAL                                        //Defines global variables that need to be accessed in this program section
    toggle : BOOL;
    output_signal: BOOL;
    count_value : LINT;   
    power_value : LINT;                                      
END_VAR
```

3. In this program we would like to use the **system-counters** library, to be able to utilize this library we have to declare the usage of the package in the `program.st` document. Add the following line to the top of the document:

```
USING System.Counters;
```

4. Add a new variable of the type `CounterUp` in your `VAR` section. Initiate it with a presetValue of 5. This will create a `count` variable counting up to 5 before emitting a signal.
```
VAR                                                 //Defines variables used in this program section
   count : CounterUp := (presetValue := 5);         //Declare a variable named count of type counterUp (object in the system.counters library) that signals when 5 is reached
END_VAR
```
5. At the `// code here` comment, add the actual logic of your program, the program will count up every other cycle and will reset after it reached 10:
```
toggle := NOT toggle;                               //switch the state between true and false with every PLC cycle. This will create a rising edge on the signal every two PLC cycles.
count(up := toggle);                                //call the counter and increment the count value of it by one each time a rising edge on the toggle signal has been detected.
output_signal := count.presetReached;               //set the output signal to true as soon as the counter reaches the configured preset value of 5.
count_value := count.value;                         //set the output count_value to the current value of the counter. This allows you to access this value from outside the program.
count.reset := count_value >= 10;                   //restart the counter and its value after the count value 10 is reached.              

```
6. The `VAR_TEMP` section can be removed for better readability since it is not used.

> Note: The steps above should result in the following `program.st` :
```
USING System.Counters;

PROGRAM MyProgram
  VAR_EXTERNAL
     toggle : BOOL;
     output_signal: BOOL;
     count_value : LINT;
     power_value : LINT;
  END_VAR
  VAR
     count : CounterUp := (presetValue := 5);
  END_VAR

  toggle := NOT toggle;
  count(up := toggle);
  output_signal := count.presetReached;
  count_value := count.value;
  count.reset := count_value >= 10;
END_PROGRAM
```
7. Lets create a new Function to use in the program, the Function should take a input value and calculate the input to the power of 2. To do this first create a new file called `function.st` and them add the code below:

```
FUNCTION Power : LINT
    VAR_INPUT
        x : LINT;
    END_VAR
    Power := x * x;
END_FUNCTION

```

8. In the `program.st` call the Power FB and use the count_value as input by adding the following line above the END_PROGRAM keyword:
```
   power_value := Power(count_value);
```



## :mortar_board: Summary :mortar_board:

Goal reached? Check yourself...

- you are able to configure your application in the `configuration.st` ✔
- you know how to declare (global) variables ✔
- you have learned how to install packages ✔
- you know how to implement system libraries in your application ✔
- you are able to write a simple program for your application ✔
- you know how to create a function that can be used in your application ✔

:arrow_right: [Continue with next chapter](./3-testing.md)

:arrow_heading_up: [Back to overview](./../README.md)
