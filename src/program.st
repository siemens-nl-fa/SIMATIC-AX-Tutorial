USING System.Counters;

PROGRAM MyProgram
   VAR_EXTERNAL
      toggle : BOOL;
      output_signal : BOOL;
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
   power_value := Power(count_value);
END_PROGRAM
