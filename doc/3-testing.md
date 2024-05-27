# 2. Usage of the testing framework

## :mortar_board: Goal for this training chapter :mortar_board:

After this training session:

- you can execute tests within the AX IDE
- you've knowledge about the command line based testing

### :raised_hands: Writing unit tests (hands-on) :raised_hands:

1. open the `/test/test.st` file above the replace the *{test}* pragma with the following;

```
    {Test (input := 5)}                                                     //Run the test with 5 as input
    {Test (input := 92)}                                                    //Run the test with 92 as input
```

2. In the *MyTestMethod* method add a input variable of type LINT, and replace the Assert.Equal line to test to call the Power method with the input variable.

```
        VAR_INPUT
            input : LINT;                                                   //Define input as LINT
        END_VAR
        Assert.Equal(Actual := Power(input) , expected := input*input);     //Call the power function with input and assume that the output is input*input
```


3. Now execute the tests by going to the testing pane and clicking on the play button.
4. The test should result in a green checkmark in the test pane

**Alternative workflow**

You can also execute the tests by command line command. Open the terminal and execute the `apax test` command.

```iec-st
apax test
```

> Note: in case of executing the tests by command line, the test explorer results will not be updated. The test results will be shown in the command line output.

## :mortar_board: Summary :mortar_board:

Goal reached? Check yourself...

- you understand the test structure✔
- you know the test explorer and the `Run tests` button ✔
- you can execute tests within the IDE ✔
- you've knowledge about the command line based testing ✔

[Continue with next chapter](./4-download.md)

[Back to overview](./../README.md)
