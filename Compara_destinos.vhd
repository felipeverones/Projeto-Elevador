library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity COMPARA_DESTINOS IS
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
end COMPARA_DESTINOS;

architecture behavioral of COMPARA_DESTINOS is

begin

	process(i_CLK, i_RST)
	begin
		if(i_RST = '0') then
			o_ANDAR <= "00";
			o_WR    <= '0';
		elsif RISING_EDGE(i_CLK) then
			if(i_CONFIRMA = '0') THEn
				o_ANDAR <= i_NOVO_DESTINO;
				o_WR <= '1';
			else
				o_ANDAR <= i_DESTINO;
				o_WR <= '1';
			end if;
		end if;
	end process;
end behavioral;
