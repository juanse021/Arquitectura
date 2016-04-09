--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Procesador_TB IS
END Procesador_TB;
 
ARCHITECTURE behavior OF Procesador_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador PORT MAP (
          clk => clk,
          reset => reset,
          salida => salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      wait for 20 ns;	
		reset <= '0'; 
      wait;
		
   end process;

END;