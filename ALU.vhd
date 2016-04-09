--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
			when "000001" => -- Add
				ALUResult <= CRs1 + CRs2;
			when "000010" => -- Sub
				ALUResult <= CRs1 - CRs2;
			when "000011" => -- And
				ALUResult <= CRs1 and CRs2;
			when "000100" => -- Nand
				ALUResult <= CRs1 nand CRs2;
			when "000101" => -- Or
				ALUResult <= CRs1 or CRs2;
			when "000110" => -- Nor
				ALUResult <= CRs1 nor CRs2;
			when "000111" => -- Xor
				ALUResult <= CRs1 xor CRs2;
			when "001000" => -- Xnor
				ALUResult <= CRs1 xnor CRs2;
			when others => 
				ALUResult <= (others=>'0');
		end case;
	end process;

end Behavioral;