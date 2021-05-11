module Convolution_control
#(
	parameter DATA_WIDTH = 8
)
(
	input clk, reset, valid_in,
	output reg en_ff1, en_ff2, pp1, pp2,
	output [16:0] step
);

	parameter num_step = 144325;
	
	integer i = 0;
	//integer row = 0;
	integer col = 0;
	assign step = i;
	
	always @(posedge clk or posedge reset) 
	begin
		if(reset == 1) begin
			i <= 0;
			en_ff1 <= 0;
			en_ff2 <= 0;
			pp1 <= 0;
			pp2 <= 0;
		end
		else if(valid_in == 0) begin
			i <= i;
			en_ff1 <= 0;
			en_ff2 <= 0;
			pp1 <= 0;
			pp2 <= 0;			
		end
		else begin
			if(i<num_step) begin
				i = i + 1;
				//Write pixel to fifo 2
				if((i>0) && (i<48401)) begin
					en_ff1 <= 1;
					en_ff2 <= 0;
					pp1 <= 1;
					pp2 <= 0;
				end
				//Get pixel from fifo and write to window buffer
				if((i>48400) && (i<48843)) begin
					en_ff1 <= 1;
					en_ff2 <= 0;
					pp1 <= 0;
					pp2 <= 0;
				end
				//Caculate Conv
				if((i>48842) && (i<96801)) begin
					col = col + 1;
					if((col>0) && (col<219)) begin
						en_ff1 <= 1;
						en_ff2 <= 1;
						pp1 <= 0;
						pp2 <= 1;
					end
					if((col>218) && (col<221)) begin
						en_ff1 <= 1;
						en_ff2 <= 0;
						pp1 <= 0;
						pp2 <= 0;
					end
					if(col == 221) begin
						//row = row + 1;
						col = 0;
					end
				end
				
				if((i>96800) && (i<144325)) begin
					en_ff1 <= 1;
					en_ff2 <= 1;
					pp1 <= 0;
					pp2 <= 0;
				end

				if(i == num_step) begin
					i = 0;
				end
			end
			
		end
	end
endmodule
