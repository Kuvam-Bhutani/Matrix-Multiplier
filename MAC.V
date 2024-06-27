//'uploaded by Aniket'


module accumulator(x,y,clr,clk,ld);
  input[7:0] x;
  output reg[9:0] y;
  input clr,clk,ld;
  
    
  always@(posedge clk )
    begin
       if(clr)y<=10'b00000000;
       else if(ld) y<=y+x;
    end    
endmodule
/*
Purpose: The accumulator module is designed to accumulate (y = y + x) a value x into y based on control signals clr, clk, and ld.


Inputs:
x (8-bit input): Value to be added to the accumulator y.
clr (control input): Clears the accumulator (y set to 0) when high.
clk (clock input): Clock signal for synchronous operation.
ld (load input): When high, loads x into y.


Outputs:
y (10-bit output): Accumulated value.


*/
/*
multiplier module
Purpose: Computes the multiplication of two 4-bit inputs a and b.
Inputs:
a, b (4-bit inputs): Values to be multiplied.
Outputs:
result (8-bit output): Result of a * b.
*/




module MAC(w,x,o,clk,load,clear);
  input[3:0]w,x;
  input clk;
  input clear;
  input load;
  wire[7:0] mulw;
  
 
 // reg [7:0]mul;
  
  output [9:0] o;
  accumulator A(mulw,o,clear,clk,load);
  multiplier M(w,x,mulw);  
  
  
endmodule  
/*
mac module explanation 
Purpose: Combines the accumulator and multiplier modules to create a Multiply-Accumulate (MAC) unit.


Inputs:
w, x (4-bit inputs): Inputs to the multiplier.
clk (clock input): Common clock for synchronous operation.
clear (control input): Clears the accumulator (o set to 0) when high.
load (control input): Loads the result of multiplication (mulw) into the accumulator when high.


Outputs:
o (10-bit output): Accumulated result from the accumulator.
  
*/  

/*module mac_test();
    reg[3:0] w,x;
    reg clk,load,clear;
    wire[7:0] o;
    initial
        clk=1'b0;
    always  
        #5 clk=~clk;  
    MAC m(w,x,o,clk,load,clear);
    initial
        clear=1;      
    initial
        begin
          #3 x<=4'b1111;w<=4'b1111;load<=1;clear<=0;
          #10 x<=4'b0010;w<=4'b0011;
          #10 x<=4'b0011;w<=4'b0101;
          #10 x<=4'b0001;w<=4'b1000;
          #10   load<=0;
        end
    
            
    initial
        $monitor($time," acc_value=%d",o);        
    initial
     #51 $finish;

endmodule
used for testing 
*/

/*
addition notes 
1)The code also includes commented-out sections (initial blocks) which seem intended for simulation.
2)A testbench module (mac_test) is also partially provided in comments, which would verify the functionality of MAC.

*/