//		    226 + 50176 = 50402
//50402 + 114 + 12544 = 63060
//63060 + 58  + 3136  = 66254
//66254 + 30  + 784   = 67068
//67068 + 16  + 196   = 67280
//67280 + 49          = 67329

module Control
#(
	parameter count_width = 17
)
(
	input clk, rst,
	//
	output reg valid_Block1,
	output reg valid_Block2,
	output reg valid_Block3,
	output reg valid_Block4,
	output reg valid_Block5,
	output reg valid_RAM_FC,
	output reg done
);

	reg [count_width-1:0] count_clk;
	always @(posedge clk) begin
	   if(count_clk >= 17'd67329) begin
	       done <= 1'b1;
	   end
	   else begin
	       done <= 1'b0;
	   end
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			count_clk = 17'd0;
			valid_Block1 = 0;
			valid_Block2 = 0;
			valid_Block3 = 0;
			valid_Block4 = 0;
			valid_Block5 = 0;	
			valid_RAM_FC = 0;
		end
		else begin
			count_clk = count_clk + 17'd1;
			if ((count_clk > 17'd0) && (count_clk < 17'd50403)) begin
				valid_Block1 = 1;
				valid_Block2 = 0;
				valid_Block3 = 0;
				valid_Block4 = 0;
				valid_Block5 = 0;
				valid_RAM_FC = 0;
			end
			else if ((count_clk >= 17'd50403) && (count_clk < 17'd63061)) begin
				valid_Block1 = 1;
				valid_Block2 = 1;
				valid_Block3 = 0;
				valid_Block4 = 0;
				valid_Block5 = 0;
				valid_RAM_FC = 0;
			end
			else if ((count_clk >= 17'd63061) && (count_clk < 17'd66255)) begin
				valid_Block1 = 1;
				valid_Block2 = 1;
				valid_Block3 = 1;
				valid_Block4 = 0;
				valid_Block5 = 0;
				valid_RAM_FC = 0;
			end
			else if ((count_clk >= 17'd66255) && (count_clk < 17'd67069)) begin
				valid_Block1 = 1;
				valid_Block2 = 1;
				valid_Block3 = 1;
				valid_Block4 = 1;
				valid_Block5 = 0;
				valid_RAM_FC = 0;
			end
			else if ((count_clk >= 17'd67069) && (count_clk < 17'd67281)) begin
				valid_Block1 = 1;
				valid_Block2 = 1;
				valid_Block3 = 1;
				valid_Block4 = 1;
				valid_Block5 = 1;
				valid_RAM_FC = 0;
			end
			else if ((count_clk >= 17'd67281) && (count_clk < 17'd67330)) begin
				valid_Block1 = 1;
				valid_Block2 = 1;
				valid_Block3 = 1;
				valid_Block4 = 1;
				valid_Block5 = 1;
				valid_RAM_FC = 1;
			end
			else if (count_clk >= 17'd67330) begin
				count_clk = 17'd67281;
			end
		end
	end
endmodule
