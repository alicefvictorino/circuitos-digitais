library ieee;
use ieee.std_logic_1164.all;

entity reg8bits is
    generic (
        n : integer := 8
    ); -- Number of bits
    port (
        I : in std_logic_vector(n-1 downto 0);
        Q : out std_logic_vector(n-1 downto 0);
        clk : in std_logic
    );
end reg8bits;

architecture main of reg8bits is

    component flipflop is
        port (
            D, clk : in std_logic;
            Q : out std_logic
        );
    end component;

begin

    regFor : for a in 0 to n-1 generate
        reg : flipflop port map (D => I(a), clk => clk, Q => Q(a));
    end generate regFor;

end architecture main;
