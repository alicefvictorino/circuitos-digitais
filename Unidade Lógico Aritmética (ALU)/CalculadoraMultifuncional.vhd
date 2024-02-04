library ieee;
use ieee.std_logic_1164.all;

entity CalculadoraMultifuncional is
    port (
        numeroSwitch1, numeroSwitch2: in bit_vector(5 downto 0);
        x, y, z, e, clk: in bit;
        resultadoLED: out bit_vector(5 downto 0)
    );
end CalculadoraMultifuncional;

architecture main of CalculadoraMultifuncional is

    component ALU is
        port (
            x, y, z: in bit;
            A, B: in bit_vector(5 downto 0);
            S: out bit_vector(5 downto 0)
        );
    end component;

    component registrador6bits is
        port (
            clk, ld: in bit;
            registradorEntrada: in bit_vector(5 downto 0);
            registradorSaida: out bit_vector(5 downto 0)
        );
    end component;

    signal resultadoALU, resultadoRegistrador: bit_vector(5 downto 0);

begin
    u1: ALU port map (
        A => numeroSwitch1,
        B => numeroSwitch2,
        x => x,
        y => y,
        z => z,
        S => resultadoALU
    );

    u2: registrador6bits port map (
        clk => clk,
        ld => e,
        registradorEntrada => resultadoALU,
        registradorSaida => resultadoRegistrador
    );

    resultadoLED <= resultadoRegistrador;

end architecture main;
