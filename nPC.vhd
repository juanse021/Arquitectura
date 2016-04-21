--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nPC is
    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           nPC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           nPC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture Behavioral of nPC is

begin

	process (clk, reset, nPC_in)
	begin
		if (reset = '1') then
			nPC_out <= (others => '0');
		else
			if(rising_edge(clk)) then
				nPC_out <= nPC_in;
			end if;
		end if;
-- testeando
end process;

end Behavioral;