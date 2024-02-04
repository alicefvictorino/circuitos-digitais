library ieee;
use ieee.std_logic_1164.all;

ENTITY mux_2x1_portas_logicas IS
PORT(
ent1, ent2, s: IN BIT;
r: OUT BIT);
END;

ARCHITECTURE main OF mux_2x1_portas_logicas IS
BEGIN
r <= (s and ent2) or (not(s) and ent1);
END;
