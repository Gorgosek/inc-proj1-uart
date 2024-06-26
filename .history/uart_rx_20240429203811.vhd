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
    fsm: entity work.UART_RX_FSM
    port map (
        CLK => CLK,
        RST => RST,
        DIN : in std_logic;
        CNT_WAIT : in std_logic_vector(4 downto 0);
        CNT_WAIT_EN : in std_logic;
        CNT_DATA : in std_logic_vector(3 downto 0);
        CNT_DATA_EN : in std_logic;
        RX_EN : in std_logic;
        IS_VALID : in std_logic
    );

    DOUT <= (others => '0');
    DOUT_VLD <= '0';

end architecture;
