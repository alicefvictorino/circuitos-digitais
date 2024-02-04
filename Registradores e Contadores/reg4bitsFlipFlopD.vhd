library ieee;
use ieee.std_logic_1164.all;

ENTITY reg4bitsFlipFlopD IS
PORT (
I0, I1, I2, I3, clk : IN BIT;
Q0, Q1, Q2, Q3 : OUT BIT);
END reg4bitsFlipFlopD;

ARCHITECTURE main OF reg4bitsFlipFlopD IS
COMPONENT flipflopD is
PORT(D, clk: IN BIT;
Q: OUT BIT
);
END COMPONENT;

BEGIN
u1 : flipflopD PORT MAP(D => I0, clk => clk, Q => Q0);
u2 : flipflopD PORT MAP(D => I1, clk => clk, Q => Q1);
u3 : flipflopD PORT MAP(D => I2, clk => clk, Q => Q2);
u4 : flipflopD PORT MAP(D => I3, clk => clk, Q => Q3);
END ARCHITECTURE main;
