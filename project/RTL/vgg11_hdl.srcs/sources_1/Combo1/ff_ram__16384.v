module ff_ram_16384
	#(parameter DATA_WIDTH = 32,
	  parameter ADDR_WIDTH = 3,
	  parameter DEPTH = 1 << ADDR_WIDTH
	  )
	  
	 (input cs,								//chip select
	  input rws,							//read/write select
	  input [ADDR_WIDTH-1:0] wptr,	//address to write	
	  input [ADDR_WIDTH-1:0] rptr,	//address to read
	  input [DATA_WIDTH-1:0] data_in,
	  output reg [DATA_WIDTH-1:0] data_out
	  );
	  
	  reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];
	  
	  always @(*) 
	  begin: MEM_WRITE
         if(cs && rws) begin
				mem[wptr] <= data_in;
			end
	  end
	  
	  always @(*) 
	  begin: MEM_READ
         if(cs && !rws) begin
				data_out <= mem[rptr];
			end
	  end
	  
	  
	  
endmodule

	 
