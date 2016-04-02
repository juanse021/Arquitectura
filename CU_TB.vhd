--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Giraldo Herrera                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CU_TB IS
END CU_TB;
 
ARCHITECTURE behavior OF CU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         CU_out : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal CU_out : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          Op => Op,
          Op3 => Op3,
          CU_out => CU_out
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      op <= "10";
		op3 <= "000000" ;
		wait for 100 ns;
		op3 <= "000010" ;
		wait for 100 ns;
		op3 <= "000011" ;
		wait for 100 ns; 
		op3 <= "000001" ;
		wait for 100 ns;
		op3 <= "000101" ;
		wait for 100 ns;
		op3 <= "000110" ;
		wait for 100 ns;
		op3 <= "000111" ;
		wait for 100 ns;
		op3 <= "000100" ;
		wait;
   end process;
END;
