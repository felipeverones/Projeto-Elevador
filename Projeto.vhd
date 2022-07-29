library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity PROJETO IS
	port(
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
end PROJETO;

architecture behavioral of PROJETO is
	COMPONENT ELEVADOR IS
		port(
					i_CLK								: IN STD_LOGIC;					
					i_RST								: IN STD_LOGIC;
					i_DESTINO						: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
					i_CONFIRMA_NOVO_DESTINO		: IN STD_LOGIC;
					o_PORTAS							: OUT STD_LOGIC;
					o_MOVIMENTO						: OUT STD_LOGIC;
					o_ANDAR_ATUAL					: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		);
	END COMPONENT;
		
	COMPONENT CONTROLADOR IS
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

	COMPONENT BCD_7SEG IS
		PORT ( 
			i_ENTRADA 	: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_RST 	: IN STD_LOGIC;
			A			: OUT STD_LOGIC;
			B			: OUT STD_LOGIC;
			C			: OUT STD_LOGIC;
			D			: OUT STD_LOGIC;
			E			: OUT STD_LOGIC;
			F			: OUT STD_LOGIC;
			G			: OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL w_CONFIRMA_D, w_CONFIRMA_E, w_MOVIMENTO_D, w_MOVIMENTO_E : STD_LOGIC;
	SIGNAL w_ANDAR_D, w_ANDAR_E, w_DESTINO_D, w_DESTINO_E : STD_LOGIC_VECTOR(1 DOWNTO 0);
begin

	ELEVADOR_ESQUERDO : ELEVADOR
		PORT MAP(
				i_CLK								=> i_CLK,
				i_RST								=> i_RST,
				i_DESTINO						=> w_DESTINO_E,
				i_CONFIRMA_NOVO_DESTINO		=> w_CONFIRMA_E,
				o_PORTAS							=> o_PORTAS_ESQUERDO,
				o_MOVIMENTO						=> w_MOVIMENTO_E,
				o_ANDAR_ATUAL					=> w_ANDAR_E
		);
		
	ELEVADOR_DIREITO : ELEVADOR
		PORT MAP(
				i_CLK								=> i_CLK,
				i_RST								=> i_RST,
				i_DESTINO						=> w_DESTINO_D,
				i_CONFIRMA_NOVO_DESTINO		=> w_CONFIRMA_D,
				o_PORTAS							=> o_PORTAS_DIREITO,
				o_MOVIMENTO						=> w_MOVIMENTO_D,
				o_ANDAR_ATUAL					=> w_ANDAR_D
		);
	
	U_CONTROLADOR : CONTROLADOR
		PORT MAP(
				i_CLK							=> i_CLK,
				i_RST							=> i_RST,
				i_CONFIRMA_Painel_E		=> i_CONFIRMA_PAINEL_ESQUERDO,
				i_CONFIRMA_Painel_D		=> i_CONFIRMA_PAINEL_DIREITO,
				i_MOV_E						=> w_MOVIMENTO_E,
				i_MOV_D						=> w_MOVIMENTO_D,
				i_ANDAR_E					=> w_ANDAR_E,
				i_ANDAR_D					=> w_ANDAR_D,
				i_ANDARES					=> i_ANDARES,
				i_ANDAR_DESTINO			=> i_ANDAR_DESTINO,
				o_dESTINO_E					=> w_DESTINO_E,
				o_dESTINO_D					=> w_DESTINO_D,
				o_CONFIRMA_E				=> w_CONFIRMA_E,
				o_CONFIRMA_D				=> w_CONFIRMA_D
			);
	
	BCD_ESQUERDO : BCD_7SEG
		PORT MAP( 
				i_ENTRADA		=> w_ANDAR_E,
				i_RST 			=> i_RST,
				A					=> o_BCD_E_A,
				B					=> o_BCD_E_B,
				C					=> o_BCD_E_C,
				D					=> o_BCD_E_D,
				E					=> o_BCD_E_E,
				F					=> o_BCD_E_F,
				G					=> o_BCD_E_G
			);
	
	BCD_DIREITO : BCD_7SEG
		PORT MAP( 
				i_ENTRADA		=> w_ANDAR_D,
				i_RST 			=> i_RST,
				A					=> o_BCD_D_A,
				B					=> o_BCD_D_B,
				C					=> o_BCD_D_C,
				D					=> o_BCD_D_D,
				E					=> o_BCD_D_E,
				F					=> o_BCD_D_F,
				G					=> o_BCD_D_G
			);
end behavioral;
