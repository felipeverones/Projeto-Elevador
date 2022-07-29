LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY 	TB_SELECIONA_DESTINO IS	
END TB_SELECIONA_DESTINO;


ARCHITECTURE BEHAVORIAL OF TB_SELECIONA_DESTINO IS	
	COMPONENT SELECIONA_DESTINO IS
		PORT(
			i_CLK 					: IN STD_LOGIC;
			i_RST						: IN STD_LOGIC;
			i_DESTINO_E				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_DESTINO_D				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_CONFIRMA_E			: IN STD_LOGIC;
			i_CONFIRMA_D			: IN STD_LOGIC;
			i_CONFIRMA_PAINEL_E 	: IN STD_LOGIC;
			i_CONFIRMA_PAINEL_D 	: IN STD_LOGIC;
			i_ANDAR_VIAGEM			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			o_CONFIRMA_E			: OUT STD_LOGIC;
			o_CONFIRMA_D			: OUT STD_LOGIC;
			o_DESTINO_E				: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			o_DESTINO_D				: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		);
	END COMPONENT;
	
	SIGNAL w_CLK, w_RST, w_CONFIRMA_E, w_CONFIRMA_D, w_CONFIRMA_PAINEL_E, w_CONFIRMA_PAINEL_D : STD_LOGIC;
	SIGNAL w_DESTINO_E, w_DESTINO_D, w_ANDAR_VIAGEM : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL w_o_DESTINO_E, w_o_DESTINO_D : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL w_o_CONFIRMA_E, w_o_CONFIRMA_D : STD_LOGIC;
	
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
	CLK_GEN(w_CLK, 50000000);
	
	U001: SELECIONA_DESTINO 
		PORT MAP(
			i_CLK 					=> w_CLK,
			i_RST						=> w_RST,
			i_DESTINO_E				=> w_DESTINO_E,
			i_DESTINO_D				=> w_DESTINO_D,
			i_CONFIRMA_E			=> w_CONFIRMA_E,
			i_CONFIRMA_D			=> w_CONFIRMA_D,
			i_CONFIRMA_PAINEL_E 	=> w_CONFIRMA_PAINEL_E,
			i_CONFIRMA_PAINEL_D 	=> w_CONFIRMA_PAINEL_D,
			i_ANDAR_VIAGEM			=> w_ANDAR_VIAGEM,
			o_CONFIRMA_E			=> w_o_CONFIRMA_E,
			o_CONFIRMA_D			=> w_o_CONFIRMA_D,
			o_DESTINO_E				=> w_o_DESTINO_E,
			o_DESTINO_D				=> w_o_DESTINO_D
		);
	
	
		PROCESS
		begin
		w_RST <= '0';
		wait for 20 ns;
		w_RST <= '1';
		wait for 20 ns;
		
		w_DESTINO_E 			<= "11";
		w_DESTINO_D 			<= "00";
		w_CONFIRMA_E 			<=	'0';
		w_CONFIRMA_D 			<= '1';
		w_CONFIRMA_PAINEL_E 	<= '1';
		w_CONFIRMA_PAINEL_D 	<=	'1';
		w_ANDAR_VIAGEM 		<= "10";
		
		wait for 100 ns;
		
		w_DESTINO_E 			<= "11";
		w_DESTINO_D 			<= "00";
		w_CONFIRMA_E 			<=	'0';
		w_CONFIRMA_D 			<= '1';
		w_CONFIRMA_PAINEL_E 	<= '1';
		w_CONFIRMA_PAINEL_D 	<=	'0';
		w_ANDAR_VIAGEM 		<= "10";
		
		wait for 100 ns;
		
		w_DESTINO_E 			<= "01";
		w_DESTINO_D 			<= "10";
		w_CONFIRMA_E 			<=	'0';
		w_CONFIRMA_D 			<= '0';
		w_CONFIRMA_PAINEL_E 	<= '1';
		w_CONFIRMA_PAINEL_D 	<=	'1';
		w_ANDAR_VIAGEM 		<= "11";
		
		wait for 100 ns;
		
		w_DESTINO_E 			<= "01";
		w_DESTINO_D 			<= "10";
		w_CONFIRMA_E 			<=	'0';
		w_CONFIRMA_D 			<= '0';
		w_CONFIRMA_PAINEL_E 	<= '0';
		w_CONFIRMA_PAINEL_D 	<=	'1';
		w_ANDAR_VIAGEM 		<= "11";
		
		wait for 100 ns;	
		
		END PROCESS;
	
END;


	
	