//REMEMBER: Write counter pointer in has 1 bit larger address of ff_ram, if ADDR_WIDTH = 14, wptr has 15 bit
//REMEMBER: Read counter pointer in has 1 bit larger address of ff_ram, if ADDR_WIDTH = 14, rptr has 15 bit

`timescale 1ns / 1ps 

module FIFO_64

#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 6,
	parameter DEPTH = 1 << ADDR_WIDTH,
	
	parameter ptr0 = 7'b0,
	parameter ptr1 = 7'b1
)

(
	input clk,
	input reset,
	input en,
	input push_pop,
	input [DATA_WIDTH-1:0] DATA_IN,
	output [DATA_WIDTH-1:0] DATA_OUT,
	output full_signal,
	output empty_signal
);

	wire [ADDR_WIDTH:0] wptr_out, rptr_out;
	wire cs_out, we_out, re_out;
	
	
	ff_ram_64 #(DATA_WIDTH, ADDR_WIDTH, DEPTH) 
	ff_ram_64_inst 
												(
											  .cs(cs_out),								
											  .rws(push_pop),							
											  .wptr(wptr_out[ADDR_WIDTH-1:0]),		
											  .rptr(rptr_out[ADDR_WIDTH-1:0]),	
											  .data_in(DATA_IN),
											  .data_out(DATA_OUT)
											 );

	Write_Pointer_64 #(ADDR_WIDTH, ptr0, ptr1)
	Write_Pointer_64_inst							(
																.clk(clk),
																.rst(reset),
																.fifo_we(we_out),
																.wptr(wptr_out)
															);
											
	Read_Pointer_64 #(ADDR_WIDTH, ptr0, ptr1)
	Read_Pointer_64_inst  					(
																.clk(clk),
																.rst(reset),
																.fifo_re(re_out),
																.rptr(rptr_out)
															);
											
	Status_Signal_64 #(ADDR_WIDTH)
	Status_Signal_64_inst 					(
																.ff_en(en),
																.ff_push_pop(push_pop),
																.wptr(wptr_out),
																.rptr(rptr_out),
																.ff_we(we_out),
																.ff_re(re_out),
																.ff_cs(cs_out),
																.full_signal(full_signal),
																.empty_signal(empty_signal)
															);
endmodule

