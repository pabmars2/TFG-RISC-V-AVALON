module top_QSYS_RISC(CLK, RST, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, TX, RX);

input CLK, RST;
input RX;

output [6 : 0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
output TX;

//wire RST_mem; 

//assign RST_mem = 1'b0;

FINAL_SYSTEM_QSYS u0 (
	.avalon_displays7seg_0_external_interface_conduit1 (HEX1), // avalon_displays7seg_0_external_interface.conduit1
   .avalon_displays7seg_0_external_interface_conduit0 (HEX0), //                                         .conduit0
   .avalon_displays7seg_0_external_interface_conduit2 (HEX2), //                                         .conduit2
   .avalon_displays7seg_0_external_interface_conduit3 (HEX3), //                                         .conduit3
   .avalon_displays7seg_0_external_interface_conduit4 (HEX4), //                                         .conduit4
   .avalon_displays7seg_0_external_interface_conduit5 (HEX5), //                                         .conduit5
   .avalon_displays7seg_0_external_interface_conduit6 (HEX6), //                                         .conduit6
   .avalon_displays7seg_0_external_interface_conduit7 (HEX7), //                                         .conduit7
   .avalonmasteruart_0_rs232_rx_rx                    (RX),                    //              avalonmasteruart_0_rs232_rx.rx
   .avalonmasteruart_0_rs232_tx_tx                    (TX),                    //              avalonmasteruart_0_rs232_tx.tx
   .clk_clk                                           (CLK),                                           //                                      clk.clk
   .reset_reset_n                                     (RST)                                      //                                    reset.reset_n
);




/*reg [3:0] count = 0;

always @(posedge CLK)
begin
	if(count < 3)
	begin
		RST <= 1'b1;
		count <= count + 1;
	end
	else
	begin
		RST <= 1'b0;
		count <= 5;
	end	
end*/

endmodule
