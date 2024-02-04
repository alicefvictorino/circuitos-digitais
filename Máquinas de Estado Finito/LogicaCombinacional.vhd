-- Lógica combinacional da FSM --
library ieee;
use ieee.std_logic_1164.all;

entity RegistradorLogica is
port(
relogio, atual1, atual0: in bit;
proximo1, proximo0: out bit
);
end RegistradorLogica;

architecture behav of RegistradorLogica is
begin
process(relogio)
begin
if (relogio'event AND relogio = '1') then
proximo1 <= atual1;
proximo0 <= atual0;
end if;
end process;
end architecture behav;
