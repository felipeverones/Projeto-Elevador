LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB_projeto IS
END TB_projeto;



ARCHITECTURE BEHAVORIAL OF TB_projeto IS
	COMPONENT projeto IS
		PORT(
			i_CLK								: IN STD_LOGIC;					
			i_RST								: IN STD_LOGIC;
			i_ANDARES						: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			i_ANDAR_DESTINO				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_CONFIRMA_PAINEL_ESQUERDO : IN STD_LOGIC;
			i_CONFIRMA_PAINEL_DIREITO  : IN STD_LOGIC;
			o_PORTAS_DIREITO				: OUT STD_LOGIC;
			o_PORTAS_ESQUERDO				: OUT STD_LOGIC;
			o_BCD_E_A						: OUT STD_LOGIC;
			o_BCD_E_B						: OUT STD_LOGIC;
			o_BCD_E_C						: OUT STD_LOGIC;
			o_BCD_E_D						: OUT STD_LOGIC;
			o_BCD_E_E						: OUT STD_LOGIC;
			o_BCD_E_F						: OUT STD_LOGIC;
			o_BCD_E_G						: OUT STD_LOGIC;
			o_BCD_D_A						: OUT STD_LOGIC;
			o_BCD_D_B						: OUT STD_LOGIC;
			o_BCD_D_C						: OUT STD_LOGIC;
			o_BCD_D_D						: OUT STD_LOGIC;
			o_BCD_D_E						: OUT STD_LOGIC;
			o_BCD_D_F						: OUT STD_LOGIC;
			o_BCD_D_G						: OUT STD_LOGIC				
		);
	END COMPONENT;
	
	SIGNAL w_CLK, w_RST, w_confirma_painel_esquerdo, w_confirma_painel_direito	: STD_LOGIC;
	SIGNAL w_andares				 							: STD_LOGIC_VECTOR(5 downto 0);
	Signal w_andar_destino									: STD_LOGIC_VECTOR(1 downto 0);
	Signal w_bcd_d_A, w_bcd_d_B, w_bcd_d_C, w_bcd_d_D, w_bcd_d_E, w_bcd_d_F, w_bcd_d_G	:STD_LOGIC;
	Signal w_bcd_e_A, w_bcd_e_B, w_bcd_e_C, w_bcd_e_D, w_bcd_e_E, w_bcd_e_F, w_bcd_e_G	:STD_LOGIC;
	Signal w_portas_direito, w_portas_esquerda	: Std_LOGIC;
	
	
	PROCEDURE CLK_GEN(signal w_CLK : OUT STD_LOGIC; constant FREQ: INTEGER) IS
		CONSTANT PERIOD : time := 1 sec / FREQ;
		BEGIN
			LOOP
				w_CLK <= '1';
				wait for PERIOD/2;
				w_CLK <= '0';
				wait for PERIOD/2;
			END LOOP;
	END PROCEDURE;
	
	BEGIN
	UU0 : projeto
		PORT MAP(
			i_CLK									=> w_cLK,				
			i_RST									=> w_rST,
			i_ANDARES							=> w_andares,
			i_ANDAR_DESTINO					=> w_andar_destino,
			i_CONFIRMA_PAINEL_ESQUERDO 	=> w_confirma_painel_esquerdo,
			i_CONFIRMA_PAINEL_DIREITO  	=> w_confirma_painel_direito,
			o_PORTAS_DIREITO					=> w_portas_direito,
			o_PORTAS_ESQUERDO					=> w_portas_esquerda,
			o_BCD_E_A							=> w_BCD_E_A,
			o_BCD_E_B							=> w_BCD_E_B,
			o_BCD_E_C							=> w_BCD_E_c,
			o_BCD_E_D							=> w_BCD_E_d,
			o_BCD_E_E							=> w_BCD_E_e,
			o_BCD_E_F							=> w_BCD_E_f,
			o_BCD_E_G							=> w_BCD_E_g,
			o_BCD_D_A							=> w_BCD_d_A,
			o_BCD_D_B							=> w_BCD_d_b,
			o_BCD_D_C							=> w_BCD_d_c,
			o_BCD_D_D							=> w_BCD_d_d,
			o_BCD_D_E							=> w_BCD_d_e,
			o_BCD_D_F							=> w_BCD_d_f,
			o_BCD_D_G							=> w_BCD_d_g			
		);
	CLK_GEN(w_CLK, 50000000);
	PROCESS
		BEGIN
		wait for 10 ns;
		
		w_RST <= '0';
		wait for 10 us;
		w_RST <= '1';
		w_confirma_painel_direito <= '1';
		w_confirma_painel_esquerdo <= '1';
		w_andares <= "001010";
		w_andar_destino <= "11";
		wait for 10 us;
		w_andares <= "100000";
		wait for 10 us;
		w_andares <= "110011";
		wait for 10 us;
		w_andares <= "000000";
		wait for 10 us;
		w_confirma_painel_esquerdo <= '0';
		wait for 1 us;
		
	END PROCESS;
	END;
	