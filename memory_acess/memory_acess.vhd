LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY memory_acess IS
    port (
       clk  : in std_logic;
		  
       
    );
end ram;

architecture arch of memory_acess is

COMPONENT ram IS
	PORT (
        clock  : in std_logic;
        wren   : in std_logic; -- Sempre 0
        addr   : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        data_i : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Não utilizado
        data_o : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
END COMPONENT;

BEGIN
	
	memi : PORT MAP (clk, );
    
end arch;
