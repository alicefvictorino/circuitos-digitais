-- Bloco de controle da FSM (portas lógicas) --
library ieee;
use ieee.std_logic_1164.all;
entity BlocoDeControleLogica is
port(
z, s, clk: in bit;
t, p: out bit
);
end BlocoDeControleLogica;

architecture behavior of BlocoDeControleLogica is
signal n1, n0: bit; -- Proximo estado
signal s1, s0: bit; -- Estado atual
component RegistradorLogica is
port(
relogio, atual1, atual0: in bit;
proximo1, proximo0: out bit
);
end component;
component LogicaCombinacional is
port(
relogio, z1, s1, current1, current0: in bit;
t1, p1, next1, next0: out bit
);
end component;

begin
u1: RegistradorLogica port map(relogio => clk, atual1 => n1, atual0 => n0, proximo1 => s1, proximo0 => s0);
u2: LogicaCombinacional port map(relogio => clk, z1 => z, s1 => s, current1 => s1, current0 => s0, t1 => t, p1 => p, next1 => n1, next0 => n0);

end architecture behavior;
