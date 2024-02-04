-- Registrador de 6 bits
library ieee;
use ieee.std_logic_1164.all;

entity registrador6bits is
PORT(
clk, ld: in bit;
registradorEntrada: in BIT_VECTOR(5 DOWNTO 0);
registradorSaida: out BIT_VECTOR(5 DOWNTO 0)
);
END registrador6bits;

ARCHITECTURE behav OF registrador6bits IS
BEGIN
PROCESS(clk, ld)
BEGIN
IF(clk'event AND clk = '1' AND ld = '1') THEN
registradorSaida <= registradorEntrada;
END IF;
END PROCESS;
END ARCHITECTURE behav;
