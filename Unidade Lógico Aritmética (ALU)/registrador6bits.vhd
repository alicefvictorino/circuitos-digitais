library ieee;
use ieee.std_logic_1164.all;

entity registrador6bits is
    port (
        clk, ld: in bit;
        registradorEntrada: in bit_vector(5 downto 0);
        registradorSaida: out bit_vector(5 downto 0)
    );
end registrador6bits;

architecture behav of registrador6bits is
begin
    process(clk, ld)
    begin
        if rising_edge(clk) and ld = '1' then
            registradorSaida <= registradorEntrada;
        end if;
    end process;
end architecture behav;
