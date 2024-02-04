-- Multiplexador de 6 bits
library ieee;
use ieee.std_logic_1164.all;

entity mux6bits is
port (
B_original, B_invertido : in BIT_VECTOR(5 DOWNTO 0);
seletor_subtrator: in bit;
saida : out bit_vector (5 downto 0)
);
end mux6bits ;

architecture main of mux6bits is

component portas_2x1 is
port (
ent1 , ent2 , seletor : IN BIT ;
resultado : OUT BIT
);
end component ;

signal resultado_temp: bit_vector(5 downto 0);

begin
u1: portas_2x1 port map ( ent1 => B_original(0), ent2 => B_invertido(0), seletor =>
seletor_subtrator, resultado => saida(0) );
u2: portas_2x1 port map ( ent1 => B_original(1), ent2 => B_invertido(1), seletor =>
seletor_subtrator, resultado => saida(1) );
u3: portas_2x1 port map ( ent1 => B_original(2), ent2 => B_invertido(2), seletor =>
seletor_subtrator, resultado => saida(2) );
u4: portas_2x1 port map ( ent1 => B_original(3), ent2 => B_invertido(3), seletor =>
seletor_subtrator, resultado => saida(3) );
u5: portas_2x1 port map ( ent1 => B_original(4), ent2 => B_invertido(4), seletor =>
seletor_subtrator, resultado => saida(4) );
u6: portas_2x1 port map ( ent1 => B_original(5), ent2 => B_invertido(5), seletor =>
seletor_subtrator, resultado => saida(5) );

end ARCHITECTURE main ;
