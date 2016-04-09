--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is

begin

	process (clk, reset, PC_in)
	begin
		if (reset = '1') then
			PC_out <= (others => '0');
		else
			if(rising_edge(clk)) then
				PC_out <= PC_in;
			end if;
		end if;
end process;

end Behavioral;