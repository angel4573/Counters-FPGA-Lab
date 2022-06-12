library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity counters is
  Port (sysclk: in std_logic;
        sw: in std_logic_vector(3 downto 0);
        btn: in std_logic;
        led: out std_logic_vector(3 downto 0));
end counters;

architecture Behavioral of counters is

component clock_divider is
   Port(clk: in std_logic;
        rst: in std_logic;
        output: out std_logic);
end component clock_divider;

component ring_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        stop: in std_logic;
        output: out std_logic_vector(3 downto 0));
end component ring_counter;

component binary_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        stop: in std_logic;
        output: out std_logic_vector(3 downto 0));
end component binary_counter;

component fibonacci_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        stop: in std_logic;
        output: out std_logic_vector(3 downto 0));
end component fibonacci_counter;

component johnson_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        stop: in std_logic;
        output: out std_logic_vector(3 downto 0));
end component johnson_counter;

signal clk0: std_logic;
signal rst: std_logic:='0';
signal stop1,stop2,stop3,stop4: std_logic:='1';
signal led1,led2,led3,led4: std_logic_vector(3 downto 0):="0000";
signal count: integer:=0;

begin
uut1: clock_divider port map (clk=>sysclk,rst => btn,output => clk0); 
uut2: ring_counter port map (clk=>clk0,rst=>rst,stop=>stop1,output=>led1);
uut3: binary_counter port map (clk=>clk0,rst=>rst,stop=>stop2,output=>led2);                          
uut4: fibonacci_counter port map (clk=>clk0,rst=>rst,stop=>stop3,output=>led3);                          
uut5: johnson_counter port map (clk=>clk0,rst=>rst,stop=>stop4,output=>led4);                          

process(sw,clk0,rst,count)
begin
    if rising_edge(clk0)then
            if count > 1 then
            rst <='0';
        else
            count <= count+1;
            rst <='1';
        end if;         
    end if;
    if rising_edge(sw(0))then
        count <=0;
    elsif rising_edge(sw(1))then
        count<=0;
    elsif rising_edge(sw(2))then
        count<=0;
    elsif rising_edge(sw(3))then
        count<=0;
    end if;
end process;

process(sw)
begin        
    case sw is
    when "0000"=>
            led<=led1;
            stop1<='0';
            stop2<='1';
            stop3<='1';
            stop4<='1';    
    when "0001"=>
            led<=led2;
            stop1<='1';
            stop2<='0';
            stop3<='1';
            stop4<='1';
    when "0010"=>
            led<=led3;
            stop1<='1';
            stop2<='1';
            stop3<='0';
            stop4<='1';    
    when "0100"=>
            led<=led4;
            stop1<='1';
            stop2<='1';
            stop3<='1';
            stop4<='0';       
    when others =>
            led<="0000";
            stop1<='1';
            stop2<='1';
            stop3<='1';
            stop4<='1';
    end case;

end process;                           

end Behavioral;
