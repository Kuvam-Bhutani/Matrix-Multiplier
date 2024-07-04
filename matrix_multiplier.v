//This Verilog code defines a module matmul that performs matrix multiplication using instances of the MAC (Multiply-Accumulate) module. 


module matmul( data_w1,data_w2,data_w3,data_x1,data_x2,data_x3,clk,load,clear);

    input[3:0] data_w1,data_w2,data_w3,data_x1,data_x2,data_x3;
    input clk,load,clear;
    wire [9:0] o11,o12,o13,o21,o22,o23,o31,o32,o33;
    
    MAC m11(data_w1,data_x1,o11,clk,load,clear);
    MAC m21(data_w2,data_x1,o21,clk,load,clear);
    MAC m31(data_w3,data_x1,o31,clk,load,clear);
    
    MAC m12(data_w1,data_x2,o12,clk,load,clear);
    MAC m22(data_w2,data_x2,o22,clk,load,clear);
    MAC m32(data_w3,data_x2,o32,clk,load,clear);
    
    MAC m12(data_w1,data_x3,o13,clk,load,clear);
    MAC m23(data_w2,data_x3,o23,clk,load,clear);
    MAC m33(data_w3,data_x3,o33,clk,load,clear);
    
    
endmodule
/*
Purpose: This module implements a 3x3 matrix multiplication using nine instances of the MAC module (m11 to m33).


Inputs:
data_w1, data_w2, data_w3: 4-bit input vectors representing the rows of the first matrix.
data_x1, data_x2, data_x3: 4-bit input vectors representing the columns of the second matrix.
clk: Clock signal.
load: Control signal for loading data into the MAC units.
clear: Control signal for clearing the accumulators in the MAC units.


Outputs:
o11, o12, o13, o21, o22, o23, o31, o32, o33: Accumulated outputs from each MAC unit.
Operation:
Each MAC instance (m11 to m33) performs a multiply-accumulate operation:
m11 computes data_w1 * data_x1.
m12 computes data_w2 * data_x1.
m13 computes data_w3 * data_x1.
And so on for the other instances (m21 to m33).
The results of these operations (o11 to o33) represent the elements of the resultant matrix after multiplication.

*/

/*module testbench();
    reg[3:0] data_w1,data_w2,data_w3;
    reg[3:0] data_x1,data_x2,data_x3;
    reg clk;
    //wire[7:0] o11,o12,o13,o21,o22,o23,o31,o32,o33;
    reg load,clear;
    initial
        clk=1'b0;
    always #5 clk=~clk;
    initial
    begin
        clear<=1'b1;
        #10 clear<=1'b0;
    end
    matmul m(data_w1,data_w2,data_w3,data_x1,data_x2,data_x3,clk,load,clear);

    initial
        begin
          load<=1;
          #11data_w1=4'b0011;
          data_w2=4'b0011;
          data_w3=4'b0011;
          data_x1=4'b0011;
          data_x2=4'b0011;
          data_x3=4'b0011;
                   
          #11 data_w2=4'b0010;
           data_w1=4'b0010;
           data_w3=4'b0010;
           data_x1=4'b0010;
           data_x2=4'b0010;
           data_x3=4'b0010;
        
          #11 data_w1=4'b0011;
           data_w2=4'b0011;
           data_w3=4'b0011;
           data_x1=4'b0011;
           data_x2=4'b0011;
           data_x3=4'b0011;
          #11load=0;

        end
    initial
        begin
            $monitor("\n    %d %d %d",m.o11,m.o12,m.o13,
                   "\n    %d %d %d",m.o21,m.o22,m.o23,
                   "\n    %d %d %d",m.o31,m.o32,m.o33);
            //#100 $finish;  
          end     

    initial 
    #1000 $finish;  

endmodule */


/*
testbench (Commented Out):
The code also contains a commented-out testbench (testbench module) that appears to test the functionality of matmul:
Initializes the input vectors (data_w1 to data_x3).
Toggles the clock (clk).
Controls load and clear signals.
Monitors and displays the output of matmul (o11 to o33).
*/
