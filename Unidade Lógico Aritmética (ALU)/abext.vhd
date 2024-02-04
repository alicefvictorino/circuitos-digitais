library ieee;
use ieee.std_logic_1164.all;

entity abext is
    port (
        Aj, Bj, x, y, z: in std_logic;
        Iaj, Ibj: out std_logic
    );
end abext;

architecture main of abext is
begin
    Iaj <= ((NOT x) AND Aj) OR (x AND (NOT y) AND z AND Aj) OR (x AND y AND (NOT z) AND (Aj XOR Bj)) OR
        (x AND (NOT y) AND Bj AND (z XOR Aj)) OR (x AND y AND z AND (NOT Aj));

    Ibj <= (NOT x AND NOT y) AND (z XOR Bj);
end architecture main;
