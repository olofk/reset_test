module rst_all
  (input 	    clk,
   input 	    rst,
   input 	    valid_i,
   input [3:0] 	    data_i,
   output reg 	    valid_o,
   output reg [3:0] data_o);

   reg [2:0] 	count;
   reg [3:0] 	data_r;

   always @(posedge clk) begin
      if (rst) begin
	 data_o  <= 4'd0;
	 data_r  <= 4'd0;
	 valid_o <= 1'b0;
	 count   <= 3'd0;
      end else begin
	 if (valid_i)
	   count <= count + 1;
	 data_r  <= data_i;
	 data_o  <= data_r + count;
	 valid_o <= valid_i;
      end
   end
endmodule
