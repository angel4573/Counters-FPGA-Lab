library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counters_tb is
--  Port ( );
end counters_tb;

architecture Behavioral of counters_tb is
component counters is
  Port (sysclk: in std_logic;
        sw: in std_logic_vector(3 downto 0);
        btn: in std_logic;
        led: out std_logic_vector(3 downto 0));
end component counters;

signal clk_tb,btn_tb: std_logic;
signal sw_tb,led_tb: std_logic_vector(3 downto 0):="0000";
constant CLK_P: time:=8ns;
 
begin
uut: counters port map(sysclk=>clk_tb,btn=>btn_tb,sw=>sw_tb,led=>led_tb);

process
begin
clk_tb <='0';
wait for CLK_P/2;--4ns 
clk_tb <='1';
wait for CLK_P/2;
end process;

process
begin
btn_tb <='1';
wait for 8ns;
btn_tb <='0';
wait;
end process;

process
begin
sw_tb<="0000";
wait for 1500 ns;
sw_tb<="0001";
wait for 1500 ns;
sw_tb<="0010";
wait for 1500 ns;
sw_tb<="0100";
wait for 1500 ns;
sw_tb<="1111";
wait for 1500 ns;
sw_tb<="0000";
wait for 1500 ns;
end process;

end Behavioral;
