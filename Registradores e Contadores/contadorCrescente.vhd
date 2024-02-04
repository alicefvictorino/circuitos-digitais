library ieee;
use ieee.std_logic_1164.all;

ENTITY contadorCrescente IS
PORT (
clk, reset : IN BIT;
tc : OUT BIT;
q : OUT INTEGER RANGE 15 DOWNTO 0);
END contadorCrescente;

ARCHITECTURE main OF contadorCrescente IS
BEGIN
PROCESS(clk, reset)

VARIABLE qv : INTEGER RANGE 15 DOWNTO 0;

BEGIN
IF (reset = '1') THEN
qv := 0;
tc <= '0';
ELSIF (clk'EVENT AND clk = '1') THEN
IF (qv <= 14) THEN
qv := qv + 1;
ELSE
qv := 0;
END IF;
IF (qv = 15) THEN
tc <= '1';
ELSE
tc <= '0';
END IF;
END IF;
q <= qv;
END PROCESS;
END ARCHITECTURE main;
