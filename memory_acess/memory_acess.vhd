LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY memory_acess IS
    port (
       clk  : in std_logic;
		 Executa: in std_logic;
       OPcode : in std_logic_vector( 3 downto 0 );
		 instrucao : out std_logic_vector( 15 downto 0 )
    );
end memory_acess;

architecture arch of memory_acess is

COMPONENT ram IS
	generic (
        DATA_WIDTH : integer := 16;
        ADDR_WIDTH : integer := 16
    );
	PORT (
        clock  : in std_logic;
        wren   : in std_logic; -- Sempre 0
        addr   : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        data_i : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Não utilizado
        data_o : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
END COMPONENT;

type Tcpu_state is (
	ESPERA,	-- Esperando executar
	VERIFICA,	-- Verifica o tipo de instrução
	DECOD_ADD, DECOD_SUB, DECOD_AND,	-- decodificação das instruções
	DECOD_NOR, DECOD_OR, DECOD_SHL,
	DECOD_SHR, DECOD_LW, DECOD_SW, 
	DECOD_ADDi				
	);
VARIABLE ESTADO_CPU : TCPU_STATE;  -- variável de estado da CPU (CPU state variable)

signal iaddr : std_logic_vector( 15 downto 0 );

begin
	
	process (clock)
    begin
        if clock'event and clock = '1' and executa = '1' then
            if Executa = '1' then
                ram_image(to_integer(unsigned(addr))) <= data_i;
            end if;
        end if;
    end process;
	
	memi : PORT MAP (clk, '0', );
    
end arch;
