library ieee;
use ieee.std_logic_1164.all;

ENTITY mux_2x1_comportamental IS
PORT(i0, i1, s0 : IN BIT;
d : OUT BIT);
END;

ARCHITECTURE behav OF mux_2x1_comportamental IS
BEGIN
WITH s0 SELECT
d <= i0 WHEN '0',
i1 WHEN '1';
END;
