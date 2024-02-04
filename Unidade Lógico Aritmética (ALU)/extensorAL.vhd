library ieee;
use ieee.std_logic_1164.all;

entity extensorAL is
    port (
        x, y, z: in bit;
        A, B: in bit_vector (5 downto 0);
        IA, IB: out bit_vector (5 downto 0);
        cin: out std_logic
    );
end extensorAL;

architecture main of extensorAL is

    component abext is
        port (
            Aj, Bj, x, y, z: in bit;
            Iaj, Ibj: out bit
        );
    end component;

    component cinext is
        port (
            x, y, z: in bit;
            cin: out std_logic
        );
    end component;

begin
    AB1 : abext port map (Aj => A(0), Bj => B(0), x => x, y => y, z => z, Iaj => IA(0), Ibj => IB(0));
    AB2 : abext port map (Aj => A(1), Bj => B(1), x => x, y => y, z => z, Iaj => IA(1), Ibj => IB(1));
    AB3 : abext port map (Aj => A(2), Bj => B(2), x => x, y => y, z => z, Iaj => IA(2), Ibj => IB(2));
    AB4 : abext port map (Aj => A(3), Bj => B(3), x => x, y => y, z => z, Iaj => IA(3), Ibj => IB(3));
    AB5 : abext port map (Aj => A(4), Bj => B(4), x => x, y => y, z => z, Iaj => IA(4), Ibj => IB(4));
    AB6 : abext port map (Aj => A(5), Bj => B(5), x => x, y => y, z => z, Iaj => IA(5), Ibj => IB(5));

    cin1 : cinext port map (x => x, y => y, z => z, cin => cin);
end architecture main;
