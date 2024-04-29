-- uart_rx.vhd: UART controller - receiving (RX) side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



-- Entity declaration (DO NOT ALTER THIS PART!)
entity UART_RX is
    port(
        CLK      : in std_logic;
        RST      : in std_logic;
        DIN      : in std_logic;
        DOUT     : out std_logic_vector(7 downto 0);
        DOUT_VLD : out std_logic
    );
end entity;



-- Architecture implementation (INSERT YOUR IMPLEMENTATION HERE)
architecture behavioral of UART_RX is
begin

    -- Instance of RX FSM
    fsm: entity work.UART_RX_FSM(behavioral)
    port map (
        CLK => CLK,
        RST => RST,
        DIN => din,
        CNT_WAIT => cnt_wait,
        CNT_WAIT_EN => cnt_wait_en,
        CNT_DATA => cnt_data,
        CNT_DATA_EN => cnt_data_en,
        RX_EN => rx_en,
        IS_VALID => is_valid
    );

    DOUT_VLD <= IS_VALID;
    process (CLK) begin 
        if rising_edge(CLK) then
            if RST='1' then
                CNT_WAIT <= "00000";
                CNT_DATA <= "0000";

end behavioral;
