library ieee;
use ieee.std_logic_1164.all;

ENTITY mux_4x1 IS
PORT(
a, b, c, d, e, f: IN BIT;
g: OUT BIT);
END mux_4x1;

ARCHITECTURE main OF mux_4x1 IS
SIGNAL saida1_2x1: BIT;
SIGNAL saida2_2x1: BIT;

COMPONENT portas_2x1 is
PORT(
ent1, ent2, seletor: IN BIT;
resultado: OUT BIT);
END COMPONENT;

BEGIN
u1 : portas_2x1 PORT MAP(ent1 => a, ent2 => b, seletor => f, resultado =>
saida1_2x1);

u2 : portas_2x1 PORT MAP(ent1 => c, ent2 => d, seletor => f, resultado => saida2_2x1
);

u3 : portas_2x1 PORT MAP(ent1 => saida1_2x1, ent2 => saida2_2x1, seletor => e,
resultado => g);
END ARCHITECTURE main;
