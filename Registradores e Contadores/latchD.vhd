LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY latchD IS
PORT(
D, C: IN BIT;
Q: OUT BIT
);
END;

ARCHITECTURE behav OF latchD IS
BEGIN
PROCESS(D,C)
BEGIN
IF (C = '1' AND D = '0') THEN
Q <= '0';
ELSIF (C = '1' AND D = '1') THEN
Q <= '1';
END IF;
END PROCESS;
END;
