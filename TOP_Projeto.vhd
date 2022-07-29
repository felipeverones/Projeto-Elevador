library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity TOP_PROJETO IS
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
end TOP_PROJETO;

architecture behavioral of TOP_PROJETO is
-------------------------------------------------------------------------------------------

	COMPONENT PROJETO IS
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
	END COMPONENT;
	
--	component PLL_INTEL
--		PORT(
--			areset		: IN STD_LOGIC  := '0';
--			inclk0		: IN STD_LOGIC  := '0';
--			c0				: OUT STD_LOGIC ;
--			locked		: OUT STD_LOGIC 
--			);
--	end component;
	
	
	--SIGNAL W_CLK		: STD_LOGIC;
	--SIGNAL W_RST		: STD_LOGIC;
	--SIGNAL W_LOCKED	: STD_LOGIC;

	
-------------------------------------------------------------------------------------------
begin
			
--	U01: PLL_INTEL 
--	PORT MAP (
--			areset	 => i_RST,	
--			inclk0	 => i_CLK,
--			c0	 		 => W_CLK,
--			locked	 => W_LOCKED
--	);
			
	--W_RST <= NOT W_LOCKED;
			
	
	U02: PROJETO 
	PORT MAP(
			i_CLK								=>	i_CLK,					
			i_RST								=> i_RST,
			i_ANDARES						=> i_ANDARES,
			i_ANDAR_DESTINO				=> i_ANDAR_DESTINO,
			i_CONFIRMA_PAINEL_ESQUERDO => i_CONFIRMA_PAINEL_ESQUERDO,
			i_CONFIRMA_PAINEL_DIREITO  => i_CONFIRMA_PAINEL_DIREITO,
			o_PORTAS_DIREITO				=> o_PORTAS_DIREITO,
			o_PORTAS_ESQUERDO				=> o_PORTAS_ESQUERDO,
			o_BCD_E_A						=> o_BCD_E_A,
			o_BCD_E_B						=> o_BCD_E_B,
			o_BCD_E_C						=> o_BCD_E_C,
			o_BCD_E_D						=> o_BCD_E_D,
			o_BCD_E_E						=> o_BCD_E_E,
			o_BCD_E_F						=> o_BCD_E_F,
			o_BCD_E_G						=> o_BCD_E_G,
			o_BCD_D_A						=> o_BCD_D_A,
			o_BCD_D_B						=> o_BCD_D_B,
			o_BCD_D_C						=> o_BCD_D_C,
			o_BCD_D_D						=> o_BCD_D_D,
			o_BCD_D_E						=> o_BCD_D_E,
			o_BCD_D_F						=> o_BCD_D_F,
			o_BCD_D_G						=> o_BCD_D_G
		);
			
			
end behavioral;
