library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memorias is
    port (
        clock : in std_logic;
        reset : in std_logic;
        mem_enable : in std_logic;
        rw_enable : in std_logic;
        address : in std_logic_vector(3 downto 0);
        data_output_ram : out std_logic_vector(3 downto 0)
    );
end memorias;

architecture main of memorias is
    signal rom_output : std_logic_vector(3 downto 0);
    signal ram_input : std_logic_vector(3 downto 0);

    component ROM is
        port (
            clock : in std_logic;
            rom_enable : in std_logic;
            address : in std_logic_vector(3 downto 0);
            data_output : out std_logic_vector(3 downto 0)
        );
    end component;

    component RAM is
        port (
            clock : in std_logic;
            rw_enable : in std_logic;
            mem_enable : in std_logic;
            address : in std_logic_vector(3 downto 0);
            data_input : in std_logic_vector(3 downto 0);
            data_output : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    rom_comp: ROM port map (
        clock => clock,
        rom_enable => mem_enable,
        address => address,
        data_output => rom_output
    );

    ram_comp: RAM port map (
        clock => clock,
        rw_enable => rw_enable,
        mem_enable => mem_enable,
        address => address,
        data_input => ram_input,
        data_output => data_output_ram
    );

    process(clock)
    begin
        if rising_edge(clock) then
            if mem_enable = '1' and rw_enable = '1' then
                for i in 0 to 3 loop
                    ram_input(i) <= not rom_output(i);
                end loop;
            end if;
        end if;
    end process;

end main;
