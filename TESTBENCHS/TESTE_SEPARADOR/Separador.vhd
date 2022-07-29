LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Separador IS
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
END Separador;

ARCHITECTURE BEHAVORIAL OF Separador IS

	BEGIN
	
	PROCESS(i_CLK, i_RST)
	BEGIN
		IF(i_RST = '0') THEN
			o_destino_final_e <= "00";
			o_destino_final_d <= "00";
			o_confirma_E <= '1';
			o_confirma_D <= '1';
		ELSIF RISING_EDGE(i_CLK) THEN
		
			if(i_destino_E(2) = '1') THEN
				o_destino_final_e <= "00";
				o_confirma_E <= '1';
			else
				o_destino_final_e(1) <= i_destino_E(1);
				o_destino_final_e(0) <= i_destino_E(0);
				o_confirma_E <= '0';
			end if;
			
			if(i_destino_d(2) = '1') THEN
				o_destino_final_d <= "00";
				o_confirma_d <= '1';
			else
				o_destino_final_d(1) <= i_destino_D(1);
				o_destino_final_d(0) <= i_destino_D(0);
				o_confirma_D <= '0';
			end if;
		end if;
	END PROCESS;
END;