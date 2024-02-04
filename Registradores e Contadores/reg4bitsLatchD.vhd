library ieee;
use ieee.std_logic_1164.all;

ENTITY reg4bitsLatchD IS
PORT (
I0, I1, I2, I3, clk : IN BIT;
Q0, Q1, Q2, Q3 : OUT BIT);
END reg4bitsLatchD;

ARCHITECTURE main OF reg4bitsLatchD IS

COMPONENT latchD is
PORT(D, C: IN BIT;
Q: OUT BIT
);
END COMPONENT;

BEGIN

u1 : latchD PORT MAP(D => I0, C => clk, Q => Q0);
u2 : latchD PORT MAP(D => I1, C => clk, Q => Q1);
u3 : latchD PORT MAP(D => I2, C => clk, Q => Q2);
u4 : latchD PORT MAP(D => I3, C => clk, Q => Q3);

END ARCHITECTURE main;
