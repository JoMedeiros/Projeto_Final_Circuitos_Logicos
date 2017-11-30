LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY EL IS	--Extensor Lógico
	PORT (A,B: IN STD_LOGIC;
			S: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			SAIDA: OUT STD_LOGIC);
END;

ARCHITECTURE arch OF EL IS

SIGNAL aux: STD_LOGIC_VECTOR (4 DOWNTO 0);

BEGIN
	aux(0) <= NOT S(1) AND A;
	aux(1) <= S(2) AND A;
	aux(2) <= NOT S(0) AND A AND B;
	aux(3) <= S(2) AND NOT S(1) AND NOT S(0) AND B;
	aux(4) <= NOT S(2) AND S(1) AND S(0) AND NOT A AND NOT B;
	
	SAIDA <= aux(0) OR aux(1) OR aux(2) OR aux(3) OR aux(4);
	
END arch;