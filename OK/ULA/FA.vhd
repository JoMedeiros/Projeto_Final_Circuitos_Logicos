LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FA IS
PORT ( 	A, B, Cin : IN STD_LOGIC;
			S, Cout : OUT STD_LOGIC);
END;

ARCHITECTURE s OF FA IS
BEGIN
	S <= A XOR B XOR Cin;
	Cout <= ((A XOR B) AND Cin) OR (A AND B);
END s;