library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_4bits is
port(
s: in bit;
i, j: bit_vector(3 downto 0);
saida: out bit_vector(3 downto 0)
);
end mux_2x1_4bits;

architecture main of mux_2x1_4bits is

component portas_2x1 is
port(
ent1, ent2, seletor: IN BIT;
resultado: OUT BIT
);
end component;

begin
    u1 : portas_2x1 port map(ent1 => i(0), ent2 => j(0), seletor => s, resultado =>
    saida(0) );
    u2 : portas_2x1 port map(ent1 => i(1), ent2 => j(1), seletor => s, resultado =>
    saida(1) );
    u3 : portas_2x1 port map(ent1 => i(2), ent2 => j(2), seletor => s, resultado =>
    saida(2) );
    u4 : portas_2x1 port map(ent1 => i(3), ent2 => j(3), seletor => s, resultado =>
    saida(3) );
    
    end architecture main;
