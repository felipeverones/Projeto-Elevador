LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY SELETOR_ANDAR IS
	port(
		i_CLK					: IN STD_LOGIC;
		i_RST					: IN STD_LOGIC;
		i_ANDAR				: IN STD_LOGIC_VECTOR(5 downto 0);
		o_ANDAR_0			: OUT STD_LOGIC;
		o_ANDAR_1			: OUT STD_LOGIC;
		o_ANDAR_2			: OUT STD_LOGIC;
		o_ANDAR_3			: OUT STD_LOGIC
	);	
END SELETOR_ANDAR;

ARCHITECTURE BEHAVORIAL OF SELETOR_ANDAR IS

	BEGIN
	
	PROCESS(i_CLK, i_RST)
	BEGIN
		IF(i_RST = '0') THEN
			o_ANDAR_0 <= '0';
			o_ANDAR_1 <= '0';
			o_ANDAR_2 <= '0';
			o_ANDAR_3 <= '0';
		ELSIF RISING_EDGE(i_CLK) THEN
			
			if(i_ANDAR(0) = '1') THEN
				o_ANDAR_0 <= '1';
			else
				o_ANDAR_0 <= '0';
			end if;
			
			if((i_ANDAR(1)= '1') OR (i_ANDAR(2)= '1')) THEN
				o_ANDAR_1 <= '1';
			else
				o_ANDAR_1 <= '0';
			end if;
			
			if((i_ANDAR(3)= '1') OR (i_ANDAR(4)= '1')) THEN
				o_ANDAR_2 <= '1';
			else
				o_ANDAR_2 <= '0';
			end if;
			
			if(i_ANDAR(5)= '1') THEN
				o_ANDAR_3 <= '1';
			else
				o_ANDAR_3 <= '0';
			end if;
		end if;
	END PROCESS;
END;


	
	