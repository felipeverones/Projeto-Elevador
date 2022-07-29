LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB_Separador IS
END TB_Separador;



ARCHITECTURE BEHAVORIAL OF TB_SEparador IS
	COMPONENT SEPARADOR IS
		PORT(
			i_CLK					: IN STD_LOGIC;
			i_RST					: IN STD_LOGIC;
			i_Destino_E			: IN STD_LOGIC_VECTOR(2 downto 0);
			i_destino_D			: IN STD_LOGIC_VECTOR(2 downto 0);
			o_destino_final_e	: OUT STD_LOGIC_VECTOR(1 downto 0);
			o_destino_final_d	: OUT STD_LOGIC_VECTOR(1 downto 0);
			o_Confirma_E		: OUT STD_LOGIC;
			o_Confirma_D		: OUT STD_LOGIC
	);	
	END COMPONENT;
	
	SIGNAL w_CLK, w_RST, w_confirma_e, w_confirma_d	: STD_LOGIC;
	SIGNAL w_destino_e, w_destino_d					 	: STD_LOGIC_VECTOR(2 downto 0);
	Signal w_destino_final_e, w_destino_final_d		: STD_LOGIC_VECTOR(1 downto 0);
	
	
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
	UU0 : SepARADOR
		PORT MAP(
			i_CLK					=> w_CLK,
			i_RST					=> w_RST,
			i_destino_D			=> w_Destino_d,
			i_destino_E			=> w_destino_e,
			o_destino_final_d	=> w_destino_final_d,
			o_destino_final_e	=> w_destino_final_e,
			o_Confirma_D		=> w_Confirma_d,
			o_Confirma_E		=>	w_Confirma_e
		);
	CLK_GEN(w_CLK, 50000000);
	PROCESS
		BEGIN
		
		w_RST <= '0';
		wait for 200 ns;
		w_RST <= '1';
		w_destino_d <= "011";
		w_destino_e <= "000";
		wait for 200 ns;
		w_destino_d <= "001";
		w_destino_e <= "001";
		wait for 200 ns;
		w_destino_d <= "010";
		w_destino_e <= "010";
		wait for 200 ns;
		w_destino_d <= "011";
		w_destino_e <= "011";
		wait for 200 ns;
		w_destino_d <= "100";
		w_destino_e <= "100";
		wait for 200 ns;
		w_destino_d <= "101";
		w_destino_e <= "101";
		wait for 200 ns;
		w_destino_d <= "110";
		w_destino_e <= "110";
		wait for 200 ns;
		w_destino_d <= "111";
		w_destino_e <= "111";
		
	END PROCESS;
	END;
	