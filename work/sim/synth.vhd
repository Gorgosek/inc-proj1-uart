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
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n90_o : std_logic;
  signal n91_o : std_logic;
  signal n95_o : std_logic;
  signal n97_o : std_logic;
  signal n98_o : std_logic;
  signal n100_o : std_logic;
  signal n101_o : std_logic;
  signal n103_o : std_logic;
  signal n104_o : std_logic;
  signal n105_o : std_logic;
  signal n109_o : std_logic;
  signal n110_o : std_logic;
  signal n114_o : std_logic;
  signal n115_o : std_logic;
  signal n116_o : std_logic;
  signal n118_o : std_logic_vector (2 downto 0);
  signal n120_o : std_logic;
  signal n122_o : std_logic;
  signal n124_o : std_logic_vector (2 downto 0);
  signal n126_o : std_logic;
  signal n128_o : std_logic;
  signal n130_o : std_logic_vector (2 downto 0);
  signal n132_o : std_logic;
  signal n134_o : std_logic;
  signal n136_o : std_logic_vector (2 downto 0);
  signal n138_o : std_logic;
  signal n140_o : std_logic_vector (2 downto 0);
  signal n142_o : std_logic;
  signal n143_o : std_logic_vector (4 downto 0);
  signal n144_o : std_logic_vector (2 downto 0);
  signal n145_o : std_logic_vector (2 downto 0);
  signal n147_o : std_logic_vector (2 downto 0);
  signal n150_q : std_logic_vector (2 downto 0) := "000";
