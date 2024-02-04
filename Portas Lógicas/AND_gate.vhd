library ieee;
use ieee.std_logic_1164.all;

entity AND_gate is
port(
    a, b : in bit;
    c : out bit
);
end AND_gate;

architecture main of AND_gate is

begin

c <= a and b;

end architecture main;
