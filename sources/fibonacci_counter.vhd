library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity fibonacci_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        output: out std_logic_vector(3 downto 0));
end fibonacci_counter;

architecture Behavioral of fibonacci_counter is
signal current_fib, next_fib:std_logic_vector(3 downto 0);
signal count: integer:=0;

begin

process(clk)
begin
    if rising_edge(clk)then
        if rst ='1'then 
            current_fib <=(others => '0');
            next_fib <= "0001";
    elsif (count = 7 )then  
        next_fib <= "0001";
        current_fib <="0000";
        count <=0;
    else 
        next_fib <= next_fib + current_fib;
        current_fib <= next_fib;
        count <= count +1;
        end if;
    end if;
end process;
output <= current_fib;        
        
end Behavioral;
