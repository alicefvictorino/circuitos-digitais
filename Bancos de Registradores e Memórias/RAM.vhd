library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    port (
        clock : in std_logic;
        rw_enable : in std_logic;
        mem_enable : in std_logic;
        address : in std_logic_vector(3 downto 0);
        data_input : in std_logic_vector(3 downto 0);
        data_output : out std_logic_vector(3 downto 0)
    );
end RAM;

architecture behav of RAM is
    type ram_type is array(0 to 15) of std_logic_vector(3 downto 0);
    signal ram: ram_type;
    signal temp_address: std_logic_vector(3 downto 0);
begin
    process(clock)
    begin
        if rising_edge(clock) and mem_enable = '1' then
            if rw_enable = '0' then
                temp_address <= address;
            elsif rw_enable = '1' then
                ram(to_integer(unsigned(address))) <= data_input;
            end if;
            data_output <= ram(to_integer(unsigned(temp_address)));
        end if;
    end process;
end behav;
