--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is

	COMPONENT nPC
	PORT(
		nPC_in : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		nPC_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT PC
	PORT(
		PC_in : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		PC_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT suma
	PORT(
		op1 : IN std_logic_vector(31 downto 0);
		op2 : IN std_logic_vector(31 downto 0);          
		suma_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT IM
	PORT(
		IM_in : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;        
		IM_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT CU
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);
		CU_out : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RF
	PORT(
		reset : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		datawrite : IN std_logic_vector(31 downto 0);          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ALU
	PORT(
		CRs1 : IN std_logic_vector(31 downto 0);
		CRs2 : IN std_logic_vector(31 downto 0);
		ALUOp : IN std_logic_vector(5 downto 0);
		ALUResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal suma_out, nPC_out, PC_out, IM_out, CRs1, CRs2, ALUResult : std_logic_vector(31 downto 0);
	signal CU_out : std_logic_vector(5 downto 0);
	
begin

	Inst_nPC: nPC PORT MAP(
		nPC_in => suma_out,
		reset => reset,
		clk => clk,
		nPC_out => nPC_out
	);
	
	Inst_PC: PC PORT MAP(
		PC_in => nPC_out,
		reset => reset,
		clk => clk,
		PC_out => PC_out 
	);
	
	Inst_suma: suma PORT MAP(
		op1 => x"00000001",
		op2 => nPC_out,
		suma_out => suma_out
	);
	
	Inst_IM: IM PORT MAP(
		IM_in => PC_out,
		reset => reset,
		IM_out => IM_out
	);
	
	Inst_CU: CU PORT MAP(
		Op => IM_out(31 downto 30),
		Op3 => IM_out(24 downto 19),
		CU_out => CU_out
	);
	
	Inst_RF: RF PORT MAP(
		reset => reset,
		rs1 => IM_out(18 downto 14),
		rs2 => IM_out(4 downto 0),
		rd => IM_out(29 downto 25),
		datawrite => ALUResult,
		CRs1 => CRs1,
		CRs2 => CRs2
	);
	
	Inst_ALU: ALU PORT MAP(
		CRs1 => CRs1,
		CRs2 => CRs2,
		ALUOp => CU_out,
		ALUResult => ALUResult
	);
	
	salida <= ALUResult;

end Behavioral;