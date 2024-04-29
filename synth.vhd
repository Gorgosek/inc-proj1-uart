library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity UART_RX is
  port (
    CLK: in std_logic;
    RST: in std_logic;
    DIN: in std_logic;
    DOUT: out std_logic_vector (7 downto 0);
    DOUT_VLD: out std_logic
  );
end entity;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_fsm is
  port (
    clk : in std_logic;
    rst : in std_logic;
    din : in std_logic;
    cnt_wait : in std_logic_vector (4 downto 0);
    cnt_data : in std_logic_vector (3 downto 0);
    cnt_wait_en : out std_logic;
    cnt_data_en : out std_logic;
    rx_en : out std_logic;
    is_valid : out std_logic);
end entity uart_rx_fsm;

architecture rtl of uart_rx_fsm is
  signal state : std_logic_vector (2 downto 0);
  signal n84_o : std_logic;
  signal n85_o : std_logic;
  signal n89_o : std_logic;
  signal n90_o : std_logic;
  signal n94_o : std_logic;
  signal n96_o : std_logic;
  signal n97_o : std_logic;
  signal n99_o : std_logic;
  signal n100_o : std_logic;
  signal n101_o : std_logic;
  signal n105_o : std_logic;
  signal n106_o : std_logic;
  signal n110_o : std_logic;
  signal n111_o : std_logic;
  signal n112_o : std_logic;
  signal n114_o : std_logic_vector (2 downto 0);
  signal n116_o : std_logic;
  signal n118_o : std_logic;
  signal n120_o : std_logic_vector (2 downto 0);
  signal n122_o : std_logic;
  signal n124_o : std_logic;
  signal n126_o : std_logic_vector (2 downto 0);
  signal n128_o : std_logic;
  signal n130_o : std_logic;
  signal n132_o : std_logic_vector (2 downto 0);
  signal n134_o : std_logic;
  signal n136_o : std_logic_vector (2 downto 0);
  signal n138_o : std_logic;
  signal n139_o : std_logic_vector (4 downto 0);
  signal n140_o : std_logic_vector (2 downto 0);
  signal n141_o : std_logic_vector (2 downto 0);
  signal n143_o : std_logic_vector (2 downto 0);
  signal n146_q : std_logic_vector (2 downto 0) := "000";
