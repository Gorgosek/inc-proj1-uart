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
  signal n142_o : std_logic;
  signal n143_o : std_logic;
  signal n147_o : std_logic;
  signal n148_o : std_logic;
  signal n152_o : std_logic;
  signal n154_o : std_logic;
  signal n155_o : std_logic;
  signal n157_o : std_logic;
  signal n158_o : std_logic;
  signal n159_o : std_logic;
  signal n163_o : std_logic;
  signal n164_o : std_logic;
  signal n168_o : std_logic;
  signal n169_o : std_logic;
  signal n170_o : std_logic;
  signal n172_o : std_logic_vector (2 downto 0);
  signal n174_o : std_logic;
  signal n176_o : std_logic;
  signal n178_o : std_logic_vector (2 downto 0);
  signal n180_o : std_logic;
  signal n182_o : std_logic;
  signal n184_o : std_logic_vector (2 downto 0);
  signal n186_o : std_logic;
  signal n188_o : std_logic;
  signal n190_o : std_logic_vector (2 downto 0);
  signal n192_o : std_logic;
  signal n194_o : std_logic_vector (2 downto 0);
  signal n196_o : std_logic;
  signal n197_o : std_logic_vector (4 downto 0);
  signal n198_o : std_logic_vector (2 downto 0);
  signal n199_o : std_logic_vector (2 downto 0);
  signal n201_o : std_logic_vector (2 downto 0);
  signal n204_q : std_logic_vector (2 downto 0) := "000";
