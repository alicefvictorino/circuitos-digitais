library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
    port (
        D, clk: in bit;
        Q: out bit
    );
end flipflop;

architecture behav of flipflop is
begin
    process(D, clk)
    begin
        if rising_edge(clk) then
            Q <= D;
        end if;
    end process;
end architecture behav;
