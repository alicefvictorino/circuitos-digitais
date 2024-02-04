-- Componente somador/subtrator de 6bits
library ieee;
use ieee.std_logic_1164.all;

entity somador_ou_subtrator is
PORT(
primeiroNumero, segundoNumero: in BIT_VECTOR(5 DOWNTO 0);
seletorOperacao: in bit;
resultado: out BIT_VECTOR(5 DOWNTO 0)
);
END somador_ou_subtrator;

ARCHITECTURE main of somador_ou_subtrator is

component mux6bits IS
PORT(
B_original, B_invertido : in BIT_VECTOR(5 DOWNTO 0);
seletor_subtrator: in bit;
saida : out bit_vector (5 downto 0)
);
END COMPONENT ;

signal B_selecionado : BIT_VECTOR(5 DOWNTO 0);

component somador6bits IS
PORT(
vemUm: in bit ;
A, B: in bit_vector (5 downto 0) ;
saida : out bit_vector (5 downto 0)
);
END COMPONENT ;

BEGIN
u0 : mux6bits PORT MAP ( B_original => segundoNumero, B_invertido => not
segundoNumero, seletor_subtrator => seletorOperacao, saida => B_selecionado );
u1 : somador6bits PORT MAP ( vemUm => seletorOperacao, A => primeiroNumero, B =>
B_selecionado, saida => resultado );
END main ;
