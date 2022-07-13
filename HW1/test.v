`timescale 1ns/10ps
module mux2_1 (out,a,b,sel) ;
    // Port declarations
	output reg out ;
	input a,b,sel ;

    always @(a or b or sel)
    if(sel) out=b;
    else out=a;
endmodule

module test_mux ;

reg a, b, sel ;

//MUX instance
    mux2_1 mux (out, a, b, sel) ;

//Stimulus

    initial
    begin
 	  a=0 ; b=1 ; sel=0 ;
      #5  b=0 ;
      #5  b=1 ; sel=1 ;
      #5  a=1 ;
      #5  b=0 ;
    end

    //Display results
    initial
    begin
      $display("                time out  a   b  sel");
      $monitor($time, "  %b   %b   %b   %b", out,a,b,sel) ;
    end

	initial
	begin
    $dumpfile("mux_t.vcd");
    $dumpvars;
	end
	
endmodule