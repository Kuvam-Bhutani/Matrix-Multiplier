module comparator_greater_than(input[3:0] a,b,output gt);
    wire[3:0] bdash;
    wire gt1,gt2,gt3;
    wire eq1,eq2,eq3,gt4;

    // implementing 4-bit comparator equation

    not(bdash[3],b[3]);  // first calcuation complement of each bit of b , which will come in use in comparator eqn
    not(bdash[2],b[2]);
    not(bdash[1],b[1]);
    not(bdash[0],b[0]);

    and(gt1,a[3],bdash[3]); // if a[3]>b[3] that means a>b

    xnor(eq1,a[3],b[3]); // else if a[3]==b[3] and a[2]>b[2] that means a>b
    and(gt2,eq1,a[2],bdash[2]);

    xnor(eq2,a[2],b[2]);  // else if a[3]==b[3] and a[2]==b[2] and a[1]>b[1] that means a>b
    and(gt3,gt1,gt2,a[1],bdash[1]);

    xnor(eq3,a[1],b[1]);  // else if a[1]==b[1] and a[2]==b[2] and a[3]==b[3] and a[0]>b[1] that means a>b
    and(gt4,gt3,gt2,gt1,a[0],bdash[0]);

    or(gt,gt4,gt3,gt2,gt1); //if any one of above conditons satisfy then a>b



endmodule    

/*module tb_comparator_greater_than();
    reg[3:0] a,b;
    wire gt;
    comparator_greater_than comp(a,b,gt);
    initial
        $monitor("a=%d , b=%d, gt=%b ",a,b,gt);
    initial
        #100 $finish;
    initial
        begin
            a=5;b=8;
        #10 a=8;b=5;
        #10 a=0;b=0;
        #10 a=9;b=9;
        #10 a=15;b=0;
        #10 a=0;b=15;
        #10 a=15;b=15;
        #10 a=13;b=2;
        #10 a=9;b=7; 
        end    

endmodule
*/
