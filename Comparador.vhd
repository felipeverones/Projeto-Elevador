library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity COMPARADOR IS
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
end COMPARADOR;

architecture behavioral of COMPARADOR is

	COMPONENT COMPARA_DESTINOS IS
		port(
			i_CLK							: IN STD_LOGIC;					
			i_RST							: IN STD_LOGIC;
			i_DESTINO					: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_NOVO_DESTINO				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_ANDAR_ATUAL				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			i_CONFIRMA					: IN STD_LOGIC;
			o_ANDAR						: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			o_WR							: OUT STD_LOGIC
		);
	end COMPONENT;
	
	COMPONENT SOBE_DESCE IS
		port(
			i_CLK 				: in std_logic;
			i_RST 				: in std_logic;
			i_DESTINO			: in std_logic_vector(1 DOWNTO 0);
			i_ANDAR_ATUAL   	: in std_logic_vector(1 DOWNTO 0);
			o_SOBE				: out std_logic;
			o_DESCE				: out std_logic
		);
	end COMPONENT;


begin

	U001: COMPARA_DESTINOS 
		port map(
			i_CLK							=> i_CLK,
			i_RST							=> i_RST,
			i_DESTINO					=> i_DESTINO_ATUAL,
			i_NOVO_DESTINO				=> i_NOVO_DESTINO,
			i_ANDAR_ATUAL				=> i_ANDAR_ATUAL,
			i_CONFIRMA					=> i_CONFIRMA_NOVO_DESTINO,
			o_ANDAR						=> o_NOVO_DESTINO,
			o_WR							=> o_WR_EN
		);
	
	U002: SOBE_DESCE 
		port map(
			i_CLK 				=> i_CLK,
			i_RST 				=> i_RST,
			i_DESTINO			=> i_DESTINO_ATUAL,
			i_ANDAR_ATUAL   	=> i_ANDAR_ATUAL,
			o_SOBE				=> o_SOBE,
			o_DESCE				=> o_DESCE
		);
		
end behavioral;
