library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider is
   Port(clk: in std_logic;
        rst: in std_logic;
        output: out std_logic);
end clock_divider;

architecture Behavioral of clock_divider is
signal clk_tmp: std_logic :='0';
signal count: integer :=0;

begin
process(clk)
begin
if (rising_edge(clk))then 
    if(rst='1')then
        clk_tmp <= '0';
        count <= count + 1;
    --elsif (count = 10)then --used for testbench purposes    
    elsif (count = 62499999)then
        clk_tmp <= not clk_tmp;
        count <= 0;
    else
        count <= count + 1;
    end if;
end if;
end process;

output <= clk_tmp;
end Behavioral;