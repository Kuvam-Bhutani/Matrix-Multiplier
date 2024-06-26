module datapath(data_in,ldw,ldx,ld,clear_mem,clear_mac,clk,unload1,unload2,unload3,start);
    input clk; 
    input[3:0] data_in;
    input ldw,ldx,ld;
    input unload1,unload2,unload3;
    input clear_mem,clear_mac;
    output start;
    wire[3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;
    

  memory_bank b(data_in,ldw,ldx,clear_mem,clk,unload1,unload2,unload3,start,data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3); //for loading the two matrices
  matmul m(data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,clk,ld,clear_mac); //for multiplying the given two matrices



endmodule