begin
  cnt_wait_en <= n105_o;
  cnt_data_en <= n91_o;
  rx_en <= n86_o;
  is_valid <= n110_o;
  -- work/uart_rx_fsm.vhd:29:12
  state <= n150_q; -- (isignal)
  -- work/uart_rx_fsm.vhd:31:28
  n85_o <= '1' when state = "010" else '0';
  -- work/uart_rx_fsm.vhd:31:18
  n86_o <= '0' when n85_o = '0' else '1';
  -- work/uart_rx_fsm.vhd:32:34
  n90_o <= '1' when state = "010" else '0';
  -- work/uart_rx_fsm.vhd:32:24
  n91_o <= '0' when n90_o = '0' else '1';
  -- work/uart_rx_fsm.vhd:33:34
  n95_o <= '1' when state = "000" else '0';
  -- work/uart_rx_fsm.vhd:33:48
  n97_o <= '1' when state = "001" else '0';
  -- work/uart_rx_fsm.vhd:33:40
  n98_o <= n95_o or n97_o;
  -- work/uart_rx_fsm.vhd:33:74
  n100_o <= '1' when state = "010" else '0';
  -- work/uart_rx_fsm.vhd:33:66
  n101_o <= n98_o or n100_o;
  -- work/uart_rx_fsm.vhd:33:96
  n103_o <= '1' when state = "011" else '0';
  -- work/uart_rx_fsm.vhd:33:88
  n104_o <= n101_o or n103_o;
  -- work/uart_rx_fsm.vhd:33:24
  n105_o <= '0' when n104_o = '0' else '1';
  -- work/uart_rx_fsm.vhd:34:31
  n109_o <= '1' when state = "100" else '0';
  -- work/uart_rx_fsm.vhd:34:21
  n110_o <= '0' when n109_o = '0' else '1';
  -- work/uart_rx_fsm.vhd:36:12
  n114_o <= '1' when rising_edge (clk) else '0';
  -- work/uart_rx_fsm.vhd:39:23
  n115_o <= not rst;
  -- work/uart_rx_fsm.vhd:41:40
  n116_o <= not din;
  -- work/uart_rx_fsm.vhd:41:34
  n118_o <= state when n116_o = '0' else "001";
  -- work/uart_rx_fsm.vhd:41:21
  n120_o <= '1' when state = "000" else '0';
  -- work/uart_rx_fsm.vhd:44:57
  n122_o <= '1' when cnt_wait = "11000" else '0';
  -- work/uart_rx_fsm.vhd:44:46
  n124_o <= state when n122_o = '0' else "010";
  -- work/uart_rx_fsm.vhd:44:21
  n126_o <= '1' when state = "001" else '0';
  -- work/uart_rx_fsm.vhd:47:53
  n128_o <= '1' when cnt_data = "1000" else '0';
  -- work/uart_rx_fsm.vhd:47:42
  n130_o <= state when n128_o = '0' else "011";
  -- work/uart_rx_fsm.vhd:47:21
  n132_o <= '1' when state = "010" else '0';
  -- work/uart_rx_fsm.vhd:50:57
  n134_o <= '1' when cnt_wait = "10000" else '0';
  -- work/uart_rx_fsm.vhd:50:46
  n136_o <= state when n134_o = '0' else "100";
  -- work/uart_rx_fsm.vhd:50:21
  n138_o <= '1' when state = "011" else '0';
  -- work/uart_rx_fsm.vhd:53:42
  n140_o <= state when din = '0' else "000";
  -- work/uart_rx_fsm.vhd:53:21
  n142_o <= '1' when state = "100" else '0';
  n143_o <= n142_o & n138_o & n132_o & n126_o & n120_o;
  -- work/uart_rx_fsm.vhd:40:17
  with n143_o select n144_o <=
    n140_o when "10000",
    n136_o when "01000",
    n130_o when "00100",
    n124_o when "00010",
    n118_o when "00001",
    state when others;
  -- work/uart_rx_fsm.vhd:39:13
  n145_o <= state when n115_o = '0' else n144_o;
  -- work/uart_rx_fsm.vhd:37:13
  n147_o <= n145_o when rst = '0' else "000";
  -- work/uart_rx_fsm.vhd:36:9
  process (clk)
  begin
    if rising_edge (clk) then
      n150_q <= n147_o;
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
  signal n11_o : std_logic;
  signal n13_o : std_logic_vector (4 downto 0);
  signal n14_o : std_logic_vector (4 downto 0);
  signal n15_o : std_logic;
  signal n16_o : std_logic;
  signal n18_o : std_logic_vector (2 downto 0);
  signal n22_o : std_logic_vector (3 downto 0);
  signal n23_o : std_logic;
  signal n25_o : std_logic_vector (3 downto 0);
  signal n26_o : std_logic_vector (7 downto 0);
  signal n28_o : std_logic_vector (4 downto 0);
  signal n29_o : std_logic_vector (3 downto 0);
  signal n31_o : std_logic_vector (7 downto 0);
  signal n33_o : std_logic_vector (4 downto 0);
  signal n35_o : std_logic_vector (3 downto 0);
  signal n40_q : std_logic_vector (7 downto 0);
  signal n41_q : std_logic_vector (4 downto 0);
  signal n42_q : std_logic_vector (3 downto 0);
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
  signal n76_o : std_logic;
  signal n77_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n40_q;
  wrap_DOUT_VLD <= is_valid;
  -- work/uart_rx.vhd:26:12
  cnt_wait <= n41_q; -- (signal)
  -- work/uart_rx.vhd:27:12
  cnt_wait_en <= fsm_cnt_wait_en; -- (signal)
  -- work/uart_rx.vhd:28:12
  cnt_data <= n42_q; -- (signal)
  -- work/uart_rx.vhd:30:12
  rx_en <= fsm_rx_en; -- (signal)
  -- work/uart_rx.vhd:31:12
  is_valid <= fsm_is_valid; -- (signal)
  -- work/uart_rx.vhd:36:5
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
  -- work/uart_rx.vhd:51:12
  n8_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- work/uart_rx.vhd:58:42
  n10_o <= std_logic_vector (unsigned (cnt_wait) + unsigned'("00001"));
  -- work/uart_rx.vhd:59:34
  n11_o <= not cnt_wait_en;
  -- work/uart_rx.vhd:59:17
  n13_o <= cnt_wait when n11_o = '0' else "00000";
  -- work/uart_rx.vhd:57:17
  n14_o <= n13_o when cnt_wait_en = '0' else n10_o;
  -- work/uart_rx.vhd:63:44
  n15_o <= cnt_wait (4);
  -- work/uart_rx.vhd:63:32
  n16_o <= rx_en and n15_o;
  -- work/uart_rx.vhd:64:25
  n18_o <= cnt_data (2 downto 0);  --  trunc
  -- work/uart_rx.vhd:65:42
  n22_o <= std_logic_vector (unsigned (cnt_data) + unsigned'("0001"));
  -- work/uart_rx.vhd:67:29
  n23_o <= not rx_en;
  -- work/uart_rx.vhd:67:17
  n25_o <= cnt_data when n23_o = '0' else "0000";
  -- work/uart_rx.vhd:63:17
  n26_o <= n40_q when n16_o = '0' else n77_o;
  -- work/uart_rx.vhd:63:17
  n28_o <= n14_o when n16_o = '0' else "00001";
  -- work/uart_rx.vhd:63:17
  n29_o <= n25_o when n16_o = '0' else n22_o;
  -- work/uart_rx.vhd:52:13
  n31_o <= n26_o when wrap_RST = '0' else "00000000";
  -- work/uart_rx.vhd:52:13
  n33_o <= n28_o when wrap_RST = '0' else "00000";
  -- work/uart_rx.vhd:52:13
  n35_o <= n29_o when wrap_RST = '0' else "0000";
  -- work/uart_rx.vhd:51:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n40_q <= n31_o;
    end if;
  end process;
  -- work/uart_rx.vhd:51:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n41_q <= n33_o;
    end if;
  end process;
  -- work/uart_rx.vhd:51:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n42_q <= n35_o;
    end if;
  end process;
  -- work/uart_rx.vhd:64:21
  n43_o <= n18_o (2);
  -- work/uart_rx.vhd:64:21
  n44_o <= not n43_o;
  -- work/uart_rx.vhd:64:21
  n45_o <= n18_o (1);
  -- work/uart_rx.vhd:64:21
  n46_o <= not n45_o;
  -- work/uart_rx.vhd:64:21
  n47_o <= n44_o and n46_o;
  -- work/uart_rx.vhd:64:21
  n48_o <= n44_o and n45_o;
  -- work/uart_rx.vhd:64:21
  n49_o <= n43_o and n46_o;
  -- work/uart_rx.vhd:64:21
  n50_o <= n43_o and n45_o;
  -- work/uart_rx.vhd:64:21
  n51_o <= n18_o (0);
  -- work/uart_rx.vhd:64:21
  n52_o <= not n51_o;
  -- work/uart_rx.vhd:64:21
  n53_o <= n47_o and n52_o;
  -- work/uart_rx.vhd:64:21
  n54_o <= n47_o and n51_o;
  -- work/uart_rx.vhd:64:21
  n55_o <= n48_o and n52_o;
  -- work/uart_rx.vhd:64:21
  n56_o <= n48_o and n51_o;
  -- work/uart_rx.vhd:64:21
  n57_o <= n49_o and n52_o;
  -- work/uart_rx.vhd:64:21
  n58_o <= n49_o and n51_o;
  -- work/uart_rx.vhd:64:21
  n59_o <= n50_o and n52_o;
  -- work/uart_rx.vhd:64:21
  n60_o <= n50_o and n51_o;
  n61_o <= n40_q (0);
  -- work/uart_rx.vhd:64:21
  n62_o <= n61_o when n53_o = '0' else wrap_DIN;
  n63_o <= n40_q (1);
  -- work/uart_rx.vhd:64:21
  n64_o <= n63_o when n54_o = '0' else wrap_DIN;
  n65_o <= n40_q (2);
  -- work/uart_rx.vhd:64:21
  n66_o <= n65_o when n55_o = '0' else wrap_DIN;
  n67_o <= n40_q (3);
  -- work/uart_rx.vhd:64:21
  n68_o <= n67_o when n56_o = '0' else wrap_DIN;
  n69_o <= n40_q (4);
  -- work/uart_rx.vhd:64:21
  n70_o <= n69_o when n57_o = '0' else wrap_DIN;
  n71_o <= n40_q (5);
  -- work/uart_rx.vhd:64:21
  n72_o <= n71_o when n58_o = '0' else wrap_DIN;
  n73_o <= n40_q (6);
  -- work/uart_rx.vhd:64:21
  n74_o <= n73_o when n59_o = '0' else wrap_DIN;
  n75_o <= n40_q (7);
  -- work/uart_rx.vhd:64:21
  n76_o <= n75_o when n60_o = '0' else wrap_DIN;
  n77_o <= n76_o & n74_o & n72_o & n70_o & n68_o & n66_o & n64_o & n62_o;
end rtl;
