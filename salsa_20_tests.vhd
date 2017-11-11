-- salsa20 tests
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.SALSA20_FUNCTIONS.all;

entity SALSA20_CIPHER_QUARTERROUND is
	Port (FUNCTION_INPUT_0 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_1 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_2 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_3 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_0 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_1 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_2 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_3 : out  std_logic_vector (WORD_SIZE - 1 downto 0));
			
end SALSA20_CIPHER_QUARTERROUND;

architecture Behavioral of SALSA20_CIPHER_QUARTERROUND is
	signal qrnd_out: std_logic_vector((WORD_SIZE*4) - 1 downto 0);
	qrnd_out <= QuarterRound(FUNCTION_INPUT_0, FUNCTION_INPUT_1, FUNCTION_INPUT_2, FUNCTION_INPUT_3);
	FUNCTION_OUTPUT_0 <= qrnd_out(127 downto 96);
	FUNCTION_OUTPUT_1 <= qrnd_out(95 downto 64);
	FUNCTION_OUTPUT_2 <= qrnd_out(63 downto 32);
	FUNCTION_OUTPUT_3 <= qrnd_out(31 downto 0);
end Behavioral;