module testbench;
 reg [3:0]x,y;
 reg z;
 wire [3:0]sum;
 wire carry;

 rippleadder DUT(sum,carry,x,y,z);
 initial 
 begin
    $dumpfile("code1.vcd");
    $dumpvars(0,testbench);
    $monitor($time,"x=%b , y=%b , z=%b , sum=%b , carry=%b",x,y,z,sum,carry);
    x=4'b0000 ; y=4'b0000 ; z=0;
    #5 x=4'b0001 ; y=4'b0001 ; z=0;
    #5 x=4'b0111 ; y=4'b0111 ; z=0;
    #5 x=4'b1011 ; y=4'b1011 ; z=0;
    #5 x=4'b1111 ; y=4'b1111 ; z=1;
    #5 $finish;
 end
endmodule