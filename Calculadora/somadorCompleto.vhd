-- Somador completo descrito por portas lógicas
library ieee;
use ieee.std_logic_1164.all;

ENTITY somadorCompleto is
PORT (
a , b , ci : in bit ;
s , co : out bit
);
END somadorCompleto ;

ARCHITECTURE main of somadorCompleto is
BEGIN
--equações obtidas da tabela verdade
s <= a xor b xor ci ;
co <= (b and ci) or (a and ci) or (a and b);
END main ;
