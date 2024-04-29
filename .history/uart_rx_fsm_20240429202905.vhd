-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;



entity UART_RX_FSM is
    port(
       CLK : in std_logic;
       RST : in std_logic;
       DIN : in std_logic;
       CNT_WAIT : in std_logic_vector(4 downto 0);
       CNT_WAIT_EN : in std_logic;
       CNT_DATA : in std_logic_vector(3 downto 0);
       CNT_DATA_EN : in std_logic;
       RX_EN : in std_logic;
       IS_VALID : in std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
    type fsmState is (IDLE, SLEEP_UNTIL_DATA, RECEIVE_DATA, SLEEP_UNTIL_STOP, END_SETVALID);
    signal state : fsmState := IDLE;
begin
    RX_EN <= '1' when state=RECEIVE_DATA else '0';
    CNT_DATA_EN <= '1' when state=RECEIVE_DATA else '0';
    CNT_WAIT_EN <= '1' when state=IDLE or state=SLEEP_UNTIL_DATA or state=RECEIVE_DATA or state= SLEEP_UNTIL_STOP else '0';
    IS_VALID <= '1' when state=END_SETVALID;
    process (CLK) begin
        if rising_edge(CLK) then
            if RST = '1' then
                state <= IDLE;
            else
                case state is
                    when IDLE => if DIN='0' then 
                        state <= SLEEP_UNTIL_DATA;
                    end if;
                    when SLEEP_UNTIL_DATA => if CNT_WAIT='11000' then 
                        state <= RECEIVE_DATA;
                    end if;
                    when RECEIVE_DATA => if CNT_DATA='1000' then 
                        state <= SLEEP_UNTIL_STOP;
                    end if;
                    when SLEEP_UNTIL_STOP => if CNT_WAIT='10000' then 
                        state <= END_SETVALID;
                    end if;
                    when END_SETVALID => if DIN='1' then 
                        state <= IDLE;
                    end if;
                    when others => null;


end architecture;
