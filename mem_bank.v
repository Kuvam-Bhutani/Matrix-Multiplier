// this module takes the input of data values for input matrices and later gives out the required data for matrix multiplication

module memory_bank(data_in,load_w,load_x,
clear,clk,unload1,unload2,unload3,
start,data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3

);
    input[3:0] data_in;                                 // incoming data to be loaded
    input load_w,load_x;                                // signal specifying whether w is to be loaded or x
    input clear;                                        // input signal to reset the memory
    input clk;                                          // clock input
    
    input unload1,unload2,unload3;                      // signals to specify which set of inputs are to be given out for matrix multiplication
    output reg start;                                   // signal specifying that memory loading is done and matrix multiplication can be started
    reg[3:0] w_mem[8:0];                                // memory block for first matrix
    reg[3:0] x_mem[8:0];
    integer x=0;                                        // for address of x
    integer w=0;                                        // for address of w
    
    output reg[3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;          // output ports for giving out datas for matrix multiplication
    
    
   
    

    initial
        start<=1'b0;

    // data writing

    always@( posedge clk)   
         begin
             if(load_w&& w<9)
                begin
                w_mem[w]=data_in;
                w=w+1;
                end
             else if(load_x && x<9)
                begin
                x_mem[x]=data_in;
                x=x+1; 
                end   
         end
    // clearing memory if clear is high     
     always@(posedge clear)
        
            if(clear)
            begin
               {w_mem[0],w_mem[1],w_mem[2],w_mem[3],w_mem[4],w_mem[5],w_mem[6],w_mem[7],w_mem[8]}=36'd0;
               {x_mem[0],x_mem[1],x_mem[2],x_mem[3],x_mem[4],x_mem[5],x_mem[6],x_mem[7],x_mem[8]}=36'd0;
            end        
                
    // if memory loading is done then start signal is set to High    
        always@(x)
            begin
                if(x==8)
                     start<=1'b1;
            end
    // setting which data out value depending on unload signal        
        always@(unload1,unload2,unload3)
            begin
              if(unload1)begin  data_outw1<=w_mem[0];data_outw2<=w_mem[3];data_outw3<=w_mem[6];data_outx1<=x_mem[0];data_outx2<=x_mem[1];data_outx3<=x_mem[2]; end
              else if(unload2)begin  data_outw1<=w_mem[1];data_outw2<=w_mem[4];data_outw3<=w_mem[7];data_outx1<=x_mem[3];data_outx2<=x_mem[4];data_outx3<=x_mem[5]; end
              else if(unload3)begin  data_outw1<=w_mem[2];data_outw2<=w_mem[5];data_outw3<=w_mem[8];data_outx1<=x_mem[6];data_outx2<=x_mem[7];data_outx3<=x_mem[8]; end
              else begin  data_outw1<=4'b0;data_outw2<=4'b0;data_outw3<=4'b0;data_outx1<=4'b0;data_outx2<=4'b0;data_outx3<=4'b0; end
            end    
           
            
     
endmodule
