library ieee;
use ieee.std_logic_1164.all;

entity calculadora is
    port(
        numeroSwitch1: in BIT_VECTOR(5 DOWNTO 0);
        numeroSwitch2: in BIT_VECTOR(5 DOWNTO 0);
        f, e, clk: in bit;
        resultadoLED: out BIT_VECTOR(5 DOWNTO 0)
    );
end calculadora;

architecture main of calculadora is

    component somador_ou_subtrator is
        port(
            primeiroNumero, segundoNumero: in BIT_VECTOR(5 DOWNTO 0);
            seletorOperacao: in bit;
            resultado: out BIT_VECTOR(5 DOWNTO 0)
        );
    end component;

    signal resultadoSomaSub, resultadoRegistrador: BIT_VECTOR(5 DOWNTO 0);

    component registrador6bits is
        port(
            clk, ld: in bit;
            registradorEntrada: in BIT_VECTOR(5 DOWNTO 0);
            registradorSaida: out BIT_VECTOR(5 DOWNTO 0)
        );
    end component;

begin

    u1: somador_ou_subtrator port map (
        primeiroNumero => numeroSwitch1,
        segundoNumero => numeroSwitch2,
        seletorOperacao => f,
        resultado => resultadoSomaSub
    );

    u2: registrador6bits port map (
        clk => clk,
        ld => e,
        registradorEntrada => resultadoSomaSub,
        registradorSaida => resultadoRegistrador
    );

    resultadoLED <= resultadoRegistrador;

end main;
