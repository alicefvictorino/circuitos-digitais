-- Bloco de controle da FSM (comportamental) --
library ieee;
use ieee.std_logic_1164.all;

entity ControllerComportamental is
port (
z, s: in std_logic;
clk: in std_logic;
t, p: out std_logic
);
end ControllerComportamental;

architecture behavior of ControllerComportamental is
type statetype is
(Reset_Temp, Espera, Contracao);

signal currentstate, nextstate: statetype;

begin
statereg: process(clk)
begin
if (clk='1' and clk'event) then
currentstate <= nextstate;
end if;
end process;

comblogic: process (currentstate, z, s)
begin
case currentstate is
when Reset_Temp =>
t <= '1';
p <='0';
nextstate <= Espera;
when Espera =>
t <= '0';
p <= '0';
if (s = '1') then
nextstate <= Reset_Temp;
elsif (s = '0' and z = '0') then
nextstate <= Espera;
elsif (s = '0' and z = '1') then
nextstate <= Contracao;
end if;
when Contracao =>
t <= '0';
p <= '1';
nextstate <= Reset_Temp;
end case;
end process;
end behavior;

