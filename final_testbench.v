`include "controller.v"
`include "datapath.v"

module testbench();
    reg[3:0] data_in;
    wire done;
    reg clk;
    reg ldw,ldx,ld;
    reg clear_mac,clear_mem;

    initial
        clk=1'b0;
    always #5 clk=~clk;

    controller c(start,clk,done,unload1,unload2,unload3);
    datapath d(data_in,ldw,ldx,ld,clear_mem,clear_mac,clk,unload1,unload2,unload3,start);

    initial
        begin clear_mem<=1'b1;clear_mac<=1'b1;ldw<=1'b0;ldx<=1'b0;ld<=1'b0;end //to clear the memory and set load to 0 
    initial
        begin //starting to load the data
          #1  data_in=2;clear_mem=0;ldw=1; //loading the first matrix(w) and providing the inputs in order
          #10 data_in=3;
          #10 data_in=4;
          #10 data_in=5;
          #10 data_in=6;
          #10 data_in=8;
          #10 data_in=7;
          #10 data_in=4;
          #10 data_in=2;
          #10 data_in=9;ldw=0;ldx=1; //loading the second matrix(x) and providing the inputs in order
          #10 data_in=3;
          #10 data_in=0;
          #10 data_in=8;
          #10 data_in=5;
          #10 data_in=3;
          #10 data_in=6;
          #10 data_in=9;
          #10 data_in=7;
          #6 ldx<=1'b0;// data uploading completed
          
          // matrix multiplication starts
          clear_mac=1'b0;ld=1'b1; 
        end 
  //displaying the final output(multiplied matrix)
        always@(*)
            if(done)#6 ld=1'b0;
        initial
            $monitor($time," \n    %d %d %d",d.m.o11,d.m.o12,d.m.o13,
                   "\n    %d %d %d",d.m.o21,d.m.o22,d.m.o23,
                   "\n    %d %d %d ",d.m.o31,d.m.o32,d.m.o33);
                     
        initial
            #500 $display(" \n    %d %d %d",d.b.w_mem[0],d.b.w_mem[1],d.b.w_mem[2],
                   "\n    %d %d %d",d.b.w_mem[3],d.b.w_mem[4],d.b.w_mem[5],
                   "\n    %d %d %d ",d.b.w_mem[6],d.b.w_mem[7],d.b.w_mem[8]);
        initial
            #500 $display(" \n    %d %d %d",d.b.x_mem[0],d.b.x_mem[1],d.b.x_mem[2],
                   "\n    %d %d %d",d.b.x_mem[3],d.b.x_mem[4],d.b.x_mem[5],
                   "\n    %d %d %d ",d.b.x_mem[6],d.b.x_mem[7],d.b.x_mem[8]);         

        initial #10000 $finish;


    endmodule
