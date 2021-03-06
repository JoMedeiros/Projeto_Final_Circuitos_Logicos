LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--  Módulo de entrada de operação 
ENTITY Modulo_entrada IS	
	PORT( Switches:		IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			Reset :			IN STD_LOGIC;
			Operar :			IN STD_LOGIC;
			Validar :		IN STD_LOGIC;
			
--			Operacao:		IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			clk: 				IN STD_LOGIC;									-- Clock
			
			Clear:			OUT STD_LOGIC;
			Executar:		OUT STD_LOGIC;
			Valor:			OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
			
END;

ARCHITECTURE arch of Modulo_entrada IS

BEGIN
	PROCESS ( clk, Switches, Reset, Operar, Validar ) --, Operacao )
	BEGIN
	IF ( clk'EVENT AND clk = '1' ) THEN
	
		IF ( Reset = '1' ) THEN
			Clear <= '1';
		ELSIF( Reset = '0' ) THEN
			Clear <= '0';
			
		ELSIF ( Operar = '1' ) THEN
			Executar <= '1';
		ELSIF ( Operar = '0' ) THEN
			Executar <= '0';
			
		ELSIF ( Validar = '1' ) THEN 
			Valor <= Switches;
		ELSIF ( Validar = '0' ) THEN 
			Valor <= "0000000000000000";
		END IF;
		
	END PROCESS;

END arch;
