LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY MEDE_DISTANCIA IS
	port(
		i_CLK 				: IN STD_LOGIC;
		i_RST					: IN STD_LOGIC;
		i_andar_E			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		i_andar_D 			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		i_MOV_E				: IN STD_LOGIC;
		i_MOV_D				: IN STD_LOGIC;
		i_ANDAR_0			: IN STD_LOGIC;
		i_ANDAR_1			: IN STD_LOGIC;
		i_ANDAR_2			: IN STD_LOGIC;
		i_ANDAR_3			: IN STD_LOGIC;
		o_DESTINO_E			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		o_DESTINO_D			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);	
END MEDE_DISTANCIA;


ARCHITECTURE BEHAVORIAL OF MEDE_DISTANCIA IS	
TYPE w_STATE_TYPE IS (st_IDLE, st_UM_CHAMADO, st_DOIS_CHAMADOS, st_TRES_CHAMADOS, st_QUATRO_CHAMADOS,st_ENVIA);
SIGNAL w_STATE : w_STATE_TYPE;
SIGNAL w_DIST_E_0, w_DIST_E_1, w_DIST_E_2, w_DIST_E_3, w_DIST_D_0, w_DIST_D_1, w_DIST_D_2, w_DIST_D_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL w_REQ_1, w_REQ_2, w_REQ_3, w_REQ_4	 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL w_DESTINO_E, w_DESTINO_D : STD_LOGIC_VECTOR(2 DOWNTO 0);
SigNAL w_andar_E, w_Andar_D	: STD_LOGIC_VECTOR(2 downto 0);
BEGIN
	
	PROCESS(i_clk, i_RST)
	VARIABLE v_N_CHAMADOS : INTEGER;
	BEGIN
		w_andar_E(2) <= '0';
		w_andar_E(1) <= i_andar_E(1);
		w_andar_E(0) <= i_andar_E(0);
		w_andar_D(2) <= '0';
		w_andar_D(1) <= i_andar_D(1);
		w_andar_D(0) <= i_andar_D(0);
		if(i_RST = '0') THEN
			w_DESTINO_D <= "100";
			w_DESTINO_E <= "100";
			o_DESTINO_D <= "100";
			o_DESTINO_E <= "100";
			w_STATE <= st_IDLE;
			v_N_CHAMADOS := 0;
		elsif rising_edge(i_clk) then
			CASE w_STATE is
				when st_IDLE =>
					v_N_CHAMADOS := 0;
					if(i_ANDAR_0 = '1') THEN
						v_N_CHAMADOS := v_N_CHAMADOS + 1;
					end if;
					if(i_ANDAR_1 = '1') THEN
						v_N_CHAMADOS := v_N_CHAMADOS + 1;
					end if;
					if(i_ANDAR_2 = '1') THEN
						v_N_CHAMADOS := v_N_CHAMADOS + 1;
					end if;
					if(i_ANDAR_3 = '1') THEN
						v_N_CHAMADOS := v_N_CHAMADOS + 1;
					end if;
					
					if(v_N_CHAMADOS = 0) THEN
						o_DESTINO_D <= "100";
						o_DESTINO_E <= "100";
						w_STATE <= st_IDLE;
					elsif(v_N_CHAMADOS = 1) THEN
						w_STATE <= st_UM_CHAMADO;
					elsif(v_N_CHAMADOS = 2) THEN
						w_STATE <= st_DOIS_CHAMADOS;
					elsif(v_N_CHAMADOS = 3) THEN
						w_STATE <= st_TRES_CHAMADOS;
					elsif(v_N_CHAMADOS = 4) THEN
						w_STATE <= st_QUATRO_CHAMADOS;
					end if;
				-- UM CHAMADO --
				when st_UM_CHAMADO =>
				-- DESCOBRE QUEM FEZ O CHAMADO --
					IF(i_ANDAR_0 = '1') THEN
						w_REQ_1 <= "000"; 
					ELSIF (i_ANDAR_1 = '1') THEN
						w_REQ_1 <= "001"; 
					ELSIF (i_ANDAR_2 = '1') THEN
						w_REQ_1 <= "010";
					ELSIF (i_ANDAR_3 = '1') THEN
						w_REQ_1 <= "011";
					END IF;
				-- VERIFICA QUEM ESTA SE MOVEND0 --
		---- SE UM DELES ESTA PARADO, MANDA QUEM ESTA PARADO -----------
					IF(i_MOV_E = '1' and i_MOV_D = '0') THEN
						If (w_dESTINO_E = w_req_1) then
							w_dESTINO_D <= "100";
						else
							w_DESTINO_D <= w_REQ_1;
						end if;
					ELSIF(i_MOV_D = '1' and i_MOV_E = '0') THEN
						If (w_dESTINO_D <= w_req_1) then
							w_dESTINO_E <= "100";
						elsE
							w_DESTINO_E <= w_REQ_1;
						end if;
		----- OS DOIS ESTAO SE MOVENDO NAO MANDA NENHUM ----------
					ELSIF(i_MOV_D = '1' and i_MOV_E = '1') THEN
					ELSE
		----- SE OS DOIS ESTAO PARADOS MANDA O MAIS PROXIMO -----
						IF(w_andar_E < w_REQ_1)	THEN
							w_DIST_E_0 <= w_REQ_1 - w_andar_E;
						ELSE
							w_DIST_E_0 <= w_andar_E - w_REQ_1;
						END IF;
						
						IF(w_andar_D < w_REQ_1) THEN
							w_DIST_D_0 <= w_REQ_1 - w_andar_D;
						ELSE
							w_DIST_D_0 <= w_andar_D - w_REQ_1;
						END IF;
					
						IF(w_DIST_D_0 < w_DIST_E_0) THEN
							w_DESTINO_E 	<= "100";
							w_DESTINO_D    <= w_REQ_1;
				----- SE FOREM IGUAIS MANDA O ESQUERDO --------
						ELSE
							w_DESTINO_D 	<= "100";
							w_DESTINO_E    <= w_REQ_1;
						END IF;
					END IF;
					w_sTATE <= st_eNVIA;
					
				-- DOIS CHAMADOS --	
				when st_DOIS_CHAMADOS =>
				-- DESCOBRE QUEM FEZ UM DOS CHAMADOS --
					IF(i_ANDAR_0 = '1') THEN
						w_REQ_1 <= "000";
					End if;
					IF (i_ANDAR_1 = '1') THEN
						w_REQ_1 <= "001";
					end if;
					IF (i_ANDAR_2 = '1') THEN
						w_REQ_1 <= "010";
					end if;
					IF (i_ANDAR_3 = '1') THEN
						w_REQ_1 <= "011";
					END IF;
				-- DESCOBRE QUEM FEZ O OUTRO CHAMADO --
					IF(i_ANDAR_3 = '1') THEN
						w_REQ_2 <= "011";
					end if;
					IF (i_ANDAR_2 = '1') THEN
						w_REQ_2 <= "010"; 
					end if;
					IF (i_ANDAR_1 = '1') THEN
						w_REQ_2 <= "001";
					end if;
					IF (i_ANDAR_0 = '1') THEN
						w_REQ_2 <= "000";
					END IF;
					
					-- CALCULANDO DISTANCIAS PARA ELEVADOR ESQUERDO --
					IF(w_andar_E > w_REQ_1) THEN
						w_DIST_E_0 <= w_andar_E - w_REQ_1;
					ELSE
						w_DIST_E_0 <= w_REQ_1 - w_andar_E;
					END IF;
					
					IF(w_andar_E > w_REQ_2) THEN
						w_DIST_E_1 <= w_andar_E - w_REQ_2;
					ELSE
						w_DIST_E_1 <= w_REQ_2 - w_andar_E;
					END IF;
					
					-- CALCULANDO DISTANCIAS PARA ELEVADOR DIREITO
					IF(w_andar_D > w_REQ_1) THEN
						w_DIST_D_0 <= w_andar_D - w_REQ_1;
					ELSE
						w_DIST_D_0 <= w_REQ_1 - w_andar_D;
					END IF;
					
					IF(w_andar_D > w_REQ_2) THEN
						w_DIST_D_1 <= w_andar_D - w_REQ_2;
					ELSE
						w_DIST_D_1 <= w_REQ_2 - w_andar_D;
					END IF;
					-- VERIFICA SE ALGUM ELEVADOR ESTA EM MOVIMENTO,
					-- CASO ALGUM ESTEJA ELE NAO VAI ATENDER NENHUM CHAMADO
					IF(i_MOV_D = '0' AND i_MOV_E = '1') THEN
						IF(w_DIST_D_0 < w_DIST_D_1) THEN
							if (w_dESTINO_E = w_req_1) then
								w_dESTINO_D <= w_req_2;
							elsE
								w_DESTINO_D <= w_REQ_1;
							end if;
						ELSE
							if (w_dESTINO_E = w_req_2) then
								w_dESTINO_D <= w_req_1;
							elsE
								w_DESTINO_D <= w_REQ_2;
							end if;
						END IF;
					ELSIF(i_MOV_D = '1' AND i_MOV_E = '0') THEN
						IF(w_DIST_E_0 < w_DIST_E_1) THEN
							if (W_dESTINO_D = w_req_1) then
								w_dESTINO_E <= w_rEQ_2;
							elsE
								w_DESTINO_E <= w_REQ_1;
							end if;
						ELSE
							if(W_dESTINO_D = w_req_2) then
								w_dESTINO_E <= w_req_1;
							elsE
								w_DESTINO_E <= w_REQ_2;
							end if;
						END IF;
					ELSIF(i_MOV_D = '1' AND i_MOV_E = '1') THEN
					ELSE
					-- CALCULA O DESTINO MAIS PROXIMO PARA CADA ELEVADOR
						If (w_dist_D_0 <= w_dIST_D_1) then
							if(w_diST_d_0 < w_dist_E_0) then
								w_dESTINO_D <= w_req_1;
								w_dESTINO_E <= w_req_2;
							elsE
								w_dESTINO_E <= w_req_1;
								w_dESTINO_D <= w_req_2;
							end if;
						elsE
							if(w_dIST_D_1 < w_dIST_E_1) then
								w_dESTINO_D <= w_req_2;
								w_dESTINO_E <= w_rEQ_1;
							elsE
								w_dESTINO_E <= w_req_2;
								w_dESTINO_D <= w_req_1;
							end if;
						end if;
						If (w_dist_E_0 <= w_dIST_E_1) then
							if(w_diST_d_0 < w_dist_e_0) then
								w_dESTINO_D <= w_req_1;
								w_dESTINO_E <= w_req_2;
							elsE
								w_dESTINO_E <= w_req_1;
								w_dESTINO_D <= w_req_2;
							end if;
						elsE
							if(w_dIST_D_1 < w_dIST_E_1) then
								w_dESTINO_D <= w_req_2;
								w_dESTINO_E <= w_rEQ_1;
							elsE
								w_dESTINO_E <= w_req_2;
								w_dESTINO_D <= w_req_1;
							end if;
						end if;
					END IF;
					w_STATE <= st_ENVIA;
										
				-- TRES CHAMADAS	
				when st_TRES_CHAMADOS =>
				
				-- VERIFICA ONDE É UMA CHAMADA
					IF(i_ANDAR_0 = '1') THEN
						w_REQ_1 <= "000";
					end if;	
					IF (i_ANDAR_1 = '1') THEN
						w_REQ_1 <= "001";
					end if;
					IF (i_ANDAR_2 = '1') THEN
						w_REQ_1 <= "010";
					end if;
					IF (i_ANDAR_3 = '1') THEN
						w_REQ_1 <= "011";
					END IF;
					
					-- VERIFICA ONDE É A OUTRA CHAMADA
					IF(i_ANDAR_3 = '1') THEN
						w_REQ_2 <= "011";
					end if;	
					IF (i_ANDAR_2 = '1') THEN
						w_REQ_2 <= "010";
					end if;
					IF (i_ANDAR_1 = '1') THEN
						w_REQ_2 <= "001";
					end if;
					IF (i_ANDAR_0 = '1') THEN
						w_REQ_2 <= "000";
					END IF;
			
					-- VERIFICA ONDE É A CHAMADA RESTANTE		
					IF(w_REQ_1 = "010" AND w_REQ_2 = "000") THEN
						w_REQ_3 <= "001";
					ELSIF (w_REQ_1 = "011" AND w_REQ_2 = "001") THEN
						w_REQ_3 <= "010";
					ELSIF(w_REQ_1 = "011" AND w_REQ_2 = "000") THEN
						IF(i_ANDAR_1 = '1') THEN
							w_REQ_3 <= "001";
						ELSE
							w_REQ_3 <= "010";
						END IF;
					END IF;
					
					-- CALCULA AS DISTANCIAS ENTRE O ELEVADOR_D E TODAS AS CHAMADAS
					IF(w_andar_D > w_REQ_1) THEN
						w_DIST_D_0 <= w_andar_D - w_REQ_1;
					ELSE
						w_DIST_D_0 <= w_REQ_1 - w_andar_D;
					END IF;
					
					IF(w_andar_D > w_REQ_2) THEN
						w_DIST_D_1 <= w_andar_D - w_REQ_2;
					ELSE
						w_DIST_D_1 <= w_REQ_2 - w_andar_D;
					END IF;
					
					IF(w_andar_D > w_REQ_3) THEN
						w_DIST_D_2 <= w_andar_D - w_REQ_3;
					ELSE
						w_DIST_D_2 <= w_REQ_3 - w_andar_D;
					END IF;
					
					
					-- CALCULA AS DISTANCIAS ENTRE O ELEVADOR_E E TODAS AS CHAMADAS
					IF(w_andar_E > w_REQ_1) THEN
						w_DIST_E_0 <= w_andar_E - w_REQ_1;
					ELSE
						w_DIST_E_0 <= w_REQ_1 - w_andar_E;
					END IF;
					
					IF(w_andar_E > w_REQ_2) THEN
						w_DIST_E_1 <= w_andar_E - w_REQ_2;
					ELSE
						w_DIST_E_1 <= w_REQ_2 - w_andar_E;
					END IF;
					
					IF(w_andar_E > w_REQ_3) THEN
						w_DIST_E_2 <= w_andar_E - w_REQ_3;
					ELSE
						w_DIST_E_2 <= w_REQ_3 - w_andar_E;
					END IF;
					
					-- se o direito está se movendo
					If (i_mOV_D = '1') and (i_mOV_E = '0') then
						if(w_DIST_E_0 <= w_DIST_E_1 AND w_DIST_E_0 <= w_DIST_E_2) THEN
							if(w_deSTINO_D = w_req_1) then
								if(w_diST_E_1 < w_dIST_E_2) then
									w_dESTINO_E <= w_REQ_2;
								else
									w_dESTINO_E <= w_rEQ_3;
								end if;
							else
								w_dESTINO_E <= w_req_1;
							end if;
						elsif (w_DIST_E_1 <= w_DIST_E_0 AND w_DIST_E_1 <= w_DIST_E_2) then
							if(w_deSTINO_D = w_req_2) then
								if(w_diST_E_0 < w_dIST_E_2) then
									w_dESTINO_E <= w_REQ_1;
								else
									w_dESTINO_E <= w_rEQ_3;
								end if;
							elsE
								w_dESTINO_E <= w_rEQ_2;
							end if;
						elsif (w_DIST_E_2 <= w_DIST_E_0 AND w_DIST_E_2 <= w_DIST_E_1) then
							if(w_deSTINO_D = w_req_3) then
								if(w_diST_E_0 < w_dIST_E_1) then
									w_dESTINO_E <= w_REQ_1;
								else
									w_dESTINO_E <= w_rEQ_2;
								end if;
							elsE
								w_dESTINO_E <= w_rEQ_3;
							end if;
						end if;
						
					--Verifica se o esquerdo se move
					elsIf (i_mOV_D = '0') and (i_mOV_E = '1') then
						if(w_DIST_D_0 <= w_DIST_D_1 AND w_DIST_D_0 <= w_DIST_D_2) THEN
							if(w_deSTINO_E = w_req_1) then
								if(w_diST_D_1 < w_dIST_D_2) then
									w_dESTINO_D <= w_REQ_2;
								else
									w_dESTINO_D <= w_rEQ_3;
								end if;
							else
								w_dESTINO_D <= w_req_1;
							end if;
						elsif (w_DIST_D_1 <= w_DIST_D_0 AND w_DIST_D_1 <= w_DIST_d_2) then
							if(w_deSTINO_E = w_req_2) then
								if(w_diST_d_0 < w_dIST_D_2) then
									w_dESTINO_D <= w_REQ_1;
								else
									w_dESTINO_D <= w_rEQ_3;
								end if;
							elsE
								w_dESTINO_D <= w_rEQ_2;
							end if;
						elsif (w_DIST_D_2 <= w_DIST_D_0 AND w_DIST_D_2 <= w_DIST_D_1) then
							if(w_deSTINO_E = w_req_3) then
								if(w_diST_D_0 < w_dIST_D_1) then
									w_dESTINO_d <= w_REQ_1;
								else
									w_dESTINO_D <= w_rEQ_2;
								end if;
							elsE
								w_dESTINO_D <= w_rEQ_3;
							end if;
						end if;
					elsif (i_mOV_D = '1' ANd i_mOV_E = '1') then
					else -- se nenhum se move
					if(w_DIST_D_0 <= w_DIST_D_1 AND w_DIST_D_0 <= w_DIST_D_2) THEN
						if(w_dIST_D_0 < w_dIST_E_0) then
							w_dESTINO_D <= w_Req_1;
						elsE
							IF(w_DIST_D_1 < w_DIST_D_2) THEN
								w_DESTINO_D <= w_REQ_2;
							ELSE
								w_DESTINO_D <= w_REQ_3;
							END IF;
						end if;
					ELSIF(w_DIST_D_1 <= w_DIST_D_0 AND w_DIST_D_1 <= w_DIST_D_2) THEN
						if(w_dIST_D_1 < w_dIST_E_1) then
							w_dESTINO_D <= w_rEQ_2;
						elsE
							IF(w_DIST_D_0 < w_DIST_D_2) THEN
								w_DESTINO_D <= w_REQ_1;
							ELSE
								w_DESTINO_D <= w_REQ_3;
							END IF;
						end if;
					ELSIF(w_DIST_D_2 <= w_DIST_D_0 AND w_DIST_D_2 <= w_DIST_D_1) THEN
						if(w_dIST_D_2 < w_dIST_E_2) then
							w_dESTINO_D <= w_rEQ_3;
						elsE	
							IF(w_DIST_D_0 < w_DIST_D_1) THEN
								w_DESTINO_D <= w_REQ_1;
							ELSE
								w_DESTINO_D <= w_REQ_2;
							END IF;
						end if;
					END IF;
					
					-- VERIFICA QUAL A DISTANCIA MAIS PROXIMO PARA ELEVADOR_E E DEIXA A OUTRA NA ESPERA
					if(w_DIST_E_0 <= w_DIST_E_1 AND w_DIST_E_0 <= w_DIST_E_2) THEN
						if(w_dIST_D_0 < w_dIST_E_0) then
							if(w_diST_E_1 < w_dIST_E_2) then
								w_dESTINO_E <= w_REQ_2;
							else
								w_dESTINO_E <= w_rEQ_3;
							end if;
						elsE
							w_dESTINO_E <= w_req_1;
						end if;
					ELSIF(w_DIST_E_1 <= w_DIST_E_0 AND w_DIST_E_1 <= w_DIST_E_2) THEN
						if(w_dIST_D_1 < w_dIST_E_1) then
							if(w_diST_E_0 < w_dIST_E_2) then
								w_dESTINO_E <= w_REQ_1;
							else
								w_dESTINO_E <= w_rEQ_3;
							end if;
						elsE
							w_dESTINO_E <= w_rEQ_2;
						end if;
					ELSIF(w_DIST_E_2 <= w_DIST_E_0 AND w_DIST_E_2 <= w_DIST_E_1) THEN
						if(w_dIST_D_2 < w_dIST_E_2) then
							IF(w_DIST_E_0 < w_DIST_E_1) THEN
								w_DESTINO_E <= w_REQ_1;
							else
								w_dESTINO_E <= w_rEQ_2;
							end if;
						elsE
							w_dESTINO_E <= w_rEQ_3;
						end if;
					END IF;
				end if;
					w_STATE <= st_ENVIA;
									
				-- QUATRO CHAMADAS
				when st_QUATRO_CHAMADOS => 
				
				--VERIFICA SETA OS ELEVADORES PARA O ANDAR MAIS PROXIMO
				If (i_mOV_D = '1' and i_mOV_E = '0') then
					w_dESTINO_E <= w_andar_E;
				elsif (i_MoV_D = '0' and i_mov_E = '1') then
					w_dESTINO_D <= w_andar_D;
				elsif (i_moV_D = '1' and i_mOV_E = '1') then
				elsE
					If (w_andar_D = w_andar_E) TheN
						If(w_andar_D = "11") TheN
							w_DESTINO_E <= w_andar_E;
							w_DESTINO_D <= w_andar_D - "01";
						ElsE	
							w_DESTINO_E <= w_andar_E;
							w_DESTINO_D <= w_andar_D + "01";
						end if;
					ElsE
						w_DESTINO_D <= w_andar_D;
						w_DESTINO_E <= w_andar_E;
					End If;
				end if;
				w_STATE <= st_ENVIA;
			
			--ENVIA
			when st_ENVIA =>
				o_DESTINO_D <= w_DESTINO_D;
				o_DESTINO_E <= w_DESTINO_E;
				w_STATE <= st_IDLE;
		END CASE;
		
		end if;
	END PROCESS;
END;


	
	