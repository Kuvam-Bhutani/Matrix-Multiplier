`timescale 1ns / 1ps

module adder(//half adder with sum(s) and carry(c)
    input a,
    input b,
    output s,
    output c
    );
    xor x1(s,a,b);
    and a1(c,a,b);
endmodule 

module fulladder(//full adder with carryin(cin), carryout(cout) and sum(s)
input a,b,cin,
output sum,cout
    );
    wire hsum,hc1,hc2;
    adder p1(a,b,hsum,hc1);
    adder q1(hsum,cin,sum,hc2);
    or o(cout,hc1,hc2);
endmodule
