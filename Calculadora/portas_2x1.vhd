-- Multiplexador 2x1 (portas lógicas)
library ieee;
use ieee.std_logic_1164.all;

entity portas_2x1 is
port (
ent1 , ent2 , seletor : in bit ;
resultado : out bit
);
end ;

architecture main of portas_2x1 is
begin
resultado <= (seletor and ent2) or (not(seletor) and ent1);
end ;
