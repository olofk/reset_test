module rst_wrap
  (input clk,
   input 	     rst_i,
   input 	     inc_i,
   input [3:0] 	     din_i,
   output reg [2:0]  valid_o,
   output reg [11:0] dout_o);

   reg 		    rst_r;
   reg 		    inc_r;
   reg [3:0] 	    din_r;

   wire [11:0] 	    dout_r;
   wire [2:0] 	    valid_r;


   always @(posedge clk) begin
      rst_r <= rst_i;
      inc_r <= inc_i;
      din_r <= din_i;

      valid_o <= valid_r;
      dout_o     <= dout_r;
   end

   rst_all rst_all
     (.clk (clk),
      .rst (rst_r),
      .valid_i (inc_r),
      .data_i  (din_r),
      .valid_o (valid_r[0]),
      .data_o  (dout_r[3:0]));

   rst_bad rst_bad
     (.clk (clk),
      .rst (rst_r),
      .valid_i (inc_r),
      .data_i  (din_r),
      .valid_o (valid_r[1]),
      .data_o  (dout_r[7:4]));

   rst_good rst_good
     (.clk (clk),
      .rst (rst_r),
      .valid_i (inc_r),
      .data_i  (din_r),
      .valid_o (valid_r[2]),
      .data_o  (dout_r[11:8]));

endmodule
