ENTITY decodificador_comportamental IS
PORT(
A1, A2, A3, A4, E: IN BIT;
S0, S1, S2, S3, S4, S5, S6: OUT BIT
);
END;

ARCHITECTURE behav OF decodificador_comportamental IS
SIGNAL out_aux: BIT_VECTOR(6 DOWNTO 0);
SIGNAL in_aux: BIT_VECTOR(4 DOWNTO 0);
BEGIN

in_aux <= E & A1 & A2 & A3 & A4;
WITH in_aux SELECT
out_aux <= "1000000" WHEN "10000",
"1111001" WHEN "10001",
"0100100" WHEN "10010",
"0110000" WHEN "10011",
"0011001" WHEN "10100",
"0010010" WHEN "10101",
"0000010" WHEN "10110",
"1111000" WHEN "10111",
"0000000" WHEN "11000",
"0010000" WHEN "11001",
"0000000" WHEN OTHERS;

S0 <= out_aux(0);
S1 <= out_aux(1);
S2 <= out_aux(2);
S3 <= out_aux(3);
S4 <= out_aux(4);
S5 <= out_aux(5);
S6 <= out_aux(6);
END;
