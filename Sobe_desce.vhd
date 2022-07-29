library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity SOBE_DESCE IS
port(
	i_CLK 				: in std_logic;
	i_RST 				: in std_logic;
	i_DESTINO			: in std_logic_vector(1 DOWNTO 0);
	i_ANDAR_ATUAL   	: in std_logic_vector(1 DOWNTO 0);
	o_SOBE				: out std_logic;
	o_DESCE				: out std_logic
	
);
end SOBE_DESCE;

architecture behavioral of SOBE_DESCE is
TYPE w_STATE_TYPE IS (ST_IDLE, ST_SOBE, ST_DESCE);
SIGNAL w_STATE : w_STATE_TYPE;

begin
	process(i_CLK, i_RST)
	begin
		if(i_RST = '0') then
			o_SOBE 		<= '0';
			o_DESCE 		<= '0';
			w_STATE <= st_IDLE;
		elsif RISING_EDGE(i_CLK) then
			CASE w_STATE IS
				WHEN st_IDLE =>
					IF(i_ANDAR_ATUAL < i_DESTINO) THEn
						w_STATE <= st_SOBE;
					ELSIF(i_ANDAR_ATUAL > i_DESTINO) THEn
						w_STATE <= st_DESCE;
					ELSE
						o_SOBE <= '0';
						o_DESCE <= '0';
						w_STATE <= st_IDLE;
					END IF;
				
				WHEN st_SOBE =>
					o_SOBE <= '1';
					o_DESCE <= '0';
					w_STATE <= st_IDLE;
				
				WHEN st_DESCE =>
					o_SOBE <= '0';
					o_DESCE <= '1';
					w_STATE <= st_IDLE;
				
				END CASE;
		end if;
	end process;
end behavioral;
