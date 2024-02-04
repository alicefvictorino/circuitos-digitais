library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port (
        clk, reset : in bit;
        tc : out bit;
        q : out integer range 15 downto 0
    );
end contador;

architecture main of contador is
begin
    process(clk, reset)
        variable qv : integer range 0 to 15;
    begin
        if reset = '1' then
            qv := 0;
            tc <= '0';
        elsif rising_edge(clk) then
            if qv = 15 then
                qv := 0;
                tc <= '1';
            else
                qv := qv + 1;
                tc <= '0';
            end if;
        end if;
        q <= qv;
    end process;
end architecture main;
