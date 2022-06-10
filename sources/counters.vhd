library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counters is
  Port (sysclk: in std_logic;
        sw: in std_logic_vector(3 downto 0);
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
        output: out std_logic_vector(3 downto 0));
end component ring_counter;

component binary_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        output: out std_logic_vector(3 downto 0));
end component binary_counter;

component fibonacci_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        output: out std_logic_vector(3 downto 0));
end component fibonacci_counter;

component johnson_counter is
  Port (clk: in std_logic;
        rst: in std_logic;
        output: out std_logic_vector(3 downto 0));
end component johnson_counter;

signal clk0,clk1,clk2,clk3,clk4: std_logic;
signal rst,rst1,rst2,rst3,rst4: std_logic:='0';
signal led1,led2,led3,led4: std_logic_vector:="0000";
 

begin
uut1: clock_divider port map (clk=>sysclk,rst => rst,output => clk0); 
uut2: ring_counter port map (clk=>clk1,rst=>rst1,output=>led1);
uut3: binary_counter port map (clk=>clk2,rst=>rst2,output=>led2);                          
uut4: fibonacci_counter port map (clk=>clk3,rst=>rst3,output=>led3);                          
uut5: johnson_counter port map (clk=>clk4,rst=>rst4,output=>led4);                          

process(sw)
begin
    case sw is
    when "0000"=>
        clk1<=clk0;
        rst1<=rst;
        led<=led1;
        case sw is
    when "0001"=>
        clk2<=clk0;
        rst2<=rst;
        led<=led2;
    when "0010"=>
        clk3<=clk0;
        rst3<=rst;
        led<=led3;
    when "0100"=>
        clk4<=clk0;
        rst4<=rst;
        led<=led4; 
    when others =>
        led<="0000";
    end case;
end process;                           
end Behavioral;
