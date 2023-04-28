module halfadder(a1,b1,sum1,carry1);
 input a1,b1;
 output sum1,carry1;

 assign sum1=a1^b1;
 assign carry1=a1&b1;

endmodule

module fulladder(a,b,c,sum,carry);
 input a,b,c;
 output sum,carry;

 wire w1,w2,w3;
 halfadder h1(a,b,w1,w2);
 halfadder h2(w1,c,sum,w3);
 or o1(carry,w2,w3);
endmodule

module rippleadder(sum,carry,x,y,z);
 input [3:0]x,y;
 input z;
 output [3:0]sum;
 output carry;
 wire w1,w2,w3;

 fulladder n1(sum[0],w1,x[0],y[0],z);
 fulladder n2(sum[1],w2,x[1],y[1],w1);
 fulladder n3(sum[2],w3,x[2],y[2],w2);
 fulladder n4(sum[3],carry,x[3],y[3],w3);

endmodule