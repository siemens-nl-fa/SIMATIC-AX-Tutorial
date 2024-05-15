# 4. Expanding the library functionality

## :mortar_board: Goal for this training chapter :mortar_board:

After this training chapter, you will:

- know how to extend the library with new functions
- write a test case for these functions
- export your library from AX to TIA on your own

### :raised_hands: Write some code (hands-on) :raised_hands:

1. Create a new ST file in the `src` folder call the file `math.st`
2. Write a function to do a simple addition of 2 integer variables (example below)

```iec-st
//create a namespace for mathematic functions
NAMESPACE Math

//create a Addition function, with 2 int inputs and 1 dint result
 FUNCTION Add
     VAR_INPUT
         v1 : INT;
         v2 : INT;
     END_VAR
     VAR_OUTPUT
         result : DINT;
     END_VAR

     result := v1 + v2;
     ;
 END_FUNCTION
END_NAMESPACE

```

3. Create a new file called `mathTest.st` in the `test` folder and Write a test case for the Add function (example below).

```iec-st
//import required libraries
USING Axunit;
USING Math;

//create a namespace for test functions on mathematics
NAMESPACE MathTests

//create a test class for the addition test
    {TestFixture}
    CLASS TestAdd

//create test method with several different tests
        {Test}
        METHOD PUBLIC Test_values
            VAR_TEMP
                result : DINT;
            END_VAR
            //call Add function with 1 and 1
            Add(v1 := 1, v2 := 1 , result => result);
            //expect that the result is 2
            Axunit.Assert.Equal(2, result);               

            Add(v1 := -1, v2 := -1 , result => result);
            Axunit.Assert.Equal(DINT#-2, result);        

            Add(v1 := 1, v2 := -1 , result => result);
            Axunit.Assert.Equal(DINT#0, result);        

            Add(v1 := -1, v2 := 1 , result => result);
            Axunit.Assert.Equal(DINT#0, result);    
        END_METHOD
    END_CLASS  

END_NAMESPACE

```

There are multiple ways to implement such a test case, the case above is a relatively simple approach where the Add function is called multiple times with different values in a single method.
The following example shows a different approach to implement this test using pragma's.

```iec-st
//import required libraries
USING Axunit;
USING Math;

//create a namespace for test functions on mathematics
NAMESPACE MathTests

//create a test class for the addition test
    {TestFixture}
    CLASS TestAdd

//create test method with several different tests using pragma's
        {Test ( 2, 2,4)}
        {Test ( 4, 4,8)}
        METHOD PUBLIC Additions
            VAR_INPUT
                x:INT;
                y:INT;
                expected:DINT;
            END_VAR
            VAR_TEMP
                result:DINT;
            END_VAR

            Add(v1 := x, v2 := y , result => result);
            Axunit.Assert.Equal(expected, result); 

        END_METHOD
    END_CLASS  

END_NAMESPACE

```

5. Export the TIAX project to be used in TIA portal, tip check [the previous chapter](./3-exportToTia.md)

## :mortar_board: Summary :mortar_board:

Goal reached? Check yourself...

- you know how to extend the library with new functions ✔
- you can create your own tests within the IDE ✔
- you exported your library to TIA portal on your own ✔

[Continue with next chapter](./5-debugLibRuntime.md)

[Back to overview](./../README.md)
