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
 
ENTITY PC_TB IS
END PC_TB;
 
ARCHITECTURE behavior OF PC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         PC_in : IN  std_logic_vector(31 downto 0);
         PC_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal PC_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PC_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          clk => clk,
          reset => reset,
          PC_in => PC_in,
          PC_out => PC_out
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
      reset <= '0';
      wait for 100 ns;	
		reset <= '1'; 
		PC_in <= x"00000001";       
		wait for 20 ns;
		PC_in <= x"0000000A";
		wait for 20 ns;
		PC_in <= x"00000010";
		wait for 20 ns;
		reset <= '0'; 
      wait;
   end process;

END;
