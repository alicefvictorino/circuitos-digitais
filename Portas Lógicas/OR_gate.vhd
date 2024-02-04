use ieee.std_logic_1164.all;

entity OR_gate is
port(
    a, b : in bit;
    c : out bit
);
end OR_gate;

architecture main of OR_gate is

begin

c <= a or b;

end architecture main;
