--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity suma is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           suma_out : out  STD_LOGIC_VECTOR (31 downto 0));
end suma;

architecture Behavioral of suma is

begin
	
	process (op1, op2)
	begin
		
		suma_out <= op1 + op2; 
	
	end process;

end Behavioral;