begin
  cnt_wait_en <= n159_o;
  cnt_data_en <= n148_o;
  rx_en <= n143_o;
  is_valid <= n164_o;
  -- work/uart_rx_fsm.vhd:29:12
  state <= n204_q; -- (isignal)
  -- work/uart_rx_fsm.vhd:31:28
  n142_o <= '1' when state = "010" else '0';
  -- work/uart_rx_fsm.vhd:31:18
  n143_o <= '0' when n142_o = '0' else '1';
  -- work/uart_rx_fsm.vhd:32:34
  n147_o <= '1' when state = "010" else '0';
  -- work/uart_rx_fsm.vhd:32:24
  n148_o <= '0' when n147_o = '0' else '1';
  -- work/uart_rx_fsm.vhd:33:34
  n152_o <= '1' when state = "001" else '0';
  -- work/uart_rx_fsm.vhd:33:60
  n154_o <= '1' when state = "010" else '0';
  -- work/uart_rx_fsm.vhd:33:52
  n155_o <= n152_o or n154_o;
  -- work/uart_rx_fsm.vhd:33:82
  n157_o <= '1' when state = "011" else '0';
  -- work/uart_rx_fsm.vhd:33:74
  n158_o <= n155_o or n157_o;
  -- work/uart_rx_fsm.vhd:33:24
  n159_o <= '0' when n158_o = '0' else '1';
  -- work/uart_rx_fsm.vhd:34:31
  n163_o <= '1' when state = "100" else '0';
  -- work/uart_rx_fsm.vhd:34:21
  n164_o <= '0' when n163_o = '0' else '1';
  -- work/uart_rx_fsm.vhd:36:12
  n168_o <= '1' when rising_edge (clk) else '0';
  -- work/uart_rx_fsm.vhd:39:23
  n169_o <= not rst;
  -- work/uart_rx_fsm.vhd:41:40
  n170_o <= not din;
  -- work/uart_rx_fsm.vhd:41:34
  n172_o <= state when n170_o = '0' else "001";
  -- work/uart_rx_fsm.vhd:41:21
  n174_o <= '1' when state = "000" else '0';
  -- work/uart_rx_fsm.vhd:44:57
  n176_o <= '1' when cnt_wait = "11000" else '0';
  -- work/uart_rx_fsm.vhd:44:46
  n178_o <= state when n176_o = '0' else "010";
  -- work/uart_rx_fsm.vhd:44:21
  n180_o <= '1' when state = "001" else '0';
  -- work/uart_rx_fsm.vhd:47:53
  n182_o <= '1' when cnt_data = "1000" else '0';
  -- work/uart_rx_fsm.vhd:47:42
  n184_o <= state when n182_o = '0' else "011";
  -- work/uart_rx_fsm.vhd:47:21
  n186_o <= '1' when state = "010" else '0';
  -- work/uart_rx_fsm.vhd:50:57
  n188_o <= '1' when cnt_wait = "10000" else '0';
  -- work/uart_rx_fsm.vhd:50:46
  n190_o <= state when n188_o = '0' else "100";
  -- work/uart_rx_fsm.vhd:50:21
  n192_o <= '1' when state = "011" else '0';
  -- work/uart_rx_fsm.vhd:53:42
  n194_o <= state when din = '0' else "000";
  -- work/uart_rx_fsm.vhd:53:21
  n196_o <= '1' when state = "100" else '0';
  n197_o <= n196_o & n192_o & n186_o & n180_o & n174_o;
  -- work/uart_rx_fsm.vhd:40:17
  with n197_o select n198_o <=
    n194_o when "10000",
    n190_o when "01000",
    n184_o when "00100",
    n178_o when "00010",
    n172_o when "00001",
    state when others;
  -- work/uart_rx_fsm.vhd:39:13
  n199_o <= state when n169_o = '0' else n198_o;
  -- work/uart_rx_fsm.vhd:37:13
  n201_o <= n199_o when rst = '0' else "000";
  -- work/uart_rx_fsm.vhd:36:9
  process (clk)
  begin
    if rising_edge (clk) then
      n204_q <= n201_o;
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
  signal first : std_logic;
  signal fsm_cnt_wait_en : std_logic;
  signal fsm_cnt_data_en : std_logic;
  signal fsm_rx_en : std_logic;
  signal fsm_is_valid : std_logic;
  signal n8_o : std_logic;
  signal n10_o : std_logic_vector (3 downto 0);
  signal n12_o : std_logic_vector (4 downto 0);
  signal n14_o : std_logic_vector (4 downto 0);
  signal n15_o : std_logic;
  signal n16_o : std_logic;
  signal n17_o : std_logic;
  signal n18_o : std_logic;
  signal n20_o : std_logic_vector (2 downto 0);
  signal n24_o : std_logic_vector (3 downto 0);
  signal n25_o : std_logic;
  signal n27_o : std_logic_vector (2 downto 0);
  signal n31_o : std_logic_vector (3 downto 0);
  signal n32_o : std_logic_vector (7 downto 0);
  signal n34_o : std_logic_vector (4 downto 0);
  signal n35_o : std_logic_vector (3 downto 0);
  signal n36_o : std_logic_vector (7 downto 0);
  signal n38_o : std_logic_vector (4 downto 0);
  signal n39_o : std_logic_vector (3 downto 0);
  signal n41_o : std_logic;
  signal n42_o : std_logic;
  signal n44_o : std_logic_vector (3 downto 0);
  signal n45_o : std_logic_vector (7 downto 0);
  signal n46_o : std_logic_vector (4 downto 0);
  signal n47_o : std_logic_vector (3 downto 0);
  signal n48_o : std_logic;
  signal n50_o : std_logic_vector (7 downto 0);
  signal n52_o : std_logic_vector (4 downto 0);
  signal n54_o : std_logic_vector (3 downto 0);
  signal n55_o : std_logic;
  signal n61_q : std_logic_vector (7 downto 0);
  signal n62_q : std_logic_vector (4 downto 0);
  signal n63_q : std_logic_vector (3 downto 0);
  signal n64_q : std_logic;
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
  signal n77_o : std_logic;
  signal n78_o : std_logic;
  signal n79_o : std_logic;
  signal n80_o : std_logic;
  signal n81_o : std_logic;
  signal n82_o : std_logic;
  signal n83_o : std_logic;
  signal n84_o : std_logic;
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n87_o : std_logic;
  signal n88_o : std_logic;
  signal n89_o : std_logic;
  signal n90_o : std_logic;
  signal n91_o : std_logic;
  signal n92_o : std_logic;
  signal n93_o : std_logic;
  signal n94_o : std_logic;
  signal n95_o : std_logic;
  signal n96_o : std_logic;
  signal n97_o : std_logic;
  signal n98_o : std_logic;
  signal n99_o : std_logic_vector (7 downto 0);
  signal n100_o : std_logic;
  signal n101_o : std_logic;
  signal n102_o : std_logic;
  signal n103_o : std_logic;
  signal n104_o : std_logic;
  signal n105_o : std_logic;
  signal n106_o : std_logic;
  signal n107_o : std_logic;
  signal n108_o : std_logic;
  signal n109_o : std_logic;
  signal n110_o : std_logic;
  signal n111_o : std_logic;
  signal n112_o : std_logic;
  signal n113_o : std_logic;
  signal n114_o : std_logic;
  signal n115_o : std_logic;
  signal n116_o : std_logic;
  signal n117_o : std_logic;
  signal n118_o : std_logic;
  signal n119_o : std_logic;
  signal n120_o : std_logic;
  signal n121_o : std_logic;
  signal n122_o : std_logic;
  signal n123_o : std_logic;
  signal n124_o : std_logic;
  signal n125_o : std_logic;
  signal n126_o : std_logic;
  signal n127_o : std_logic;
  signal n128_o : std_logic;
  signal n129_o : std_logic;
  signal n130_o : std_logic;
  signal n131_o : std_logic;
  signal n132_o : std_logic;
  signal n133_o : std_logic;
  signal n134_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n61_q;
  wrap_DOUT_VLD <= is_valid;
  -- work/uart_rx.vhd:26:12
  cnt_wait <= n62_q; -- (signal)
  -- work/uart_rx.vhd:27:12
  cnt_wait_en <= fsm_cnt_wait_en; -- (signal)
  -- work/uart_rx.vhd:28:12
  cnt_data <= n63_q; -- (signal)
  -- work/uart_rx.vhd:30:12
  rx_en <= fsm_rx_en; -- (signal)
  -- work/uart_rx.vhd:31:12
  is_valid <= fsm_is_valid; -- (signal)
  -- work/uart_rx.vhd:32:12
  first <= n64_q; -- (signal)
  -- work/uart_rx.vhd:37:5
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
  -- work/uart_rx.vhd:52:12
  n8_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- work/uart_rx.vhd:58:17
  n10_o <= cnt_data when is_valid = '0' else "0000";
  -- work/uart_rx.vhd:62:42
  n12_o <= std_logic_vector (unsigned (cnt_wait) + unsigned'("00001"));
  -- work/uart_rx.vhd:61:17
  n14_o <= "00000" when cnt_wait_en = '0' else n12_o;
  -- work/uart_rx.vhd:67:44
  n15_o <= cnt_wait (4);
  -- work/uart_rx.vhd:67:32
  n16_o <= rx_en and n15_o;
  -- work/uart_rx.vhd:68:48
  n17_o <= cnt_wait (3);
  -- work/uart_rx.vhd:68:36
  n18_o <= first and n17_o;
  -- work/uart_rx.vhd:69:29
  n20_o <= cnt_data (2 downto 0);  --  trunc
  -- work/uart_rx.vhd:70:46
  n24_o <= std_logic_vector (unsigned (cnt_data) + unsigned'("0001"));
  -- work/uart_rx.vhd:73:33
  n25_o <= not first;
  -- work/uart_rx.vhd:74:29
  n27_o <= cnt_data (2 downto 0);  --  trunc
  -- work/uart_rx.vhd:75:46
  n31_o <= std_logic_vector (unsigned (cnt_data) + unsigned'("0001"));
  -- work/uart_rx.vhd:73:21
  n32_o <= n61_q when n25_o = '0' else n134_o;
  -- work/uart_rx.vhd:73:21
  n34_o <= n14_o when n25_o = '0' else "00000";
  -- work/uart_rx.vhd:73:21
  n35_o <= n10_o when n25_o = '0' else n31_o;
  -- work/uart_rx.vhd:68:21
  n36_o <= n32_o when n18_o = '0' else n99_o;
  -- work/uart_rx.vhd:68:21
  n38_o <= n34_o when n18_o = '0' else "00000";
  -- work/uart_rx.vhd:68:21
  n39_o <= n35_o when n18_o = '0' else n24_o;
  -- work/uart_rx.vhd:67:17
  n41_o <= first when n48_o = '0' else '0';
  -- work/uart_rx.vhd:80:29
  n42_o <= not rx_en;
  -- work/uart_rx.vhd:80:17
  n44_o <= n10_o when n42_o = '0' else "0000";
  -- work/uart_rx.vhd:67:17
  n45_o <= n61_q when n16_o = '0' else n36_o;
  -- work/uart_rx.vhd:67:17
  n46_o <= n14_o when n16_o = '0' else n38_o;
  -- work/uart_rx.vhd:67:17
  n47_o <= n44_o when n16_o = '0' else n39_o;
  -- work/uart_rx.vhd:67:17
  n48_o <= n16_o and n18_o;
  -- work/uart_rx.vhd:53:13
  n50_o <= n45_o when wrap_RST = '0' else "00000000";
  -- work/uart_rx.vhd:53:13
  n52_o <= n46_o when wrap_RST = '0' else "00000";
  -- work/uart_rx.vhd:53:13
  n54_o <= n47_o when wrap_RST = '0' else "0000";
  -- work/uart_rx.vhd:53:13
  n55_o <= n41_o when wrap_RST = '0' else first;
  -- work/uart_rx.vhd:52:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n61_q <= n50_o;
    end if;
  end process;
  -- work/uart_rx.vhd:52:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n62_q <= n52_o;
    end if;
  end process;
  -- work/uart_rx.vhd:52:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n63_q <= n54_o;
    end if;
  end process;
  -- work/uart_rx.vhd:52:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n64_q <= n55_o;
    end if;
  end process;
  -- work/uart_rx.vhd:69:25
  n65_o <= n20_o (2);
  -- work/uart_rx.vhd:69:25
  n66_o <= not n65_o;
  -- work/uart_rx.vhd:69:25
  n67_o <= n20_o (1);
  -- work/uart_rx.vhd:69:25
  n68_o <= not n67_o;
  -- work/uart_rx.vhd:69:25
  n69_o <= n66_o and n68_o;
  -- work/uart_rx.vhd:69:25
  n70_o <= n66_o and n67_o;
  -- work/uart_rx.vhd:69:25
  n71_o <= n65_o and n68_o;
  -- work/uart_rx.vhd:69:25
  n72_o <= n65_o and n67_o;
  -- work/uart_rx.vhd:69:25
  n73_o <= n20_o (0);
  -- work/uart_rx.vhd:69:25
  n74_o <= not n73_o;
  -- work/uart_rx.vhd:69:25
  n75_o <= n69_o and n74_o;
  -- work/uart_rx.vhd:69:25
  n76_o <= n69_o and n73_o;
  -- work/uart_rx.vhd:69:25
  n77_o <= n70_o and n74_o;
  -- work/uart_rx.vhd:69:25
  n78_o <= n70_o and n73_o;
  -- work/uart_rx.vhd:69:25
  n79_o <= n71_o and n74_o;
  -- work/uart_rx.vhd:69:25
  n80_o <= n71_o and n73_o;
  -- work/uart_rx.vhd:69:25
  n81_o <= n72_o and n74_o;
  -- work/uart_rx.vhd:69:25
  n82_o <= n72_o and n73_o;
  n83_o <= n61_q (0);
  -- work/uart_rx.vhd:69:25
  n84_o <= n83_o when n75_o = '0' else wrap_DIN;
  n85_o <= n61_q (1);
  -- work/uart_rx.vhd:69:25
  n86_o <= n85_o when n76_o = '0' else wrap_DIN;
  n87_o <= n61_q (2);
  -- work/uart_rx.vhd:69:25
  n88_o <= n87_o when n77_o = '0' else wrap_DIN;
  n89_o <= n61_q (3);
  -- work/uart_rx.vhd:69:25
  n90_o <= n89_o when n78_o = '0' else wrap_DIN;
  n91_o <= n61_q (4);
  -- work/uart_rx.vhd:69:25
  n92_o <= n91_o when n79_o = '0' else wrap_DIN;
  n93_o <= n61_q (5);
  -- work/uart_rx.vhd:69:25
  n94_o <= n93_o when n80_o = '0' else wrap_DIN;
  n95_o <= n61_q (6);
  -- work/uart_rx.vhd:69:25
  n96_o <= n95_o when n81_o = '0' else wrap_DIN;
  n97_o <= n61_q (7);
  -- work/uart_rx.vhd:69:25
  n98_o <= n97_o when n82_o = '0' else wrap_DIN;
  n99_o <= n98_o & n96_o & n94_o & n92_o & n90_o & n88_o & n86_o & n84_o;
  -- work/uart_rx.vhd:74:25
  n100_o <= n27_o (2);
  -- work/uart_rx.vhd:74:25
  n101_o <= not n100_o;
  -- work/uart_rx.vhd:74:25
  n102_o <= n27_o (1);
  -- work/uart_rx.vhd:74:25
  n103_o <= not n102_o;
  -- work/uart_rx.vhd:74:25
  n104_o <= n101_o and n103_o;
  -- work/uart_rx.vhd:74:25
  n105_o <= n101_o and n102_o;
  -- work/uart_rx.vhd:74:25
  n106_o <= n100_o and n103_o;
  -- work/uart_rx.vhd:74:25
  n107_o <= n100_o and n102_o;
  -- work/uart_rx.vhd:74:25
  n108_o <= n27_o (0);
  -- work/uart_rx.vhd:74:25
  n109_o <= not n108_o;
  -- work/uart_rx.vhd:74:25
  n110_o <= n104_o and n109_o;
  -- work/uart_rx.vhd:74:25
  n111_o <= n104_o and n108_o;
  -- work/uart_rx.vhd:74:25
  n112_o <= n105_o and n109_o;
  -- work/uart_rx.vhd:74:25
  n113_o <= n105_o and n108_o;
  -- work/uart_rx.vhd:74:25
  n114_o <= n106_o and n109_o;
  -- work/uart_rx.vhd:74:25
  n115_o <= n106_o and n108_o;
  -- work/uart_rx.vhd:74:25
  n116_o <= n107_o and n109_o;
  -- work/uart_rx.vhd:74:25
  n117_o <= n107_o and n108_o;
  n118_o <= n61_q (0);
  -- work/uart_rx.vhd:74:25
  n119_o <= n118_o when n110_o = '0' else wrap_DIN;
  n120_o <= n61_q (1);
  -- work/uart_rx.vhd:74:25
  n121_o <= n120_o when n111_o = '0' else wrap_DIN;
  n122_o <= n61_q (2);
  -- work/uart_rx.vhd:74:25
  n123_o <= n122_o when n112_o = '0' else wrap_DIN;
  n124_o <= n61_q (3);
  -- work/uart_rx.vhd:74:25
  n125_o <= n124_o when n113_o = '0' else wrap_DIN;
  n126_o <= n61_q (4);
  -- work/uart_rx.vhd:74:25
  n127_o <= n126_o when n114_o = '0' else wrap_DIN;
  n128_o <= n61_q (5);
  -- work/uart_rx.vhd:74:25
  n129_o <= n128_o when n115_o = '0' else wrap_DIN;
  n130_o <= n61_q (6);
  -- work/uart_rx.vhd:74:25
  n131_o <= n130_o when n116_o = '0' else wrap_DIN;
  n132_o <= n61_q (7);
  -- work/uart_rx.vhd:74:25
  n133_o <= n132_o when n117_o = '0' else wrap_DIN;
  n134_o <= n133_o & n131_o & n129_o & n127_o & n125_o & n123_o & n121_o & n119_o;
end rtl;
