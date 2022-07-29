LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB_Controlador IS
END TB_Controlador;



ARCHITECTURE BEHAVORIAL OF TB_Controlador IS
	COMPONENT Controlador IS
		PORT(
			i_CLK							: IN STD_LOGIC;		
			i_RST							: IN STD_LOGIC;
			i_CONFIRMA_Painel_E		: IN STD_LOGIC;
			i_CONFIRMA_Painel_D		: IN STD_LOGIC;
			i_MOV_E						: IN STD_LOGIC;
			i_MOV_D						: IN STD_LOGIC;
			i_ANDAR_E					: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_ANDAR_D					: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_ANDARES					: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			i_ANDAR_DESTINO			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			o_dESTINO_E					: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			o_dESTINO_D					: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			o_CONFIRMA_E				: OUT STD_LOGIC;
			o_CONFIRMA_D				: OUT STD_LOGIC
	);
	END COMPONENT;
	
	SIGNAL w_CLK, w_RST, w_confirma_painel_E, w_confirma_Painel_D, w_MOV_D, w_MOV_E	: STD_LOGIC;
	SIGNAL w_andar_e, w_andar_d, w_aNDAR_DESTINO, w_destino_d, w_destino_e			 	: STD_LOGIC_VECTOR(1 downto 0);
	Signal w_ANdares		: STD_LOGIC_VECTOR(5 downto 0);
	Signal w_confirma_d, w_confirma_e	:STD_LOGIC;
	
	
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
	UU0 : Controlador
		PORT MAP(
			i_CLK							=> w_cLK,	
			i_RST							=> w_rst,
			i_CONFIRMA_Painel_E		=> w_confirma_painel_E,
			i_CONFIRMA_Painel_D		=> w_confirma_Painel_D,
			i_MOV_E						=> w_mOV_E,
			i_MOV_D						=> w_mOV_D,
			i_ANDAR_E					=> w_Andar_e,
			i_ANDAR_D					=> w_Andar_d,
			i_ANDARES					=> w_aNdares,
			i_ANDAR_DESTINO			=> w_aNDAR_DESTINO,
			o_dESTINO_E					=> w_destino_e,
			o_dESTINO_D					=> w_destino_d,
			o_CONFIRMA_E				=> w_confirma_e,
			o_CONFIRMA_D				=> w_confirma_d
		);
	CLK_GEN(w_CLK, 50000000);
	PROCESS
		BEGIN
		wait for 10 ns;
		
		w_RST <= '0';
		wait for 200 ns;
		w_RST <= '1';
		w_aNdares <= "000100";
		w_andar_e <= "00";
		w_andar_d <= "00";
		w_mOV_D <= '0';
		w_mOV_E <= '0';
		w_aNDAR_DESTINO <= "00";
		W_Confirma_painel_E <= '1';
		W_confirma_Painel_D <= '1';
		wait for 400 ns;
		w_aNdares <= "000000";
		wait for 400 ns;
		w_aNdares <= "100001";
		wait for 400 ns;
		w_aNdares <= "100101";
		wait for 400 ns;
		w_aNdares <= "110101";
		wait for 400 ns;
		w_aNdares <= "011000";
		wait for 400 ns;
		w_mov_D <= '1';
		wait for 400 ns;
		w_mOV_E <= '1';
		w_mOV_D <= '0';
		wait for 400 ns;
		w_confirma_Painel_D <= '0';
		w_aNDAR_DESTINO <= "11";
		wait for 400 ns;
		w_confirma_painel_E <= '0';
		w_confirma_Painel_D <= '1';
		wait for 400 ns;
		
	END PROCESS;
	END;
	