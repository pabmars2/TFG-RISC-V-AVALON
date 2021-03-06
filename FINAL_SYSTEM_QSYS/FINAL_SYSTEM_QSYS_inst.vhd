	component FINAL_SYSTEM_QSYS is
		port (
			avalon_displays7seg_0_external_interface_conduit1 : out std_logic_vector(6 downto 0);        -- conduit1
			avalon_displays7seg_0_external_interface_conduit0 : out std_logic_vector(6 downto 0);        -- conduit0
			avalon_displays7seg_0_external_interface_conduit2 : out std_logic_vector(6 downto 0);        -- conduit2
			avalon_displays7seg_0_external_interface_conduit3 : out std_logic_vector(6 downto 0);        -- conduit3
			avalon_displays7seg_0_external_interface_conduit4 : out std_logic_vector(6 downto 0);        -- conduit4
			avalon_displays7seg_0_external_interface_conduit5 : out std_logic_vector(6 downto 0);        -- conduit5
			avalon_displays7seg_0_external_interface_conduit6 : out std_logic_vector(6 downto 0);        -- conduit6
			avalon_displays7seg_0_external_interface_conduit7 : out std_logic_vector(6 downto 0);        -- conduit7
			avalonmasteruart_0_rs232_rx_rx                    : in  std_logic                    := 'X'; -- rx
			avalonmasteruart_0_rs232_tx_tx                    : out std_logic;                           -- tx
			clk_clk                                           : in  std_logic                    := 'X'; -- clk
			reset_reset_n                                     : in  std_logic                    := 'X'  -- reset_n
		);
	end component FINAL_SYSTEM_QSYS;

	u0 : component FINAL_SYSTEM_QSYS
		port map (
			avalon_displays7seg_0_external_interface_conduit1 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit1, -- avalon_displays7seg_0_external_interface.conduit1
			avalon_displays7seg_0_external_interface_conduit0 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit0, --                                         .conduit0
			avalon_displays7seg_0_external_interface_conduit2 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit2, --                                         .conduit2
			avalon_displays7seg_0_external_interface_conduit3 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit3, --                                         .conduit3
			avalon_displays7seg_0_external_interface_conduit4 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit4, --                                         .conduit4
			avalon_displays7seg_0_external_interface_conduit5 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit5, --                                         .conduit5
			avalon_displays7seg_0_external_interface_conduit6 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit6, --                                         .conduit6
			avalon_displays7seg_0_external_interface_conduit7 => CONNECTED_TO_avalon_displays7seg_0_external_interface_conduit7, --                                         .conduit7
			avalonmasteruart_0_rs232_rx_rx                    => CONNECTED_TO_avalonmasteruart_0_rs232_rx_rx,                    --              avalonmasteruart_0_rs232_rx.rx
			avalonmasteruart_0_rs232_tx_tx                    => CONNECTED_TO_avalonmasteruart_0_rs232_tx_tx,                    --              avalonmasteruart_0_rs232_tx.tx
			clk_clk                                           => CONNECTED_TO_clk_clk,                                           --                                      clk.clk
			reset_reset_n                                     => CONNECTED_TO_reset_reset_n                                      --                                    reset.reset_n
		);

