library ieee;
use ieee.std_logic_1164.all;

entity itemTres is
port(
    e1, e2, e3 : in bit; -- e: entrada
    s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19 : out bit -- s: saida
);
end itemTres;

architecture main of itemTres is

begin

-- IDENTIDADES
-- identidade 01: A + 0 = A
s1 <= e1 or '0';

-- identidade 02: A * 1 = A
s2 <= e1 and '1';

-- identidade 01: (A')'
s3 <= not(not(e1));


-- PROPRIEDADES
-- comutativa:
-- 1. adicao A + B = B + A
s4 <= e1 or e2;
s5 <= e2 or e1;
-- 2. multiplicacao A * B = B * A
s6 <= e1 and e2;
s7 <= e2 and e1;

-- associativa:
-- 3. adicao A + (B
