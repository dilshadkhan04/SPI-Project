module spi_clgen_tb();
	`include "spi_defines.v"
	reg wb_clk_in, wb_rst, go, tip, last_clk;
	reg [`SPI_DIVIDER_LEN-1:0]divider;
	wire sclk_out, cpol_0, cpol_1;
   // Instantiate the spi_clgen module
	spi_clgen DUT(wb_clk_in, wb_rst, go, tip, last_clk, divider, sclk_out, cpol_0, cpol_1);   
   // Clock generation
	always #5 wb_clk_in = ~wb_clk_in;
   
   // Stimulus generation
	initial begin
	  wb_clk_in=0;
	  wb_rst=1;
	  #13;
	  wb_rst=0;
	  go=0;
	  tip=0;
	  divider=0;
	  #7;
	  divider=1;
	  #10;
	  go=1;
	  #10;
	  tip=1;
	  last_clk=0;
	  #100;
	  $finish;
	end
endmodule
