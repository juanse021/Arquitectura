--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity IM is
    Port ( reset : in  STD_LOGIC;
           IM_in : in  STD_LOGIC_VECTOR (31 downto 0);
           IM_out : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;

architecture Behavioral of IM is

type rom is array (0 to 63) of std_logic_vector (31 downto 0);
		
	impure function Cargar_Rom (Nombre_Archivo : in string) return rom is
	
		FILE Archivo_Rom : text open read_mode is Nombre_Archivo;
		variable LineaArchivo_Rom : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom;
		
		begin
		
			for I in rom'range loop
				readline (Archivo_Rom, LineaArchivo_Rom);
				read(LineaArchivo_Rom, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
			
		return temp_mem;
	end function;
	
	signal instruccion : rom := Cargar_Rom("test.data");
	
begin

	process(reset,IM_in, instruccion)
	begin
	
			if(reset = '1')then
				IM_out <= (others=>'0');
			else
				IM_out <= instruccion(conv_integer(IM_in(5 downto 0)));
			end if;
		
	end process;

end Behavioral;