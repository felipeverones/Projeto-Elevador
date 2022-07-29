library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ELEVADOR IS
	port(
				i_CLK								: IN STD_LOGIC;					
				i_RST								: IN STD_LOGIC;
				i_DESTINO						: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				i_CONFIRMA_NOVO_DESTINO		: IN STD_LOGIC;
				o_PORTAS							: OUT STD_LOGIC;
				o_MOVIMENTO						: OUT STD_LOGIC;
				o_ANDAR_ATUAL					: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
end ELEVADOR;

architecture behavioral of ELEVADOR is
	COMPONENT REGISTRADOR IS
		port(
			i_CLK : in std_logic;
			i_RST : in std_logic;
			i_EN  : in std_logic;
			i_D	: in std_logic_vector(1 downto 0);
			o_Q   : OUT std_logic_vector(1 downto 0)
			
	);
	end COMPONENT;
	
	COMPONENT COMPARADOR IS
	port(
				i_CLK							: IN STD_LOGIC;					
				i_RST							: IN STD_LOGIC;
				i_DESTINO_ATUAL			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				i_NOVO_DESTINO				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				i_ANDAR_ATUAL				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				i_CONFIRMA_NOVO_DESTINO	: IN STD_LOGIC;
				o_SOBE						: OUT STD_LOGIC;
				o_DESCE						: OUT STD_LOGIC;
				o_NOVO_DESTINO				: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
				o_WR_EN						: OUT STD_LOGIC
	);
	end COMPONENT;
	
	COMPONENT TIMER IS
	PORT(
		i_CLK				: IN STD_LOGIC;
		i_RST				: IN STD_LOGIC;
		i_EN				: IN STD_LOGIC;
		i_DATA			: IN STD_LOGIC_VECTOR(27 DOWNTO 0); -- 1011 1110 1011 1100 0010 0000 0000 = 4s
		i_RELOAD			: IN STD_LOGIC;
		o_EST				: OUT STD_LOGIC
	);
	END COMPONENT;
	
	COMPONENT ME_ELEVADOR IS	
		PORT(
			i_ANDAR		   	: IN STD_LOGIC_VECTOR(1 downto 0);
			i_CLK 		   	: IN STD_LOGIC;
			i_RST 		   	: IN STD_LOGIC;
			i_SOBE 		   	: IN STD_LOGIC;
			i_DESCE 		   	: IN STD_LOGIC;
			i_TIMER           : IN STD_LOGIC;
			o_RST_TIMER       : OUT STD_LOGIC;
			o_EN_TIMER 	      : OUT STD_LOGIC;
			o_PORTAS		      : OUT STD_LOGIC;
			o_MOVIMENTO	      : OUT STD_LOGIC;
			o_ANDAR		      : OUT STD_LOGIC_VECTOR(1 downto 0);
			o_WR_ME 		      : OUT STD_LOGIC

		);
	END COMPONENT;
	
	SIGNAL w_SOBE, w_DESCE, w_WR_EN_DESTINO, w_WR_EN_ANDAR, w_EST, w_RST_TIMER, w_EN_TIMER : STD_LOGIC;
	SIGNAL w_DESTINO_ATUAL, w_ANDAR_ATUAL, w_NOVO_DESTINO, w_NOVO_ATUAL: STD_LOGIC_VECTOR(1 DOWNTO 0);
	
begin
	o_ANDAR_ATUAL <= w_ANDAR_ATUAL;
	COMP: COMPARADOR
		PORT MAP(
				i_CLK							    => i_CLK,
				i_RST							    => i_RST,
				i_DESTINO_ATUAL			    => w_DESTINO_ATUAL,
				i_NOVO_DESTINO				    => i_DESTINO,
				i_ANDAR_ATUAL				    => w_ANDAR_ATUAL,
				i_CONFIRMA_NOVO_DESTINO	    => i_CONFIRMA_NOVO_DESTINO,
				o_SOBE						    => w_SOBE,
				o_DESCE						    => w_DESCE,
				o_NOVO_DESTINO				    => w_NOVO_DESTINO,
				o_WR_EN						    => w_WR_EN_DESTINO
	);
	
	MAQ_ESTADOS : ME_ELEVADOR
		PORT MAP(
			i_ANDAR		   	=> w_ANDAR_ATUAL,
			i_CLK 		   	=> i_CLK,
			i_RST 		   	=> i_RST,
			i_SOBE 		   	=> w_SOBE,
			i_DESCE 		   	=> w_DESCE,
			i_TIMER           => w_EST,
			o_RST_TIMER       => w_RST_TIMER,
			o_EN_TIMER 	      => w_EN_TIMER,
			o_PORTAS		      => o_PORTAS,
			o_MOVIMENTO	      => o_MOVIMENTO,
			o_ANDAR		      => w_NOVO_ATUAL,
			o_WR_ME 		      => w_WR_EN_ANDAR

		);
							--"0000000000000000000000110010", 1us    1011 1110 1011 1100 0010 0000 0000 4s
	U003 : TIMER
		PORT MAP(
			i_CLK				=> i_CLK,
			i_RST				=> i_RST, 
			i_EN				=> w_EN_TIMER,
			i_DATA			=> "1011111010111100001000000000",
			i_RELOAD			=> w_RST_TIMER,
			o_EST				=> w_EST
		);
	
	REGISTRADOR_ANDAR_ATUAL : REGISTRADOR
		PORT MAP(
			i_CLK => i_CLK,
			i_RST => i_RST,
			i_EN  => w_WR_EN_ANDAR,
			i_D	=> w_NOVO_ATUAL,
			o_Q   => w_ANDAR_ATUAL
		);
		
	REGISTRADOR_DESTINO : REGISTRADOR
		PORT MAP(
			i_CLK => i_CLK,
			i_RST => i_RST,
			i_EN  => w_WR_EN_DESTINO,
			i_D	=> w_NOVO_DESTINO,
			o_Q   => w_DESTINO_ATUAL
		);
	
end behavioral;
