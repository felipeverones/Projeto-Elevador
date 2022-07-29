	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_ARITH.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB_TIMER IS
END TB_TIMER;

ARCHITECTURE BEHAVIORAL OF TB_TIMER IS

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

SIGNAL w_CLK, w_RST, w_EN, w_RELOAD, w_EST : STD_LOGIC;
SIGNAL w_DATA : STD_LOGIC_VECTOR(27 DOWNTO 0);

	PROCEDURE CLK_GEN(signal w_CLK : OUT STD_LOGIC; constant FREQ: INTEGER) IS
		CONSTANT PERIOD : time := 1 sec / FREQ;
		BEGIN
			LOOP
				w_CLK <= '1';
				wait for PERIOD/2;
				w_CLK <= '0';
				wait for PERIOD/2;
			END LOOP;
	END PROCEDURE;

BEGIN
	U001: TIMER
		PORT MAP(
			i_CLK				=> w_CLK,
			i_RST				=> w_RST,
			i_EN				=> w_EN,
			i_DATA			=> w_DATA,
			i_RELOAD			=> w_RELOAD,
			o_EST				=> w_EST			
		
		);

CLK_GEN(w_CLK, 50000000);
w_DATA <= "0000000000001100001101010000"; -- 1ms
--w_DATA <= "xBEBC200"; -- 4s

PROCESS
	BEGIN
		wait for 10 ns;
		w_RST <= '0';
		wait for 100 ns;
		w_RST <= '1';
		wait for 10 ns;
		w_RELOAD <= '1';
		wait for 10 ns;
		w_RELOAD <= '0';
		w_EN <= '1';
		wait for 1 ms;
		wait for 50 ns;
		w_EN <= '0';
		wait for 1 ms;

	END PROCESS;
END;
		