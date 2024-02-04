library ieee;
use ieee.std_logic_1164.all;

entity somador6bits is
    port (
        vemUm: in bit;
        A, B: in bit_vector (5 downto 0);
        saida : out bit_vector (5 downto 0)
    );
end somador6bits;

architecture main of somador6bits is

    component somadorCompleto is
        port (
            a, b, ci: in bit;
            s, co: out bit
        );
    end component;

    signal co: bit_vector(4 downto 0);

begin

    u1: somadorCompleto port map (a => A(0), b => B(0), ci => vemUm, s => saida(0), co => co(0));
    u2: somadorCompleto port map (a => A(1), b => B(1), ci => co(0), s => saida(1), co => co(1));
    u3: somadorCompleto port map (a => A(2), b => B(2), ci => co(1), s => saida(2), co => co(2));
    u4: somadorCompleto port map (a => A(3), b => B(3), ci => co(2), s => saida(3), co => co(3));
    u5: somadorCompleto port map (a => A(4), b => B(4), ci => co(3), s => saida(4), co => co(4));
    u6: somadorCompleto port map (a => A(5), b => B(5), ci => co(4), s => saida(5), co => open);

end architecture main;
