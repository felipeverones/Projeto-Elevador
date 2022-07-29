library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity REGISTRADOR IS
port(
	i_CLK : in std_logic;
	i_RST : in std_logic;
	i_EN  : in std_logic;
	i_D	: in std_logic_vector(1 downto 0);
	o_Q   : OUT std_logic_vector(1 downto 0)
	
);
end registrador;

architecture behavioral of REGISTRADOR is

begin

	process(i_CLK)
	begin					
		if RISING_EDGE(i_CLK) then
			if (i_RST = '0')then
				o_Q <= (OTHERS =>'0');
			else
				if (i_EN = '1') then
					o_Q <= i_D;
				end if;
			end if;
		end if;
	end process;

end behavioral;
