LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB_mede_distancia IS
END TB_mede_distancia;



ARCHITECTURE BEHAVORIAL OF TB_mede_distancia IS
	COMPONENT mede_distancia IS
		PORT(
		i_CLK 				: IN STD_LOGIC;
		i_RST					: IN STD_LOGIC;
		i_ANDAR_E			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		i_ANDAR_D 			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		i_MOV_E				: IN STD_LOGIC;
		i_MOV_D				: IN STD_LOGIC;
		i_ANDAR_0			: IN STD_LOGIC;
		i_ANDAR_1			: IN STD_LOGIC;
		i_ANDAR_2			: IN STD_LOGIC;
		i_ANDAR_3			: IN STD_LOGIC;
		o_DESTINO_E			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		o_DESTINO_D			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);	
	END COMPONENT;
	
	SIGNAL w_CLK, w_RST								: STD_LOGIC;
	SIGnAL w_ANDAR_E, w_ANDAR_D				:Std_LOGIC_VECTOR(1 downto 0);
	Signal w_destino_E, w_destino_d	 	: STD_LOGIC_VECTOR(2 downto 0);
	Signal w_Mov_E, w_MOV_D			: STD_LOGIC;
	Signal w_ANDAR_0, w_Andar_1, w_Andar_2, W_Andar_3	:STD_LOGIC;
	
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
	UU0 : mede_distancia
		PORT MAP(
			i_CLK					=> w_CLK,
			i_RST					=> w_RST,
			i_ANDAR_E			=> w_ANDAR_E,
			i_aNDAR_D			=> w_ANDAR_D,
			i_MOV_E				=> w_Mov_E,
			i_MOV_D				=>	w_MOV_D,
			i_ANDAR_0			=> w_ANDAR_0,
			i_ANDAR_1		 	=> w_Andar_1,
			i_ANDAR_2			=> w_Andar_2,
			i_ANDAR_3			=>	w_Andar_3,
			o_DESTINO_E			=>	w_Destino_E,
			o_DESTINO_D			=>	w_Destino_d
		);
	CLK_GEN(w_CLK, 50000000);
	PROCESS
		BEGIN
		
		w_RST <= '0';
		wait for 200 ns;
		--2
		w_RST <= '1';
		w_mov_E <= '0';
		w_mov_D <= '0';
		w_ANDAR_E <= "00";
		w_ANDAR_D <= "00";
		w_ANDAR_0 <= '0';
		w_Andar_1 <= '0';
		w_Andar_2 <= '0';
		w_Andar_3 <= '0';
		wait for 400 ns;
		--3
		w_Andar_2 <= '1';
		wait for 400 ns;
		--4
		w_mov_E <= '1';
		wait for 400 ns;
		--5
		w_andar_3 <= '1';
		w_andar_1 <= '1';
		wait for 400 ns;
		--6
		wait for 400 ns;
	END PROCESS;
	END;
	