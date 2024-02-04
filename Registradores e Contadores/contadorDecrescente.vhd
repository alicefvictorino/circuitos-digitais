library ieee;
use ieee.std_logic_1164.all;

ENTITY contadorDecrescente IS
PORT (
clk, reset : IN BIT;
tc : OUT BIT;
q : OUT INTEGER RANGE 15 DOWNTO 0);
END contadorDecrescente;

ARCHITECTURE main OF contadorDecrescente IS
BEGIN
PROCESS(clk, reset)

VARIABLE qv : INTEGER RANGE 15 DOWNTO 0;

BEGIN
IF (reset = '1') THEN
qv := 15;
tc <= '0';
ELSIF (clk'EVENT AND clk = '1') THEN
IF (qv >= 1) THEN
qv := qv - 1;
ELSE
qv := 15;
END IF;
IF (qv = 0) THEN
tc <= '1';
ELSE
tc <= '0';
END IF;
END IF;
q <= qv;
END PROCESS;
END ARCHITECTURE main;
