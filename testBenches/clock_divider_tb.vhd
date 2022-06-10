library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider_tb is
--  Port ( );
end clock_divider_tb;

architecture Behavioral of clock_divider_tb is
component clock_divider is
 Port ( clk: in std_logic;
         rst: in std_logic;
         output: out std_logic);
end component clock_divider;
signal clk_tb, rst_tb, output_tb: std_logic;
begin
uut: clock_divider port map ( clk=>clk_tb, rst=>rst_tb, output=>output_tb);

process
begin
rst_tb <= '1';
wait for 8 ns;
rst_tb <= '0';
wait;
end process;

process
begin
clk_tb <= '0';
wait for 4 ns;
clk_tb <= '1';
wait for 4 ns;
end process;

end Behavioral;
