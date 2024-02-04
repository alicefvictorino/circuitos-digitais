library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    port (
        x, y, z: in bit;
        A, B: in bit_vector (5 downto 0);
        S: out bit_vector (5 downto 0)
    );
end ALU;

architecture main of ALU is

    component extensorAL is
        port (
            x, y, z: in bit;
            A, B: in bit_vector (5 downto 0);
            IA, IB: out bit_vector (5 downto 0);
            cin : out bit
        );
    end component;

    component somador6bits is
        port (
            vemUm: in bit;
            A, B: in bit_vector (5 downto 0);
            saida : out bit_vector (5 downto 0)
        );
    end component;

    signal auxCIN: bit;
    signal auxA, auxB: bit_vector(5 downto 0);

begin

    extensorALU : extensorAL port map (A => A, B => B, x => x, y => y, z => z, IA => auxA, IB => auxB, cin => auxCIN);

    somador : somador6bits port map (A => auxA, B => auxB, saida => S, vemUm => auxCIN);

end architecture main;
