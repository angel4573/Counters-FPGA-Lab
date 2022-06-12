library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fibonacci_counter_tb is
--  Port ( );
end fibonacci_counter_tb;

architecture Behavioral of fibonacci_counter_tb is
component fibonacci_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        stop: in std_logic;
        output: out std_logic_vector(3 downto 0));
end component fibonacci_counter;

signal clk_tb,rst_tb,stop_tb: std_logic;
signal output_tb:std_logic_vector(3 downto 0):="0000";
constant CLK_P: time:=8ns;

begin
uut:fibonacci_counter port map (clk=>clk_tb,
               rst=>rst_tb,
               stop=>stop_tb,
               output=>output_tb);
process
begin
clk_tb <='0';
wait for CLK_P/2;--4ns 
clk_tb <='1';
wait for CLK_P/2;
end process;

process
begin
rst_tb<='1';
wait for 8ns;
rst_tb<='0';
wait;
end process;

process
begin
stop_tb<='0';
wait for 64ns;
stop_tb<='1';
wait for 16ns;
stop_tb<='0';
wait for 16ns;
stop_tb<='1';
wait for 32ns;
end process;

end Behavioral;
