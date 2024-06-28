`timescale 1ns / 1ps

/* A simple binary multiplier that takes in two 4-bit inputs,
   returning an 8-bit binary output;uses AND gates, half and full adders*/

module multiplier(
    input [3:0] n1,[3:0] n2,
    output [7:0] op
    );
    wire w10,w20,w30,w01,w11,w21,w31,w02,w12,w22,w32,w03,
    w13,w23,w33,c01,c11,c21,c31,c02,c12,c22,c32,c03,c13,c23,
    s11,s21,s31,s12,s22,s32;
    and m00(op[0],n1[0],n2[0]);
    and m10(w10,n1[1],n2[0]);
    and m20(w20,n1[2],n2[0]);
    and m30(w30,n1[3],n2[0]);
    and m01(w01,n1[0],n2[1]);
    and m11(w11,n1[1],n2[1]);
    and m21(w21,n1[2],n2[1]);
    and m31(w31,n1[3],n2[1]);
    and m02(w02,n1[0],n2[2]);
    and m12(w12,n1[1],n2[2]);
    and m22(w22,n1[2],n2[2]);
    and m32(w32,n1[3],n2[2]);
    and m03(w03,n1[0],n2[3]);
    and m13(w13,n1[1],n2[3]);
    and m23(w23,n1[2],n2[3]);
    and m33(w33,n1[3],n2[3]);
    adder a1(w10,w01,op[1],c01);
    fulladder a2(w20,w11,c01,s11,c11);          
    fulladder a3(w30,w21,c11,s21,c21);
    adder a4(w31,c21,s31,c31);
    adder a5(w02,s11,op[2],c02);
    fulladder a6(w12,s21,c02,s12,c12);          
    fulladder a7(w22,s31,c12,s22,c22);
    fulladder a8(w32,c31,c22,s32,c32);
    adder a9(w03,s12,op[3],c03);
    fulladder a10(w13,s22,c03,op[4],c13);          
    fulladder a11(w23,s32,c13,op[5],c23);
    fulladder a12(w33,c32,c23,op[6],op[7]);
endmodule

