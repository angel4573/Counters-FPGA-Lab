library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity johnson_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        stop: in std_logic;
        output: out std_logic_vector(3 downto 0));
end johnson_counter;

architecture Behavioral of johnson_counter is
signal qtemp: std_logic_vector(3 downto 0):="0000";
signal count: integer:=0;

begin
process(clk)
begin
    if rising_edge(clk)then
        if rst = '1'then
            qtemp <= "0000";
        elsif stop ='1'then
            qtemp<=qtemp;               
        else     
            qtemp(0) <= qtemp(1);
            qtemp(1) <= qtemp(2);
            qtemp(2) <= qtemp(3);
            qtemp(3) <= not qtemp(0);
        end if;
    end if;    
end process;
output <= qtemp;
end Behavioral;
