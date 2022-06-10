library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity binary_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        output: out std_logic_vector(3 downto 0));
end binary_counter;

architecture Behavioral of binary_counter is
signal count: integer:=0;
signal qtemp: std_logic_vector(3 downto 0):="0000";

begin
process(clk)
begin
    if rising_edge(clk)then 
        if rst='1'then
            qtemp <= "0000";
            count <= 0;
        elsif(count<9)then
            qtemp <= qtemp + 1;
            count <= count +1;
        else 
            qtemp <= "0000";
            count <= 0;
        end if;
    end if;            
end process;
output <= qtemp;
end Behavioral;
