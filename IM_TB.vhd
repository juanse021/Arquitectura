--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY IM_TB IS
END IM_TB;
 
ARCHITECTURE behavior OF IM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         reset : IN  std_logic;
         IM_in : IN  std_logic_vector(31 downto 0);
         IM_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal IM_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal IM_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          reset => reset,
          IM_in => IM_in,
          IM_out => IM_out
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <='1';
		IM_in <= x"00000001";
      wait for 100 ns;	
		reset <='0';
		IM_in <= x"00000002";
      wait;
   end process;

END;