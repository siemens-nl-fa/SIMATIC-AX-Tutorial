# 2. Write your application in ST

## :mortar_board: Goal for this training chapter :mortar_board:

After this training chapter, you will:

- be able to configure plc tasks in the `configuration.st`
- know how to define global variables and IO in the `configuration.st`
- know how to implement AX libraries in your code
- be able to code simple program logic
-

### :raised_hands: Configuring tasks and global variables (hands-on) :raised_hands:

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


4. Let's add some variable into the `GLOBAL_VAR` section:
```
VAR_GLOBAL
   toggle : BOOL;                                   //defines a variable of type bool with name toggle  
   output_signal AT %Q0.1 : BOOL;                   //defines a output signal of type bool with name output_signal at PLC adress %Q0.1  
   count_value : LINT;                              //defines a variable of type LINT with name count_value
 END_VAR
```


### :raised_hands: Coding program logic (hands-on) :raised_hands:



### :exclamation: Introducing AX project folder structure (hands-on) :exclamation:

### :mortar_board: Summary :mortar_board:

Goal reached? Check yourself...

- you are able to create a new ax project ✔
- you know what the purpose of the apax.yml is ✔
- you have learned how to install packages ✔
- you know how to use the Apax extension ✔
- you know the difference between `devDependencies` and `dependencies` ✔

[Continue with next chapter](./2-testing-framework.md)

[Back to overview](./../README.md)
