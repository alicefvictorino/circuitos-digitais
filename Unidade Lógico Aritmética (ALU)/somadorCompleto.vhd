library ieee;
use ieee.std_logic_1164.all;

entity somadorCompleto is
    port (
        a, b, ci: in bit;
        s, co: out bit
    );
end somadorCompleto;

architecture main of somadorCompleto is
begin
    s <= a xor b xor ci;
    co <= (b and ci) or (a and ci) or (a and b);
end main;
