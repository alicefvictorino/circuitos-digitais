library ieee;
use ieee.std_logic_1164.all;

entity bancoReg4x8 is
    generic (
        n : natural := 8;  -- Data bit width
        m : natural := 2   -- Address bit width
    );
    port (
        Write_data : in std_logic_vector(n-1 downto 0);
        Write_addr, Read_addr : in std_logic_vector(m-1 downto 0);
        Write_enable, Read_enable, clk : in std_logic;
        Read_data : out std_logic_vector(n-1 downto 0)
    );
end bancoReg4x8;

architecture main of bancoReg4x8 is

    component reg8bits is
        port (
            I : in std_logic_vector(7 downto 0);
            Q : out std_logic_vector(7 downto 0);
            clk : in std_logic
        );
    end component;

    signal reg0In, reg1In, reg2In, reg3In : std_logic_vector(7 downto 0);
    signal reg0Out, reg1Out, reg2Out, reg3Out : std_logic_vector(7 downto 0);
    signal readData : std_logic_vector(7 downto 0);

begin

    reg_inst0: reg8bits port map (I => reg0In, Q => reg0Out, clk => clk);
    reg_inst1: reg8bits port map (I => reg1In, Q => reg1Out, clk => clk);
    reg_inst2: reg8bits port map (I => reg2In, Q => reg2Out, clk => clk);
    reg_inst3: reg8bits port map (I => reg3In, Q => reg3Out, clk => clk);

    process (clk)
    begin
        if rising_edge(clk) then
            if Write_enable = '1' then
                case Write_addr is
                    when "00" =>
                        reg0In <= Write_data;
                    when "01" =>
                        reg1In <= Write_data;
                    when "10" =>
                        reg2In <= Write_data;
                    when "11" =>
                        reg3In <= Write_data;
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;

    -- Mux for reading
    process (clk)
    begin
        if rising_edge(clk) then
            if Read_enable = '1' then
                case Read_addr is
                    when "00" =>
                        readData <= reg0Out;
                    when "01" =>
                        readData <= reg1Out;
                    when "10" =>
                        readData <= reg2Out;
                    when "11" =>
                        readData <= reg3Out;
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;

    -- Output of the bank
    Read_data <= readData;

end architecture main;
