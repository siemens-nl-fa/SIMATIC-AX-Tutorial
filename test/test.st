USING AxUnit;

NAMESPACE MyTest
    
{TestFixture}
CLASS MyTestFixture
    {Test (input := 5)}                                                     //Run the test with 5 as input
    {Test (input := 92)}                                                    //Run the test with 92 as input
    METHOD PUBLIC MyTestMethod
        VAR_INPUT
            input : LINT;                                                   //Define input as LINT
        END_VAR
        Assert.Equal(Actual := Power(input) , expected := input*input);     //Call the power function with input and assume that the output is input*input
    END_METHOD
END_CLASS
    
END_NAMESPACE