library ieee;
use ieee.std_logic_1164.all;

entity cinext is
    port (
        x, y, z: in std_logic;
        cin: out std_logic
    );
end cinext;

architecture main of cinext is
begin
    cin <= (NOT x) AND (y XOR z);
end architecture main;
