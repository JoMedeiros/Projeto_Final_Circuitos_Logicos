library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modulo_saida is
    port (
        clock  	: in std_logic;
        end_alg   : in std_logic;
		  result		: in std_logic_vector( 15 downto 0 );
        t_alg 		: in std_logic_vector( 1 downto 0 );
        saida 		: out std_logic_vector( 15 downto 0 );
		  saida_LED	: out std_logic_vector( 15 downto 0 );
		  LED_alg	: out std_logic
    );
end modulo_saida;

architecture arch of modulo_saida is
begin
	-- Precisa criar component registrador
	reg_cont : PORT MAP ();
    process ( clock, result )
    begin
        if ( clock'event and clock = '1' ) then
            saida <= result;
				-- Fim de algoritmo mostra o resultado e indica fim de algoritmo
            if ( end_alg = '1' ) then
                LED_alg <= '1'; 
					 saida_LED <= result;
				-- 
				elsif ( t_alg = "00" ) then
					saida_LED(0) <= '1';
            end if;
        end if;
    end process;
	 
end arch;
