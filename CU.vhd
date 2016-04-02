--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Giraldo Herrera                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CU is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CU_out : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

begin

	process (Op, Op3)	
	begin
	
		if(op = "10") then
			case (Op3) is
				when("000000") =>
					CU_out <= "000000"; -- Add
				when("000010") =>
					CU_out <= "000001"; -- Or
				when("000011") =>
					CU_out <= "000010"; -- Xor
				when("000001") =>
					CU_out <= "000011"; -- And
				when("000101") =>
					CU_out <= "000100"; -- Nand
				when("000110") =>
					CU_out <= "000101"; -- Nor
				when("000111") =>
					CU_out <= "000110"; -- Xnor
				when("000100") =>
					CU_out <= "000111"; -- Sub
				when others =>
					CU_out <= "111111";
			end case;
		end if;
	end process;


end Behavioral;

