LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB_SELETOR_ANDAR IS
END TB_SELETOR_ANDAR;



ARCHITECTURE BEHAVORIAL OF TB_SELETOR_ANDAR IS
	COMPONENT SELETOR_ANDAR IS
		PORT(
			i_CLK					: IN STD_LOGIC;
			i_RST					: IN STD_LOGIC;
			i_ANDAR				: IN STD_LOGIC_VECTOR(5 downto 0);
			o_ANDAR_0			: OUT STD_LOGIC;
			o_ANDAR_1			: OUT STD_LOGIC;
			o_ANDAR_2			: OUT STD_LOGIC;
			o_ANDAR_3			: OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL w_CLK, w_RST, w_andar_0, w_andar_1, w_andar_2, w_andar_3	: STD_LOGIC;
	SIGNAL w_ANDAR									 	: STD_LOGIC_VECTOR(5 downto 0);
	
	
--	PROCEDURE CLK_GEN(signal w_CLK : OUT STD_LOGIC; constant FREQ: INTEGER) IS
--		CONSTANT PERIOD : time := 1 sec / FREQ;
--		BEGIN
--			LOOP
--				w_CLK <= '1';
--				wait for PERIOD/2;
--				w_CLK <= '0';
--				wait for PERIOD/2;
--			END LOOP;
--	END PROCEDURE;
	
	BEGIN
	UU0 : SELETOR_ANDAR
		PORT MAP(
			i_CLK					=> w_CLK,
			i_RST					=> w_RST,
			i_ANDAR				=> w_ANDAR,
			o_ANDAR_0			=> w_ANDAR_0,
			o_ANDAR_1		 	=> w_Andar_1,
			o_ANDAR_2			=> w_Andar_2,
			o_ANDAR_3			=>	w_Andar_3
		);
	--CLK_GEN(w_CLK, 50000000);
	
			 --
		 -- GERADOR DE RELóGIO.
		 --
		 PROCESS
		 BEGIN
			w_CLK <= '0';
			WAIT FOR 10 NS;
			w_CLK <= '1';
			WAIT FOR 10 NS;
		 END PROCESS;
		 
		 --
		 -- GERADOR DE SINAL DE RESET.
		 --
		 PROCESS
		 BEGIN
			w_RST <= '0';
			WAIT FOR 100 NS;
			w_RST <= '1';
			WAIT;
		 END PROCESS;
		 
		 --
	
	
	PROCESS
		BEGIN
		w_ANDAR <= "000000";
		wait for 20 ns;
		w_ANDAR <= "000001";
		wait for 20 ns;
		w_ANDAR <= "000010";
		wait for 20 ns;
		w_ANDAR <= "000100";
		wait for 20 ns;
		w_ANDAR <= "001000";
		wait for 20 ns;
		w_ANDAR <= "010000";
		wait for 20 ns;
		w_ANDAR <= "100000";
		wait for 20 ns;
		w_ANDAR <= "000101";
		wait for 20 ns;
		w_ANDAR <= "010101";
		wait for 20 ns;
		w_ANDAR <= "110101";
		wait for 20 ns;
		
	END PROCESS;
	END;