begin
  cnt_wait_en <= n101_o;
  cnt_data_en <= n90_o;
  rx_en <= n85_o;
  is_valid <= n106_o;
  -- uart_rx_fsm.vhd:29:12
  state <= n146_q; -- (isignal)
  -- uart_rx_fsm.vhd:31:28
  n84_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:31:18
  n85_o <= '0' when n84_o = '0' else '1';
  -- uart_rx_fsm.vhd:32:34
  n89_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:32:24
  n90_o <= '0' when n89_o = '0' else '1';
  -- uart_rx_fsm.vhd:33:34
  n94_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:33:60
  n96_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:33:52
  n97_o <= n94_o or n96_o;
  -- uart_rx_fsm.vhd:33:82
  n99_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:33:74
  n100_o <= n97_o or n99_o;
  -- uart_rx_fsm.vhd:33:24
  n101_o <= '0' when n100_o = '0' else '1';
  -- uart_rx_fsm.vhd:34:31
  n105_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:34:21
  n106_o <= '0' when n105_o = '0' else '1';
  -- uart_rx_fsm.vhd:36:12
  n110_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:39:23
  n111_o <= not rst;
  -- uart_rx_fsm.vhd:41:40
  n112_o <= not din;
  -- uart_rx_fsm.vhd:41:34
  n114_o <= state when n112_o = '0' else "001";
  -- uart_rx_fsm.vhd:41:21
  n116_o <= '1' when state = "000" else '0';
  -- uart_rx_fsm.vhd:44:57
  n118_o <= '1' when cnt_wait = "11000" else '0';
  -- uart_rx_fsm.vhd:44:46
  n120_o <= state when n118_o = '0' else "010";
  -- uart_rx_fsm.vhd:44:21
  n122_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:47:53
  n124_o <= '1' when cnt_data = "1000" else '0';
  -- uart_rx_fsm.vhd:47:42
  n126_o <= state when n124_o = '0' else "011";
  -- uart_rx_fsm.vhd:47:21
  n128_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:50:57
  n130_o <= '1' when cnt_wait = "10000" else '0';
  -- uart_rx_fsm.vhd:50:46
  n132_o <= state when n130_o = '0' else "100";
  -- uart_rx_fsm.vhd:50:21
  n134_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:53:42
  n136_o <= state when din = '0' else "000";
  -- uart_rx_fsm.vhd:53:21
  n138_o <= '1' when state = "100" else '0';
  n139_o <= n138_o & n134_o & n128_o & n122_o & n116_o;
  -- uart_rx_fsm.vhd:40:17
  with n139_o select n140_o <=
    n136_o when "10000",
    n132_o when "01000",
    n126_o when "00100",
    n120_o when "00010",
    n114_o when "00001",
    state when others;
  -- uart_rx_fsm.vhd:39:13
  n141_o <= state when n111_o = '0' else n140_o;
  -- uart_rx_fsm.vhd:37:13
  n143_o <= n141_o when rst = '0' else "000";
  -- uart_rx_fsm.vhd:36:9
  process (clk)
  begin
    if rising_edge (clk) then
      n146_q <= n143_o;
    end if;
  end process;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of uart_rx is
  signal wrap_CLK: std_logic;
  signal wrap_RST: std_logic;
  signal wrap_DIN: std_logic;
  subtype typwrap_DOUT is std_logic_vector (7 downto 0);
  signal wrap_DOUT: typwrap_DOUT;
  signal wrap_DOUT_VLD: std_logic;
  signal cnt_wait : std_logic_vector (4 downto 0);
  signal cnt_wait_en : std_logic;
  signal cnt_data : std_logic_vector (3 downto 0);
  signal rx_en : std_logic;
  signal is_valid : std_logic;
  signal fsm_cnt_wait_en : std_logic;
  signal fsm_cnt_data_en : std_logic;
  signal fsm_rx_en : std_logic;
  signal fsm_is_valid : std_logic;
  signal n8_o : std_logic;
  signal n10_o : std_logic_vector (4 downto 0);
  signal n12_o : std_logic_vector (4 downto 0);
  signal n13_o : std_logic;
  signal n14_o : std_logic;
  signal n16_o : std_logic_vector (2 downto 0);
  signal n20_o : std_logic_vector (3 downto 0);
  signal n21_o : std_logic;
  signal n23_o : std_logic_vector (3 downto 0);
  signal n24_o : std_logic_vector (7 downto 0);
  signal n26_o : std_logic_vector (4 downto 0);
  signal n27_o : std_logic_vector (3 downto 0);
  signal n29_o : std_logic_vector (7 downto 0);
  signal n31_o : std_logic_vector (4 downto 0);
  signal n33_o : std_logic_vector (3 downto 0);
  signal n38_q : std_logic_vector (7 downto 0);
  signal n39_q : std_logic_vector (4 downto 0);
  signal n40_q : std_logic_vector (3 downto 0);
  signal n42_o : std_logic;
  signal n43_o : std_logic;
  signal n44_o : std_logic;
  signal n45_o : std_logic;
  signal n46_o : std_logic;
  signal n47_o : std_logic;
  signal n48_o : std_logic;
  signal n49_o : std_logic;
  signal n50_o : std_logic;
  signal n51_o : std_logic;
  signal n52_o : std_logic;
  signal n53_o : std_logic;
  signal n54_o : std_logic;
  signal n55_o : std_logic;
  signal n56_o : std_logic;
  signal n57_o : std_logic;
  signal n58_o : std_logic;
  signal n59_o : std_logic;
  signal n60_o : std_logic;
  signal n61_o : std_logic;
  signal n62_o : std_logic;
  signal n63_o : std_logic;
  signal n64_o : std_logic;
  signal n65_o : std_logic;
  signal n66_o : std_logic;
  signal n67_o : std_logic;
  signal n68_o : std_logic;
  signal n69_o : std_logic;
  signal n70_o : std_logic;
  signal n71_o : std_logic;
  signal n72_o : std_logic;
  signal n73_o : std_logic;
  signal n74_o : std_logic;
  signal n75_o : std_logic;
  signal n76_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n38_q;
  wrap_DOUT_VLD <= is_valid;
  -- uart_rx.vhd:26:12
  cnt_wait <= n39_q; -- (signal)
  -- uart_rx.vhd:27:12
  cnt_wait_en <= fsm_cnt_wait_en; -- (signal)
  -- uart_rx.vhd:28:12
  cnt_data <= n40_q; -- (signal)
  -- uart_rx.vhd:30:12
  rx_en <= fsm_rx_en; -- (signal)
  -- uart_rx.vhd:31:12
  is_valid <= fsm_is_valid; -- (signal)
  -- uart_rx.vhd:37:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    din => wrap_DIN,
    cnt_wait => cnt_wait,
    cnt_data => cnt_data,
    cnt_wait_en => fsm_cnt_wait_en,
    cnt_data_en => open,
    rx_en => fsm_rx_en,
    is_valid => fsm_is_valid);
  -- uart_rx.vhd:52:12
  n8_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- uart_rx.vhd:59:42
  n10_o <= std_logic_vector (unsigned (cnt_wait) + unsigned'("00001"));
  -- uart_rx.vhd:58:17
  n12_o <= "00000" when cnt_wait_en = '0' else n10_o;
  -- uart_rx.vhd:64:44
  n13_o <= cnt_wait (4);
  -- uart_rx.vhd:64:32
  n14_o <= rx_en and n13_o;
  -- uart_rx.vhd:65:29
  n16_o <= cnt_data (2 downto 0);  --  trunc
  -- uart_rx.vhd:66:46
  n20_o <= std_logic_vector (unsigned (cnt_data) + unsigned'("0001"));
  -- uart_rx.vhd:68:29
  n21_o <= not rx_en;
  -- uart_rx.vhd:68:17
  n23_o <= cnt_data when n21_o = '0' else "0000";
  -- uart_rx.vhd:64:17
  n24_o <= n38_q when n14_o = '0' else n76_o;
  -- uart_rx.vhd:64:17
  n26_o <= n12_o when n14_o = '0' else "00001";
  -- uart_rx.vhd:64:17
  n27_o <= n23_o when n14_o = '0' else n20_o;
  -- uart_rx.vhd:53:13
  n29_o <= n24_o when wrap_RST = '0' else "00000000";
  -- uart_rx.vhd:53:13
  n31_o <= n26_o when wrap_RST = '0' else "00000";
  -- uart_rx.vhd:53:13
  n33_o <= n27_o when wrap_RST = '0' else "0000";
  -- uart_rx.vhd:52:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n38_q <= n29_o;
    end if;
  end process;
  -- uart_rx.vhd:52:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n39_q <= n31_o;
    end if;
  end process;
  -- uart_rx.vhd:52:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n40_q <= n33_o;
    end if;
  end process;
  -- uart_rx.vhd:65:25
  n42_o <= n16_o (2);
  -- uart_rx.vhd:65:25
  n43_o <= not n42_o;
  -- uart_rx.vhd:65:25
  n44_o <= n16_o (1);
  -- uart_rx.vhd:65:25
  n45_o <= not n44_o;
  -- uart_rx.vhd:65:25
  n46_o <= n43_o and n45_o;
  -- uart_rx.vhd:65:25
  n47_o <= n43_o and n44_o;
  -- uart_rx.vhd:65:25
  n48_o <= n42_o and n45_o;
  -- uart_rx.vhd:65:25
  n49_o <= n42_o and n44_o;
  -- uart_rx.vhd:65:25
  n50_o <= n16_o (0);
  -- uart_rx.vhd:65:25
  n51_o <= not n50_o;
  -- uart_rx.vhd:65:25
  n52_o <= n46_o and n51_o;
  -- uart_rx.vhd:65:25
  n53_o <= n46_o and n50_o;
  -- uart_rx.vhd:65:25
  n54_o <= n47_o and n51_o;
  -- uart_rx.vhd:65:25
  n55_o <= n47_o and n50_o;
  -- uart_rx.vhd:65:25
  n56_o <= n48_o and n51_o;
  -- uart_rx.vhd:65:25
  n57_o <= n48_o and n50_o;
  -- uart_rx.vhd:65:25
  n58_o <= n49_o and n51_o;
  -- uart_rx.vhd:65:25
  n59_o <= n49_o and n50_o;
  n60_o <= n38_q (0);
  -- uart_rx.vhd:65:25
  n61_o <= n60_o when n52_o = '0' else wrap_DIN;
  n62_o <= n38_q (1);
  -- uart_rx.vhd:65:25
  n63_o <= n62_o when n53_o = '0' else wrap_DIN;
  n64_o <= n38_q (2);
  -- uart_rx.vhd:65:25
  n65_o <= n64_o when n54_o = '0' else wrap_DIN;
  n66_o <= n38_q (3);
  -- uart_rx.vhd:65:25
  n67_o <= n66_o when n55_o = '0' else wrap_DIN;
  n68_o <= n38_q (4);
  -- uart_rx.vhd:65:25
  n69_o <= n68_o when n56_o = '0' else wrap_DIN;
  n70_o <= n38_q (5);
  -- uart_rx.vhd:65:25
  n71_o <= n70_o when n57_o = '0' else wrap_DIN;
  n72_o <= n38_q (6);
  -- uart_rx.vhd:65:25
  n73_o <= n72_o when n58_o = '0' else wrap_DIN;
  n74_o <= n38_q (7);
  -- uart_rx.vhd:65:25
  n75_o <= n74_o when n59_o = '0' else wrap_DIN;
  n76_o <= n75_o & n73_o & n71_o & n69_o & n67_o & n65_o & n63_o & n61_o;
end rtl;
