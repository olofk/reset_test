module rst_tb;
   reg clk = 1'b1;
   reg rst = 1'b1;

   reg [3:0] data_i = 4'd0;
   reg 	     start = 1'b0;
   wire [2:0] valid;
   reg 	      valid_r = 1'b0;

   wire [3:0] rst_all_data;
   wire [3:0] rst_bad_data;
   wire [3:0] rst_good_data;

   //Use vlog_tb_utils for VCD generation, timeout and heartbeat
   vlog_tb_utils vtu();

   always #5 clk <= !clk;
   initial #20 rst <= 1'b0;

   always @(posedge clk) begin
      //Generate stimuli
      data_i <= data_i + 4'd1;
      start <= (data_i >5) && (data_i < 10);

      //Check output
      if (valid === 3'b111) begin
	 if ({rst_all_data,rst_bad_data,rst_good_data} !== {3{rst_all_data}}) begin
	    $display("Error: Inconsistent data");
	    $finish;
	 end
	 valid_r <= 1'b1;
      end else if (valid === 3'b000)
	if (valid_r) begin
	   #30 $display("Done!");
	   $finish;
	end
   end

   rst_all rst_all
     (.clk (clk),
      .rst (rst),
      .valid_i (start),
      .data_i  (data_i),
      .valid_o (valid[0]),
      .data_o  (rst_all_data));

   rst_bad rst_bad
     (.clk (clk),
      .rst (rst),
      .valid_i (start),
      .data_i  (data_i),
      .valid_o (valid[1]),
      .data_o  (rst_bad_data));

   rst_good rst_good
     (.clk (clk),
      .rst (rst),
      .valid_i (start),
      .data_i  (data_i),
      .valid_o (valid[2]),
      .data_o  (rst_good_data));

endmodule
