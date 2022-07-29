LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CONTROLADOR IS

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

END CONTROLADOR;

ARCHITECTURE BEHAVIORAL OF CONTROLADOR IS
	SIGNAL w_ANDAR_0, w_ANDAR_1, w_ANDAR_2, w_ANDAR_3 : STD_LOGIC;
	SIGNAL w_dESTINO_E, w_dESTINO_D: STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL w_DESTINO_DIR, w_DESTINO_ESQ : STD_LOGIC_VECTOR(1 DOWNTO 0);
	Signal w_Confirma_E, w_confirma_D	: STD_LOGIC;
	COMPONENT MEDE_DISTANCIA IS
		port(
			i_CLK 				: IN STD_LOGIC;
			i_RST					: IN STD_LOGIC;
			i_andar_E			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_andar_D 			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_MOV_E				: IN STD_LOGIC;
			i_MOV_D				: IN STD_LOGIC;
			i_ANDAR_0			: IN STD_LOGIC;
			i_ANDAR_1			: IN STD_LOGIC;
			i_ANDAR_2			: IN STD_LOGIC;
			i_ANDAR_3			: IN STD_LOGIC;
			o_DESTINO_E			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			o_DESTINO_D			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);	
	END COMPONENT;
	
	COMPONENT SELECIONA_DESTINO IS
		port(
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

	COMPONENT SELETOR_ANDAR IS
		port(
			i_CLK					: IN STD_LOGIC;
			i_RST					: IN STD_LOGIC;
			i_ANDAR			: IN STD_LOGIC_VECTOR(5 downto 0);
			o_ANDAR_0			: OUT STD_LOGIC;
			o_ANDAR_1			: OUT STD_LOGIC;
			o_ANDAR_2			: OUT STD_LOGIC;
			o_ANDAR_3			: OUT STD_LOGIC
		);	
	END COMPONENT;
	
	COMPONENT Separador is
		port(
			i_CLK					: IN STD_LOGIC;
			i_RST					: IN STD_LOGIC;
			i_Destino_E			: IN STD_LOGIC_VECTOR(2 downto 0);
			i_destino_D			: IN STD_LOGIC_VECTOR(2 downto 0);
			o_destino_final_e	: OUT STD_LOGIC_VECTOR(1 downto 0);
			o_destino_final_d	: OUT STD_LOGIC_VECTOR(1 downto 0);
			o_Confirma_E		: OUT STD_LOGIC;
			o_Confirma_D		: OUT STD_LOGIC
		);	
	end comPONENT;
	
	BEGIN
	
		U001: SELETOR_ANDAR
			PORT MAP(
				i_CLK					=> i_CLK,
				i_RST					=> i_RST,
				i_ANDAR				=> i_ANDARES,
				o_ANDAR_0			=> w_ANDAR_0,
				o_ANDAR_1			=> w_ANDAR_1,
				o_ANDAR_2			=> w_ANDAR_2,
				o_ANDAR_3			=> w_ANDAR_3
			);
			
		U002: SELECIONA_DESTINO
			PORT MAP(
			i_CLK		 				=> i_clk,
			i_RST						=> i_rST,
			i_DESTINO_E				=> w_dESTINO_EsQ,
			i_DESTINO_D				=> w_destino_DiR,
			i_CONFIRMA_E			=> w_CONFIRMA_E,
			i_CONFIRMA_D			=> w_CONFIRMA_D,
			i_CONFIRMA_PAINEL_E 	=> i_cONFIRMA_PAINEL_E,
			i_CONFIRMA_PAINEL_D 	=> i_CONFIRMA_PAINEL_D,
			i_ANDAR_VIAGEM			=> i_aNDAR_DESTINO,
			o_CONFIRMA_E			=> o_confirma_E,
			o_CONFIRMA_D			=> o_Confirma_D,
			o_DESTINO_E				=> o_dESTINO_E,
			o_DESTINO_D				=> o_dESTINo_D
			);
			
		U003: MEDE_DISTANCIA
			PORT MAP(
				i_CLK 				=> i_CLK,
				i_RST					=> i_RST,
				i_ANDAR_E			=> i_ANDAR_E,
				i_ANDAR_D 			=> i_ANDAR_D,
				i_MOV_E				=> i_MOV_E,
				i_MOV_D				=> i_MOV_D,
				i_ANDAR_0			=> w_ANDAR_0,
				i_ANDAR_1			=> w_ANDAR_1,
				i_ANDAR_2			=> w_ANDAR_2,
				i_ANDAR_3			=> w_ANDAR_3,
				o_DESTINO_E			=> w_DESTINO_E,
				o_DESTINO_D			=> w_DESTINO_D
			);
			
		U004: Separador
			Port Map(
				i_CLK					=> I_cLK,
				i_RST					=> I_rst,
				i_Destino_E			=> w_dESTINO_E,
				i_destino_D			=> w_dESTINO_D,
				o_destino_final_e	=> w_dESTINO_ESQ,
				o_destino_final_d	=> w_dESTINO_DIR,
				o_Confirma_E		=> w_Confirma_E,
				o_Confirma_D		=> w_confirma_D
		);	
		
END BEHAVIORAL;