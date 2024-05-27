CONFIGURATION MyConfiguration
    TASK Main(Interval := T#500ms, Priority := 1);
    PROGRAM P1 WITH Main: MyProgram;
        VAR_GLOBAL
            toggle : BOOL;                                   //defines a variable of type bool with name toggle  
            output_signal AT %Q0.1 : BOOL;                   //defines a output signal of type bool with name output_signal at PLC adress %Q0.1  
            count_value : LINT;                              //defines a variable of type LINT with name count_value
            power_value : LINT;                              //defines a variable of type LINT with name power_value
          END_VAR
END_CONFIGURATION
