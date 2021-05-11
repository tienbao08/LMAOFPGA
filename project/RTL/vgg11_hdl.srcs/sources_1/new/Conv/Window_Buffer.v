module Window_Buffer 
#(
	parameter DATA_WIDTH = 8
	//parameter ADDR_WIDTH = 16,
	//parameter DEPTH = 1 << ADDR_WIDTH	
)
(
	input clk,
	input [DATA_WIDTH-1:0] Data_IN,
	output [DATA_WIDTH-1:0] o23, o13,
	output reg [DATA_WIDTH-1:0] o11, o12, o21, o22, o31, o32, o33
);

	wire [DATA_WIDTH-1:0] r13;
//	wire [DATA_WIDTH-1:0] r12;
//	wire [DATA_WIDTH-1:0] r21;
	wire [DATA_WIDTH-1:0] r23;
//	wire [DATA_WIDTH-1:0] r31;
//	wire [DATA_WIDTH-1:0] r32;
//	wire [DATA_WIDTH-1:0] r33;
	
	Line_Buffer Line_Buffer_inst1(.clk(clk),
											.Din(o31),
											.Dout(r23)
											);
	
	Line_Buffer Line_Buffer_inst2(.clk(clk),
											.Din(o21),
											.Dout(r13)
											);
	assign o23 = r23;
	assign o13 = r13;
	always @(posedge clk) 
	begin
		o33 <= Data_IN;
		o32 <= o33;
		o31 <= o32;
		o22 <= r23;
		o21 <= o22;
		o12 <= r13;
		o11 <= o12;
	end
endmodule




