//module:outputs 3 control variables that decide the flow of multiplication

module controller(start,clk,done,unload1,unload2,unload3);
    input start,clk;// clk is clock; start denotes the beginning of matrix multiplication after inputs are received and stored in memory bank
    output reg done;// denotes completion of entire operatioh
    reg[1:0] state;// 4 possible states of operation 
    output reg unload1,unload2,unload3;//control variables
    initial
        done<=1'b0;//set done to 0 first
    parameter S0=2'b00, S1=2'b01,S2=2'b10,S3=2'b11; //a parameter is defined for each state for readability
   //the following 'always' block sets the order in which state changes at each clock cycle
    always@(posedge clk)
        begin
          case(state)
              S0: if(start)state<=S1;//state change occurs only when 'start' is enabled
          S1: state<=S2;
          S2: state<=S3;
          S3: done=1'b1;
          default: state<=S0;
          endcase
        end
   
// the following 'always' block specifies the configuration of control variables(unload1,2,3) associated with each state
    always@(state)
        begin
            case(state)
                S0: begin unload1=1'b0;unload2=1'b0;unload3=1'b0;end
                S1: begin unload1=1'b1;unload2=1'b0;unload3=1'b0;end
                S2: begin unload1=1'b0;unload2=1'b1;unload3=1'b0;end
                S3: begin unload1=1'b0;unload2=1'b0;unload3=1'b1;#10 unload3=1'b0;end
                default: begin unload1=1'b0;unload2=1'b0;unload3=1'b0;end
            endcase  
        end  

endmodule
