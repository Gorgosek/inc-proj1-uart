-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity UART_RX_FSM is
    port(
       CLK : in std_logic;
       RST : in std_logic
       DIN : in std_logic
       CNT_WAIT : in std_logic
       CNT_WAIT_EN : in std_logic
       CNT_DATA : in std_logic
       CNT_DATA_EN : in std_logic
       RX_EN : in std_logic
       IS_VALID : in std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
begin

end architecture;
