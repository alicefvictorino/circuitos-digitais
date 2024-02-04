entity contador_bits_um is
    port(A, B, C : in bit;
    S1, S2 : out bit);
    end contador_bits_um;
    
    architecture behav of contador_bits_um is
    -- Equação do circuito S1
    signal and_1_s1: bit; -- Saída de AB
    signal and_2_s1: bit; -- Saída de BC
    signal and_3_s1: bit; -- Saída de AC
    
    component PortaAnd_2_entradas is
    port(en1,en2 : in bit;
    saida_and : out bit);
    end component;
    
    component PortaOr_3_entradas is
    port(input1, input2, input3 : in bit;
    saida_or : out bit);
    end component;
    
    -- Equação do circuito S2
    signal and_1_s2: bit; -- Saída de A'B'C
    signal and_2_s2: bit; -- Saída de A'BC'
    signal and_3_s2: bit; -- Saída de AB'C'
    signal and_4_s2: bit; -- Saída de ABC
    signal not_A: bit;
    signal not_B: bit;
    signal not_C: bit;
    
    component PortaAnd_3_entradas is
    port(en1,en2,en3 : in bit;
    saida_and : out bit);
    end component;
    
    component PortaOr_4_entradas is
    port(input1, input2, input3, input4 : in bit;
    saida_or : out bit);
    end component;
    
    component PortaNot is
    port(en1 : in bit;
    saida_not : out bit);
    end component;
    
    begin
    -- Portas and da expressão S1 = AB + BC + AC
    u1 : PortaAnd_2_entradas port map(en1 => A, en2 => B, saida_and => and_1_s1);
    u2 : PortaAnd_2_entradas port map(en1 => B, en2 => C, saida_and => and_2_s1);
    u3 : PortaAnd_2_entradas port map(en1 => A, en2 => C, saida_and => and_3_s1);
    u4 : PortaOr_3_entradas port map(input1 => and_1_s1, input2 => and_2_s1, input3 =>
    and_3_s1, saida_or => S1);
    
    -- Portas and da expressão S2 = A'B'C + A'BC' + AB'C' + ABC
    
    u5 : PortaNot port map(en1 => A, saida_not => not_A);
    u6 : PortaNot port map(en1 => B, saida_not => not_B);
    u7 : PortaNot port map(en1 => C, saida_not => not_C);
    
    u8 : PortaAnd_3_entradas port map(en1 => not_A, en2 => not_B, en3 => C, saida_and =>
    and_1_s2);
    u9 : PortaAnd_3_entradas port map(en1 => not_A, en2 => B, en3 => not_C, saida_and =>
    and_2_s2);
    u10 : PortaAnd_3_entradas port map(en1 => A, en2 => not_B, en3 => not_C, saida_and
    => and_3_s2);
    u11 : PortaAnd_3_entradas port map(en1 => A, en2 => B, en3 => C, saida_and =>
    and_4_s2);
    
    u12: PortaOr_4_entradas port map(input1 => and_1_s2, input2 => and_2_s2, input3 =>
    and_3_s2, input4 => and_4_s2, saida_or => S2);
    
    end architecture behav;
    