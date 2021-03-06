module avalon_UART(CLK, RST, flag_tx, TX, RX, READDATA, WAITREQUEST, ADDRESS, WRITEDATA, BEGINTRANSFER, READ, WRITE, LOCK, doneSending);

parameter c_CLKS_PER_BIT = 434;

input CLK, RST;

////////////
//EXTERNAL//
////////////
input flag_tx;
input RX;
output TX;
output doneSending;

//////////////////
//AVALON SIGNALS//
//////////////////
input [31 : 0] READDATA;
input WAITREQUEST;
output [31 : 0] ADDRESS;
output [31 : 0] WRITEDATA;
output BEGINTRANSFER;
output READ, WRITE;
output LOCK;

////////////////////
//INTERNAL SIGNALS//
////////////////////
reg doneRecieved, doneAvalon;
reg ctrAvalon, flag_tx_UART;
reg startTransfer;
reg [1 : 0] control;
reg [31 : 0] addressAvalon;
reg [31 : 0] dataRecieved;
reg [31 : 0] dataToSend;//, data_to_send;
reg [31 : 0] data_to_write;


enum {IDLE, RECIEVE, TRANS, DONERX, DONETX} state;

enum {IDLEWr, TRANSMIT, DONEWr} stateTransmit;



UART #(.c_CLKS_PER_BIT(c_CLKS_PER_BIT)) UART(
	.CLK(CLK), 
	.TX(TX), 
	.RX(RX), 
	.data_rx(dataRecieved), 
	.done_rx(doneRecieved), 
	.data_tx(dataToSend), 
	.flag_tx(flag_tx_UART), 
	.controlBits(control),
	.done_tx(doneSending));



avalon_mm_master  masterUART(
   .CLK(CLK), 
	.RESET(RST),
	.ADDRESS(ADDRESS), 
	.BEGINTRANSFER(BEGINTRANSFER), 
	.READ(READ), 
	.WRITE(WRITE), 
	.WRITEDATA(WRITEDATA), 
	.LOCK(LOCK), 
	.WAITREQUEST(WAITREQUEST), 
	.READDATA(READDATA),
	.done(doneAvalon), 
	.data_read(dataToSend),  
	.data_to_write(data_to_write),
   .rnw(ctrAvalon), 
	.start(startTransfer), 
	.address_to_access(addressAvalon)) ;

	
	
always_ff @(posedge CLK or posedge RST)
begin
	if(RST)
	begin
		state <= IDLE;
		stateTransmit <= IDLEWr;
	end
	else
	begin
	
		///////////Caso general///////////
	
		case(state)
			
			IDLE:
				begin
					if(doneRecieved)
						state  <= RECIEVE;
					else
					begin
						if(flag_tx && (stateTransmit == IDLEWr))
							state <= TRANS;
						else
							state <= IDLE;
					end
				end			
			
			
			RECIEVE:
				begin
					if(doneAvalon)
						state <= DONERX;
					else
						state <= RECIEVE;
				end
			
			TRANS:
				begin
					if(doneAvalon)
						state <= DONETX;
					else
						state <= TRANS;
				end
			
			DONERX: state <= IDLE; 
			
			DONETX: state <= IDLE;
			
			default: state <= IDLE;

		
		endcase
		
		///////////Caso Tx///////////
		
		case(stateTransmit)
			
			IDLEWr:
				begin
					if(state == DONETX)
						stateTransmit <= TRANSMIT;
					else
						stateTransmit <= IDLEWr;
				end
			
			TRANSMIT:
				begin
					if(doneSending)
						stateTransmit <= DONEWr;
					else
						stateTransmit <= TRANSMIT;
				end
			
			DONEWr: stateTransmit <= IDLEWr;
			
			default: stateTransmit <= IDLEWr;

		
		endcase
		
		
	end	
end


always_comb 
begin
	if(RST)
	begin
	
		addressAvalon = 0;
		ctrAvalon = 1'b0;
		startTransfer = 1'b0;
		data_to_write = 0;
		flag_tx_UART = 1'b0;
		
	end
	else
	begin
		case(state)
		
			IDLE:
				begin
				
					addressAvalon = 0;
					ctrAvalon = 1'b0;
					startTransfer = 1'b0;
					data_to_write = 0;
					
				end
			
			RECIEVE:
				begin
				
					case(control) 
					
						2'b00: addressAvalon = 32'h00000000;
						
						2'b01: addressAvalon = 32'h00000004;
						
						2'b10: addressAvalon = 32'h00000008;
						
						default: addressAvalon = 32'h00000000;
					
					endcase
					
				ctrAvalon = 1'b0;
				startTransfer = 1'b1;
				data_to_write = dataRecieved; 
					
				end
				
			TRANS:
				begin
				
					addressAvalon = 32'h0000000C;
					ctrAvalon = 1'b1;
					
					data_to_write = 0;
					
					startTransfer = 1'b1;
	
				end
		
			DONERX:
				begin
				
					addressAvalon = 0;
					ctrAvalon = 1'b0;
					startTransfer = 1'b0;
					data_to_write = dataRecieved;
				
				end
				
		
			DONETX:
				begin
				
					addressAvalon = 32'h0000000C;
					ctrAvalon = 1'b1;
					startTransfer = 1'b1;
					data_to_write = 0;
						
				end
			
			default:
				begin
				
					addressAvalon = 0;
					ctrAvalon = 1'b0;
					startTransfer = 1'b0;
					data_to_write = 0;
					
				end
			
		endcase
		
		case(stateTransmit)
		
			IDLEWr:	flag_tx_UART = 1'b0;
		
			TRANSMIT:	flag_tx_UART = 1'b1;
		
			DONEWr:	flag_tx_UART = 1'b0;
			
			default:	flag_tx_UART = 1'b0;
			
		endcase
	end
end

endmodule 