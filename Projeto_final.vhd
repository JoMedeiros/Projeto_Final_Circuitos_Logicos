LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Projeto Final
ENTITY Projeto_final IS	
	PORT (Switches:		IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			Reset :			IN STD_LOGIC;
			Operar :			IN STD_LOGIC;
			Validar :		IN STD_LOGIC;
			clk: 				IN STD_LOGIC;									-- Clock
			
			D1,D2,D3,D4 :	OUT STD_LOGIC_VECTOR (6 DOWNTO 0);		-- Displays para os numeros
			LED_16 : 		OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			LED_TERMINO : 	OUT STD_LOGIC									-- Indica o fim de uma operaçao
END;		

ARCHITECTURE arch OF Projeto_final IS

	COMPONENT Banco_Reg
	PORT (reg_alvo: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clk, load: IN STD_LOGIC;
			entrada: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			saida: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
	END COMPONENT;

	COMPONENT Registrador
		PORT ( entrada_r : IN STD_LOGIC_VECTOR (15 DOWNTO 0);	-- Numero a ser registrado
				clk_r, ld_r, escolhido_r: IN STD_LOGIC;			-- Clock, indica se a entrada será registrada, indica se o registrador é o certo
				saida_r : OUT STD_LOGIC_VECTOR (15 DOWNTO 0) ); -- Numero atualmente registrado / novo numero registrado
	END COMPONENT;
	
	COMPONENT Display 
		PORT (W,X,Y,Z: 		IN STD_LOGIC;				-- Bits do número a ser mostrado no display (Hexadeciaml)
				A,B,C,D,E,F,G:	OUT STD_LOGIC);			-- Segmentos do display que serão acesos
	END COMPONENT;
	
	COMPONENT ULA												
		PORT (A,B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);	-- Entradas da ULA
			M: IN STD_LOGIC;									-- Modo da ULA. Aritimético ou lógico
			SELETOR: IN STD_LOGIC_VECTOR(1 DOWNTO 0);	-- Operaçao que a ULA irá realizar
			SAIDA: OUT STD_LOGIC_VECTOR(15 DOWNTO 0); -- Resultado da operaçao
			COUT: OUT STD_LOGIC);							-- Indica se ocorreu overflow durante a operaçao
	END COMPONENT;

	COMPONENT Modulo_entrada	
	PORT( Switches:		IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			Reset :			IN STD_LOGIC;
			Operar :			IN STD_LOGIC;
			Validar :		IN STD_LOGIC;
			clk: 				IN STD_LOGIC;
			Clear:			OUT STD_LOGIC;
			Executar:		OUT STD_LOGIC;
			Valor:			OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT Modulo_saida
	PORT (clock: 		IN STD_LOGIC;
			end_alg: 	IN STD_LOGIC;
			result: 		IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			t_alg: 		IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			saida: 		OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			saida_LED: 	OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			Led_alg:		OUT STD_LOGIC);	
	END COMPONENT;
	
	SIGNAL reg_A: STD_LOGIC_VECTOR (15 DOWNTO 0);	-- Utiliza o valor do registrador reg_A
	SIGNAL reg_B: STD_LOGIC_VECTOR (15 DOWNTO 0);	-- Utiliza o valor do registrador reg_B
	SIGNAL reg_R: STD_LOGIC_VECTOR (15 DOWNTO 0);	-- Utiliza o valor do registrador reg_R
	
	SIGNAL D: STD_LOGIC_VECTOR (15 DOWNTO 0);			-- Sinal a ser mandado para o display
	
	
	
BEGIN

	PROCESS ( clk,  )
	BEGIN
		IF (  ) THEN
	END PROCESS;

	BANCO_REGISTRADORES: Banco_Reg PORT MAP ( reg_alvo , clk, load, entrada, saida );

	ULA_REG_A: Registrador PORT MAP (I, clk, '1', A_or_B(0), reg_A);	-- Registrador para o valor de A
	ULA_REG_B: Registrador PORT MAP (I, clk, '1', A_or_B(1), reg_B);	-- Registrador para o valor de B
	ULA_REG_R: Registrador PORT MAP (I, clk, '1', A_or_B(1), reg_R);	-- Registrador para o Resultado de A operado com B
			
	U : ULA PORT MAP (reg_A, reg_B ,M ,SELETOR, C, OVERFLOW);
	
	debug_ULA <= C;
	
END arch;
