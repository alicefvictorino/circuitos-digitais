library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port (
        clock : in std_logic;
        rom_enable : in std_logic;
        address : in std_logic_vector(3 downto 0);
        data_output : out std_logic_vector(3 downto 0)
    );
end ROM;

architecture behav of ROM is
    type rom_type is array(0 to 15) of std_logic_vector(3 downto 0);
    
    signal mem: rom_type;
    signal clk_internal : std_logic;
    signal reset_internal : std_logic;
    signal tc_internal : std_logic;
    signal contador_q : std_logic_vector(3 downto 0);

    component contador is
        port (
            clk, reset : in std_logic;
            tc : out std_logic;
            q : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    contadorCrescente: contador port map (
        clk => clk_internal,
        reset => reset_internal,
        tc => tc_internal,
        q => contador_q
    );

    process(clock)
        variable rom_address_v : integer range 0 to 15;
    begin
        if rising_edge(clock) and rom_enable = '1' then
            rom_address_v := to_integer(unsigned(address));
            data_output <= mem(rom_address_v);
        end if;
    end process;

    rom : for i in 0 to 15 generate
        mem(i) <= contador_q;
    end generate;

    clk_internal <= clock;
    reset_internal <= '0';
    tc_internal <= '0';

end behav;
