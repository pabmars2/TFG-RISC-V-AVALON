// AvalonUARTQsys.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module AvalonUARTQsys (
		output wire  avalon_timer_0_external_interface_conduit,  //  avalon_timer_0_external_interface.conduit
		input  wire  avalonmasteruart_0_control_flag_tx_flag_tx, // avalonmasteruart_0_control_flag_tx.flag_tx
		input  wire  avalonmasteruart_0_rs232_rx_rx,             //        avalonmasteruart_0_rs232_rx.rx
		output wire  avalonmasteruart_0_rs232_tx_tx,             //        avalonmasteruart_0_rs232_tx.tx
		input  wire  clk_clk,                                    //                                clk.clk
		input  wire  reset_reset_n                               //                              reset.reset_n
	);

	wire  [31:0] avalonmasteruart_0_avalon_master_readdata;                // mm_interconnect_0:AvalonMasterUART_0_avalon_master_readdata -> AvalonMasterUART_0:READDATA
	wire         avalonmasteruart_0_avalon_master_waitrequest;             // mm_interconnect_0:AvalonMasterUART_0_avalon_master_waitrequest -> AvalonMasterUART_0:WAITREQUEST
	wire  [31:0] avalonmasteruart_0_avalon_master_address;                 // AvalonMasterUART_0:ADDRESS -> mm_interconnect_0:AvalonMasterUART_0_avalon_master_address
	wire         avalonmasteruart_0_avalon_master_read;                    // AvalonMasterUART_0:READ -> mm_interconnect_0:AvalonMasterUART_0_avalon_master_read
	wire         avalonmasteruart_0_avalon_master_lock;                    // AvalonMasterUART_0:LOCK -> mm_interconnect_0:AvalonMasterUART_0_avalon_master_lock
	wire  [31:0] avalonmasteruart_0_avalon_master_writedata;               // AvalonMasterUART_0:WRITEDATA -> mm_interconnect_0:AvalonMasterUART_0_avalon_master_writedata
	wire         avalonmasteruart_0_avalon_master_write;                   // AvalonMasterUART_0:WRITE -> mm_interconnect_0:AvalonMasterUART_0_avalon_master_write
	wire         mm_interconnect_0_avalon_timer_0_avalon_slave_chipselect; // mm_interconnect_0:avalon_timer_0_avalon_slave_chipselect -> avalon_timer_0:chipselect
	wire  [31:0] mm_interconnect_0_avalon_timer_0_avalon_slave_readdata;   // avalon_timer_0:readdata -> mm_interconnect_0:avalon_timer_0_avalon_slave_readdata
	wire   [2:0] mm_interconnect_0_avalon_timer_0_avalon_slave_address;    // mm_interconnect_0:avalon_timer_0_avalon_slave_address -> avalon_timer_0:address
	wire         mm_interconnect_0_avalon_timer_0_avalon_slave_read;       // mm_interconnect_0:avalon_timer_0_avalon_slave_read -> avalon_timer_0:read
	wire         mm_interconnect_0_avalon_timer_0_avalon_slave_write;      // mm_interconnect_0:avalon_timer_0_avalon_slave_write -> avalon_timer_0:write
	wire  [31:0] mm_interconnect_0_avalon_timer_0_avalon_slave_writedata;  // mm_interconnect_0:avalon_timer_0_avalon_slave_writedata -> avalon_timer_0:writedata
	wire         rst_controller_reset_out_reset;                           // rst_controller:reset_out -> [AvalonMasterUART_0:RST, mm_interconnect_0:AvalonMasterUART_0_reset_reset_bridge_in_reset_reset, mm_interconnect_0:avalon_timer_0_reset_sink_reset_bridge_in_reset_reset]
	wire         rst_controller_001_reset_out_reset;                       // rst_controller_001:reset_out -> avalon_timer_0:reset

	avalon_UART #(
		.c_CLKS_PER_BIT (434)
	) avalonmasteruart_0 (
		.CLK           (clk_clk),                                      //         clock.clk
		.READDATA      (avalonmasteruart_0_avalon_master_readdata),    // avalon_master.readdata
		.WAITREQUEST   (avalonmasteruart_0_avalon_master_waitrequest), //              .waitrequest
		.ADDRESS       (avalonmasteruart_0_avalon_master_address),     //              .address
		.WRITEDATA     (avalonmasteruart_0_avalon_master_writedata),   //              .writedata
		.BEGINTRANSFER (),                                             //              .flush
		.READ          (avalonmasteruart_0_avalon_master_read),        //              .read
		.WRITE         (avalonmasteruart_0_avalon_master_write),       //              .write
		.LOCK          (avalonmasteruart_0_avalon_master_lock),        //              .lock
		.RST           (rst_controller_reset_out_reset),               //         reset.reset
		.flag_tx       (avalonmasteruart_0_control_flag_tx_flag_tx),   //       control.flag_tx
		.TX            (avalonmasteruart_0_rs232_tx_tx),               //      rs232_tx.tx
		.RX            (avalonmasteruart_0_rs232_rx_rx),               //      rs232_rx.rx
		.doneSending   ()                                              //   DoneSending.donesending
	);

	avalon_timer avalon_timer_0 (
		.clock      (clk_clk),                                                  //         clock_sink.clk
		.reset      (rst_controller_001_reset_out_reset),                       //         reset_sink.reset
		.irq        (),                                                         //   interrupt_sender.irq
		.chipselect (mm_interconnect_0_avalon_timer_0_avalon_slave_chipselect), //       avalon_slave.chipselect
		.address    (mm_interconnect_0_avalon_timer_0_avalon_slave_address),    //                   .address
		.write      (mm_interconnect_0_avalon_timer_0_avalon_slave_write),      //                   .write
		.writedata  (mm_interconnect_0_avalon_timer_0_avalon_slave_writedata),  //                   .writedata
		.read       (mm_interconnect_0_avalon_timer_0_avalon_slave_read),       //                   .read
		.readdata   (mm_interconnect_0_avalon_timer_0_avalon_slave_readdata),   //                   .readdata
		.out_th     (avalon_timer_0_external_interface_conduit)                 // external_interface.conduit
	);

	AvalonUARTQsys_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                         (clk_clk),                                                  //                                       clk_0_clk.clk
		.avalon_timer_0_reset_sink_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                           // avalon_timer_0_reset_sink_reset_bridge_in_reset.reset
		.AvalonMasterUART_0_reset_reset_bridge_in_reset_reset  (rst_controller_reset_out_reset),                           //  AvalonMasterUART_0_reset_reset_bridge_in_reset.reset
		.AvalonMasterUART_0_avalon_master_address              (avalonmasteruart_0_avalon_master_address),                 //                AvalonMasterUART_0_avalon_master.address
		.AvalonMasterUART_0_avalon_master_waitrequest          (avalonmasteruart_0_avalon_master_waitrequest),             //                                                .waitrequest
		.AvalonMasterUART_0_avalon_master_read                 (avalonmasteruart_0_avalon_master_read),                    //                                                .read
		.AvalonMasterUART_0_avalon_master_readdata             (avalonmasteruart_0_avalon_master_readdata),                //                                                .readdata
		.AvalonMasterUART_0_avalon_master_write                (avalonmasteruart_0_avalon_master_write),                   //                                                .write
		.AvalonMasterUART_0_avalon_master_writedata            (avalonmasteruart_0_avalon_master_writedata),               //                                                .writedata
		.AvalonMasterUART_0_avalon_master_lock                 (avalonmasteruart_0_avalon_master_lock),                    //                                                .lock
		.avalon_timer_0_avalon_slave_address                   (mm_interconnect_0_avalon_timer_0_avalon_slave_address),    //                     avalon_timer_0_avalon_slave.address
		.avalon_timer_0_avalon_slave_write                     (mm_interconnect_0_avalon_timer_0_avalon_slave_write),      //                                                .write
		.avalon_timer_0_avalon_slave_read                      (mm_interconnect_0_avalon_timer_0_avalon_slave_read),       //                                                .read
		.avalon_timer_0_avalon_slave_readdata                  (mm_interconnect_0_avalon_timer_0_avalon_slave_readdata),   //                                                .readdata
		.avalon_timer_0_avalon_slave_writedata                 (mm_interconnect_0_avalon_timer_0_avalon_slave_writedata),  //                                                .writedata
		.avalon_timer_0_avalon_slave_chipselect                (mm_interconnect_0_avalon_timer_0_avalon_slave_chipselect)  //                                                .chipselect
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("both"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
