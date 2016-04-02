--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Giraldo Herrera                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (5 downto 0);
           CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process(CRs1,CRs2,ALUOp)
	begin
	   case (ALUOp) is 
			when "000000" => -- Add
				ALUResult <= CRs1 + CRs2;
			when "000001" => -- Or
				ALUResult <= CRs1 or CRs2;
			when "000010" => -- Xor
				ALUResult <= CRs1 xor CRs2;
			when "000011" => -- And
				ALUResult <= CRs1 and CRs2;
			when "000100" => -- Nand
				ALUResult <= CRs1 nand CRs2;
			when "000101" => -- Nor
				ALUResult <= CRs1 nor CRs2;
			when "000110" => -- Xnor
				ALUResult <= CRs1 xnor CRs2;
			when "000111" => -- Sub
				ALUResult <= CRs1 - CRs2;
			when others => -- Cae el nop
				ALUResult <= (others=>'0');
		end case;
	end process;

end Behavioral;

