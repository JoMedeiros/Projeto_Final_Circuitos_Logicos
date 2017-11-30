LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY deslocador IS
	PORT (ENTRA: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			SELETOR: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			SAI: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE arch OF deslocador IS
BEGIN
	PROCESS (ENTRA,SELETOR)
		BEGIN
			CASE SELETOR IS
				WHEN "00" => SAI <= ENTRA;																	--Nada
				WHEN "01" => SAI <= ENTRA(14 DOWNTO 0) & '0';										--Multi
				WHEN "10" => SAI <= '0' & ENTRA(15 DOWNTO 1);										--Div
				WHEN OTHERS => SAI <= ENTRA(0) & ENTRA(1) & ENTRA(2) & ENTRA(3) & ENTRA(4) --Inv
							& ENTRA(5) & ENTRA(6) & ENTRA(7) & ENTRA(8) & ENTRA(9) & ENTRA(10) 
							& ENTRA(11)	& ENTRA(12) & ENTRA(13) & ENTRA(14) & ENTRA(15);
				
			END CASE;
	END PROCESS;
	
END arch;