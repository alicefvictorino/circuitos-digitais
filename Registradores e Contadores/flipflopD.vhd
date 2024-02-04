LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipflopD IS
PORT(D, clk: IN BIT;
Q: OUT BIT
);
END;

ARCHITECTURE behav OF flipflopD IS
BEGIN
PROCESS(D, clk)
BEGIN
IF (clk'EVENT AND clk = '1' AND D = '0') THEN
Q <= '0';
ELSIF (clk'EVENT AND clk = '1' AND D = '1') THEN
Q <= '1';
END IF;
END PROCESS;
END;
