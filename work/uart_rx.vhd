-- uart_rx.vhd: UART controller - receiving (RX) side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;



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
    signal cnt_wait : std_logic_vector(4 downto 0);
    signal cnt_wait_en : std_logic;
    signal cnt_data : std_logic_vector(3 downto 0);
    signal cnt_data_en : std_logic;
    signal rx_en : std_logic;
    signal is_valid : std_logic;
    signal first : std_logic;

begin

    -- Instance of RX FSM
    fsm: entity work.UART_RX_FSM(behavioral)
    port map (
        CLK => CLK,
        RST => RST,
        DIN => DIN,
        CNT_WAIT => cnt_wait,
        CNT_WAIT_EN => cnt_wait_en,
        CNT_DATA => cnt_data,
        CNT_DATA_EN => cnt_data_en,
        RX_EN => rx_en,
        IS_VALID => is_valid
    );

    DOUT_VLD <= is_valid;
    process (CLK) begin 
        if rising_edge(CLK) then
            if RST='1' then
                cnt_wait <= "00000";
                cnt_data <= "0000";
                DOUT <= (others => '0');
            else
                if cnt_wait_en = '1' then
                    cnt_wait <= cnt_wait + 1;
                else
                    cnt_wait <= "00000";
                end if;

                if rx_en = '1' and cnt_wait(4)='1' then
                        DOUT(to_integer(unsigned(cnt_data))) <= DIN;
                        cnt_data <= cnt_data + 1;
                        cnt_wait <= "00001";
                elsif rx_en = '0' then
                    cnt_data <= "0000";
                end if;
            end if;
        end if;
    end process;

end behavioral;
