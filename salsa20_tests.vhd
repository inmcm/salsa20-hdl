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
	signal qrnd_out: ARRAY_4X1_WORDSIZE;
begin
	qrnd_out <= QuarterRound(FUNCTION_INPUT_0, FUNCTION_INPUT_1, FUNCTION_INPUT_2, FUNCTION_INPUT_3);
	FUNCTION_OUTPUT_0 <= qrnd_out(0);
	FUNCTION_OUTPUT_1 <= qrnd_out(1);
	FUNCTION_OUTPUT_2 <= qrnd_out(2);
	FUNCTION_OUTPUT_3 <= qrnd_out(3);

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.SALSA20_FUNCTIONS.all;
entity SALSA20_CIPHER_ROWROUND is
	Port (FUNCTION_INPUT_00 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_01 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_02 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_03 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_04 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_05 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_06 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_07 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_08 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_09 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_10 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_11 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_12 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_13 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_14 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_15 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_00 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_01 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_02 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_03 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_04 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_05 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_06 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_07 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_08 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_09 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_10 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_11 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_12 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_13 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_14 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_15 : out  std_logic_vector (WORD_SIZE - 1 downto 0));
end SALSA20_CIPHER_ROWROUND;

architecture Behavioral of SALSA20_CIPHER_ROWROUND is
	signal rowround_in: ARRAY_4X4_WORDSIZE;
	signal rowround_out: ARRAY_4X4_WORDSIZE;
begin
	rowround_in <= ((FUNCTION_INPUT_00, FUNCTION_INPUT_01, FUNCTION_INPUT_02, FUNCTION_INPUT_03),
				   (FUNCTION_INPUT_04, FUNCTION_INPUT_05, FUNCTION_INPUT_06, FUNCTION_INPUT_07),
				   (FUNCTION_INPUT_08, FUNCTION_INPUT_09, FUNCTION_INPUT_10, FUNCTION_INPUT_11),
				   (FUNCTION_INPUT_12, FUNCTION_INPUT_13, FUNCTION_INPUT_14, FUNCTION_INPUT_15));
	
	--Working
	rowround_out <= RowRound(FUNCTION_INPUT_00, FUNCTION_INPUT_01, FUNCTION_INPUT_02, FUNCTION_INPUT_03,
				   			 FUNCTION_INPUT_04, FUNCTION_INPUT_05, FUNCTION_INPUT_06, FUNCTION_INPUT_07,
				   			 FUNCTION_INPUT_08, FUNCTION_INPUT_09, FUNCTION_INPUT_10, FUNCTION_INPUT_11,
				   			 FUNCTION_INPUT_12, FUNCTION_INPUT_13, FUNCTION_INPUT_14, FUNCTION_INPUT_15);
	FUNCTION_OUTPUT_00 <= rowround_out(0,0);
	FUNCTION_OUTPUT_01 <= rowround_out(0,1);
	FUNCTION_OUTPUT_02 <= rowround_out(0,2);
	FUNCTION_OUTPUT_03 <= rowround_out(0,3);
	FUNCTION_OUTPUT_04 <= rowround_out(1,0);
	FUNCTION_OUTPUT_05 <= rowround_out(1,1);
	FUNCTION_OUTPUT_06 <= rowround_out(1,2);
	FUNCTION_OUTPUT_07 <= rowround_out(1,3);
	FUNCTION_OUTPUT_08 <= rowround_out(2,0);
	FUNCTION_OUTPUT_09 <= rowround_out(2,1);
	FUNCTION_OUTPUT_10 <= rowround_out(2,2);
	FUNCTION_OUTPUT_11 <= rowround_out(2,3);
	FUNCTION_OUTPUT_12 <= rowround_out(3,0);
	FUNCTION_OUTPUT_13 <= rowround_out(3,1);
	FUNCTION_OUTPUT_14 <= rowround_out(3,2);
	FUNCTION_OUTPUT_15 <= rowround_out(3,3);

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.SALSA20_FUNCTIONS.all;
entity SALSA20_CIPHER_COLUMNROUND is
	Port (FUNCTION_INPUT_00 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_01 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_02 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_03 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_04 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_05 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_06 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_07 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_08 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_09 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_10 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_11 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_12 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_13 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_14 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_15 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_00 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_01 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_02 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_03 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_04 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_05 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_06 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_07 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_08 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_09 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_10 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_11 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_12 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_13 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_14 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_15 : out  std_logic_vector (WORD_SIZE - 1 downto 0));
end SALSA20_CIPHER_COLUMNROUND;

architecture Behavioral of SALSA20_CIPHER_COLUMNROUND is
	signal columnround_out: ARRAY_4X4_WORDSIZE;
begin
	columnround_out <= ColumnRound(FUNCTION_INPUT_00, FUNCTION_INPUT_01, FUNCTION_INPUT_02, FUNCTION_INPUT_03,
				   			    FUNCTION_INPUT_04, FUNCTION_INPUT_05, FUNCTION_INPUT_06, FUNCTION_INPUT_07,
				   			    FUNCTION_INPUT_08, FUNCTION_INPUT_09, FUNCTION_INPUT_10, FUNCTION_INPUT_11,
				   			    FUNCTION_INPUT_12, FUNCTION_INPUT_13, FUNCTION_INPUT_14, FUNCTION_INPUT_15);
	FUNCTION_OUTPUT_00 <= columnround_out(0,0);
	FUNCTION_OUTPUT_01 <= columnround_out(0,1);
	FUNCTION_OUTPUT_02 <= columnround_out(0,2);
	FUNCTION_OUTPUT_03 <= columnround_out(0,3);
	FUNCTION_OUTPUT_04 <= columnround_out(1,0);
	FUNCTION_OUTPUT_05 <= columnround_out(1,1);
	FUNCTION_OUTPUT_06 <= columnround_out(1,2);
	FUNCTION_OUTPUT_07 <= columnround_out(1,3);
	FUNCTION_OUTPUT_08 <= columnround_out(2,0);
	FUNCTION_OUTPUT_09 <= columnround_out(2,1);
	FUNCTION_OUTPUT_10 <= columnround_out(2,2);
	FUNCTION_OUTPUT_11 <= columnround_out(2,3);
	FUNCTION_OUTPUT_12 <= columnround_out(3,0);
	FUNCTION_OUTPUT_13 <= columnround_out(3,1);
	FUNCTION_OUTPUT_14 <= columnround_out(3,2);
	FUNCTION_OUTPUT_15 <= columnround_out(3,3);

end Behavioral;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.SALSA20_FUNCTIONS.all;
entity SALSA20_CIPHER_DOUBLEROUND is
	Port (FUNCTION_INPUT_00 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_01 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_02 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_03 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_04 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_05 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_06 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_07 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_08 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_09 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_10 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_11 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_12 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_13 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_14 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_15 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_00 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_01 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_02 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_03 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_04 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_05 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_06 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_07 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_08 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_09 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_10 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_11 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_12 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_13 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_14 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_15 : out  std_logic_vector (WORD_SIZE - 1 downto 0));
end SALSA20_CIPHER_DOUBLEROUND;

architecture Behavioral of SALSA20_CIPHER_DOUBLEROUND is
	signal doubleround_out: ARRAY_4X4_WORDSIZE;
begin
	doubleround_out <= DoubleRound(FUNCTION_INPUT_00, FUNCTION_INPUT_01, FUNCTION_INPUT_02, FUNCTION_INPUT_03,
				   			    FUNCTION_INPUT_04, FUNCTION_INPUT_05, FUNCTION_INPUT_06, FUNCTION_INPUT_07,
				   			    FUNCTION_INPUT_08, FUNCTION_INPUT_09, FUNCTION_INPUT_10, FUNCTION_INPUT_11,
				   			    FUNCTION_INPUT_12, FUNCTION_INPUT_13, FUNCTION_INPUT_14, FUNCTION_INPUT_15);
	FUNCTION_OUTPUT_00 <= doubleround_out(0,0);
	FUNCTION_OUTPUT_01 <= doubleround_out(0,1);
	FUNCTION_OUTPUT_02 <= doubleround_out(0,2);
	FUNCTION_OUTPUT_03 <= doubleround_out(0,3);
	FUNCTION_OUTPUT_04 <= doubleround_out(1,0);
	FUNCTION_OUTPUT_05 <= doubleround_out(1,1);
	FUNCTION_OUTPUT_06 <= doubleround_out(1,2);
	FUNCTION_OUTPUT_07 <= doubleround_out(1,3);
	FUNCTION_OUTPUT_08 <= doubleround_out(2,0);
	FUNCTION_OUTPUT_09 <= doubleround_out(2,1);
	FUNCTION_OUTPUT_10 <= doubleround_out(2,2);
	FUNCTION_OUTPUT_11 <= doubleround_out(2,3);
	FUNCTION_OUTPUT_12 <= doubleround_out(3,0);
	FUNCTION_OUTPUT_13 <= doubleround_out(3,1);
	FUNCTION_OUTPUT_14 <= doubleround_out(3,2);
	FUNCTION_OUTPUT_15 <= doubleround_out(3,3);

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.SALSA20_FUNCTIONS.all;
entity SALSA20_HASH_FUNCTION is
	Port (TEST_INPUT_00 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_01 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_02 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_03 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_04 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_05 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_06 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_07 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_08 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_09 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_10 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_11 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_12 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_13 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_14 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_15 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_16 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_17 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_18 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_19 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_20 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_21 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_22 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_23 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_24 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_25 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_26 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_27 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_28 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_29 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_30 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_31 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_32 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_33 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_34 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_35 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_36 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_37 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_38 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_39 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_40 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_41 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_42 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_43 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_44 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_45 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_46 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_47 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_48 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_49 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_50 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_51 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_52 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_53 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_54 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_55 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_56 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_57 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_58 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_59 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_60 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_61 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_62 : in  std_logic_vector (7 downto 0);
		  TEST_INPUT_63 : in  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_00 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_01 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_02 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_03 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_04 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_05 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_06 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_07 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_08 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_09 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_10 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_11 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_12 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_13 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_14 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_15 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_16 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_17 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_18 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_19 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_20 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_21 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_22 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_23 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_24 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_25 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_26 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_27 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_28 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_29 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_30 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_31 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_32 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_33 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_34 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_35 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_36 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_37 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_38 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_39 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_40 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_41 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_42 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_43 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_44 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_45 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_46 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_47 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_48 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_49 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_50 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_51 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_52 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_53 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_54 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_55 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_56 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_57 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_58 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_59 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_60 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_61 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_62 : out  std_logic_vector (7 downto 0);
		  TEST_OUTPUT_63 : out  std_logic_vector (7 downto 0));
end SALSA20_HASH_FUNCTION;

architecture Behavioral of SALSA20_HASH_FUNCTION is
	-- signal doubleround_out: ARRAY_4X4_WORDSIZE;
	signal temp00, temp01, temp02, temp03, temp04, temp05, temp06, temp07, temp08, temp09, temp10, temp11, temp12, temp13, temp14, temp15 : std_logic_vector(31 downto 0);
	signal round_00, round_01, round_02, round_03, round_04, round_05, round_06, round_07, round_08, round_09 : ARRAY_4X4_WORDSIZE;
	signal add_out00, add_out01, add_out02, add_out03, add_out04, add_out05, add_out06, add_out07, add_out08, add_out09, add_out10, add_out11, add_out12, add_out13, add_out14, add_out15 : std_logic_vector(31 downto 0);

begin

	temp00 <= TEST_INPUT_03 & TEST_INPUT_02 & TEST_INPUT_01 & TEST_INPUT_00;
	temp01 <= TEST_INPUT_07 & TEST_INPUT_06 & TEST_INPUT_05 & TEST_INPUT_04;
	temp02 <= TEST_INPUT_11 & TEST_INPUT_10 & TEST_INPUT_09 & TEST_INPUT_08;
	temp03 <= TEST_INPUT_15 & TEST_INPUT_14 & TEST_INPUT_13 & TEST_INPUT_12;
	temp04 <= TEST_INPUT_19 & TEST_INPUT_18 & TEST_INPUT_17 & TEST_INPUT_16;
	temp05 <= TEST_INPUT_23 & TEST_INPUT_22 & TEST_INPUT_21 & TEST_INPUT_20;
	temp06 <= TEST_INPUT_27 & TEST_INPUT_26 & TEST_INPUT_25 & TEST_INPUT_24;
	temp07 <= TEST_INPUT_31 & TEST_INPUT_30 & TEST_INPUT_29 & TEST_INPUT_28;
	temp08 <= TEST_INPUT_35 & TEST_INPUT_34 & TEST_INPUT_33 & TEST_INPUT_32;
	temp09 <= TEST_INPUT_39 & TEST_INPUT_38 & TEST_INPUT_37 & TEST_INPUT_36;
	temp10 <= TEST_INPUT_43 & TEST_INPUT_42 & TEST_INPUT_41 & TEST_INPUT_40;
	temp11 <= TEST_INPUT_47 & TEST_INPUT_46 & TEST_INPUT_45 & TEST_INPUT_44;
	temp12 <= TEST_INPUT_51 & TEST_INPUT_50 & TEST_INPUT_49 & TEST_INPUT_48;
	temp13 <= TEST_INPUT_55 & TEST_INPUT_54 & TEST_INPUT_53 & TEST_INPUT_52;
	temp14 <= TEST_INPUT_59 & TEST_INPUT_58 & TEST_INPUT_57 & TEST_INPUT_56;
	temp15 <= TEST_INPUT_63 & TEST_INPUT_62 & TEST_INPUT_61 & TEST_INPUT_60;
	
	round_00 <= DoubleRound(temp00, temp01, temp02, temp03, temp04, temp05, temp06, temp07, temp08, temp09, temp10, temp11, temp12, temp13, temp14, temp15);
	round_01 <= DoubleRound(round_00(0,0), round_00(0,1), round_00(0,2), round_00(0,3), round_00(1,0), round_00(1,1), round_00(1,2), round_00(1,3), round_00(2,0), round_00(2,1), round_00(2,2), round_00(2,3), round_00(3,0), round_00(3,1), round_00(3,2), round_00(3,3));
	round_02 <= DoubleRound(round_01(0,0), round_01(0,1), round_01(0,2), round_01(0,3), round_01(1,0), round_01(1,1), round_01(1,2), round_01(1,3), round_01(2,0), round_01(2,1), round_01(2,2), round_01(2,3), round_01(3,0), round_01(3,1), round_01(3,2), round_01(3,3));
	round_03 <= DoubleRound(round_02(0,0), round_02(0,1), round_02(0,2), round_02(0,3), round_02(1,0), round_02(1,1), round_02(1,2), round_02(1,3), round_02(2,0), round_02(2,1), round_02(2,2), round_02(2,3), round_02(3,0), round_02(3,1), round_02(3,2), round_02(3,3));
	round_04 <= DoubleRound(round_03(0,0), round_03(0,1), round_03(0,2), round_03(0,3), round_03(1,0), round_03(1,1), round_03(1,2), round_03(1,3), round_03(2,0), round_03(2,1), round_03(2,2), round_03(2,3), round_03(3,0), round_03(3,1), round_03(3,2), round_03(3,3));
	round_05 <= DoubleRound(round_04(0,0), round_04(0,1), round_04(0,2), round_04(0,3), round_04(1,0), round_04(1,1), round_04(1,2), round_04(1,3), round_04(2,0), round_04(2,1), round_04(2,2), round_04(2,3), round_04(3,0), round_04(3,1), round_04(3,2), round_04(3,3));
	round_06 <= DoubleRound(round_05(0,0), round_05(0,1), round_05(0,2), round_05(0,3), round_05(1,0), round_05(1,1), round_05(1,2), round_05(1,3), round_05(2,0), round_05(2,1), round_05(2,2), round_05(2,3), round_05(3,0), round_05(3,1), round_05(3,2), round_05(3,3));
	round_07 <= DoubleRound(round_06(0,0), round_06(0,1), round_06(0,2), round_06(0,3), round_06(1,0), round_06(1,1), round_06(1,2), round_06(1,3), round_06(2,0), round_06(2,1), round_06(2,2), round_06(2,3), round_06(3,0), round_06(3,1), round_06(3,2), round_06(3,3));
	round_08 <= DoubleRound(round_07(0,0), round_07(0,1), round_07(0,2), round_07(0,3), round_07(1,0), round_07(1,1), round_07(1,2), round_07(1,3), round_07(2,0), round_07(2,1), round_07(2,2), round_07(2,3), round_07(3,0), round_07(3,1), round_07(3,2), round_07(3,3));
	round_09 <= DoubleRound(round_08(0,0), round_08(0,1), round_08(0,2), round_08(0,3), round_08(1,0), round_08(1,1), round_08(1,2), round_08(1,3), round_08(2,0), round_08(2,1), round_08(2,2), round_08(2,3), round_08(3,0), round_08(3,1), round_08(3,2), round_08(3,3));
	
	add_out00 <= std_logic_vector(unsigned(temp00) + unsigned(round_09(0,0)));
	add_out01 <= std_logic_vector(unsigned(temp01) + unsigned(round_09(0,1)));
	add_out02 <= std_logic_vector(unsigned(temp02) + unsigned(round_09(0,2)));
	add_out03 <= std_logic_vector(unsigned(temp03) + unsigned(round_09(0,3)));
	add_out04 <= std_logic_vector(unsigned(temp04) + unsigned(round_09(1,0)));
	add_out05 <= std_logic_vector(unsigned(temp05) + unsigned(round_09(1,1)));
	add_out06 <= std_logic_vector(unsigned(temp06) + unsigned(round_09(1,2)));
	add_out07 <= std_logic_vector(unsigned(temp07) + unsigned(round_09(1,3)));
	add_out08 <= std_logic_vector(unsigned(temp08) + unsigned(round_09(2,0)));
	add_out09 <= std_logic_vector(unsigned(temp09) + unsigned(round_09(2,1)));
	add_out10 <= std_logic_vector(unsigned(temp10) + unsigned(round_09(2,2)));
	add_out11 <= std_logic_vector(unsigned(temp11) + unsigned(round_09(2,3)));
	add_out12 <= std_logic_vector(unsigned(temp12) + unsigned(round_09(3,0)));
	add_out13 <= std_logic_vector(unsigned(temp13) + unsigned(round_09(3,1)));
	add_out14 <= std_logic_vector(unsigned(temp14) + unsigned(round_09(3,2)));
	add_out15 <= std_logic_vector(unsigned(temp15) + unsigned(round_09(3,3)));

	TEST_OUTPUT_00 <= add_out00(7 downto 0); 
	TEST_OUTPUT_01 <= add_out00(15 downto 8);  
	TEST_OUTPUT_02 <= add_out00(23 downto 16);  
	TEST_OUTPUT_03 <= add_out00(31 downto 24);  
	TEST_OUTPUT_04 <= add_out01(7 downto 0);
	TEST_OUTPUT_05 <= add_out01(15 downto 8);
	TEST_OUTPUT_06 <= add_out01(23 downto 16);
	TEST_OUTPUT_07 <= add_out01(31 downto 24);
	TEST_OUTPUT_08 <= add_out02(7 downto 0);
	TEST_OUTPUT_09 <= add_out02(15 downto 8);
	TEST_OUTPUT_10 <= add_out02(23 downto 16);
	TEST_OUTPUT_11 <= add_out02(31 downto 24);
	TEST_OUTPUT_12 <= add_out03(7 downto 0);
	TEST_OUTPUT_13 <= add_out03(15 downto 8);
	TEST_OUTPUT_14 <= add_out03(23 downto 16);
	TEST_OUTPUT_15 <= add_out03(31 downto 24);
	TEST_OUTPUT_16 <= add_out04(7 downto 0);
	TEST_OUTPUT_17 <= add_out04(15 downto 8);
	TEST_OUTPUT_18 <= add_out04(23 downto 16);
	TEST_OUTPUT_19 <= add_out04(31 downto 24);
	TEST_OUTPUT_20 <= add_out05(7 downto 0);
	TEST_OUTPUT_21 <= add_out05(15 downto 8);
	TEST_OUTPUT_22 <= add_out05(23 downto 16);
	TEST_OUTPUT_23 <= add_out05(31 downto 24);
	TEST_OUTPUT_24 <= add_out06(7 downto 0);
	TEST_OUTPUT_25 <= add_out06(15 downto 8);
	TEST_OUTPUT_26 <= add_out06(23 downto 16);
	TEST_OUTPUT_27 <= add_out06(31 downto 24);
	TEST_OUTPUT_28 <= add_out07(7 downto 0);
	TEST_OUTPUT_29 <= add_out07(15 downto 8);
	TEST_OUTPUT_30 <= add_out07(23 downto 16);
	TEST_OUTPUT_31 <= add_out07(31 downto 24);
	TEST_OUTPUT_32 <= add_out08(7 downto 0);
	TEST_OUTPUT_33 <= add_out08(15 downto 8);
	TEST_OUTPUT_34 <= add_out08(23 downto 16);
	TEST_OUTPUT_35 <= add_out08(31 downto 24);
	TEST_OUTPUT_36 <= add_out09(7 downto 0);
	TEST_OUTPUT_37 <= add_out09(15 downto 8);
	TEST_OUTPUT_38 <= add_out09(23 downto 16);
	TEST_OUTPUT_39 <= add_out09(31 downto 24);
	TEST_OUTPUT_40 <= add_out10(7 downto 0);
	TEST_OUTPUT_41 <= add_out10(15 downto 8);
	TEST_OUTPUT_42 <= add_out10(23 downto 16);
	TEST_OUTPUT_43 <= add_out10(31 downto 24);
	TEST_OUTPUT_44 <= add_out11(7 downto 0);
	TEST_OUTPUT_45 <= add_out11(15 downto 8);
	TEST_OUTPUT_46 <= add_out11(23 downto 16);
	TEST_OUTPUT_47 <= add_out11(31 downto 24);
	TEST_OUTPUT_48 <= add_out12(7 downto 0);
	TEST_OUTPUT_49 <= add_out12(15 downto 8);
	TEST_OUTPUT_50 <= add_out12(23 downto 16);
	TEST_OUTPUT_51 <= add_out12(31 downto 24);
	TEST_OUTPUT_52 <= add_out13(7 downto 0);
	TEST_OUTPUT_53 <= add_out13(15 downto 8);
	TEST_OUTPUT_54 <= add_out13(23 downto 16);
	TEST_OUTPUT_55 <= add_out13(31 downto 24);
	TEST_OUTPUT_56 <= add_out14(7 downto 0);
	TEST_OUTPUT_57 <= add_out14(15 downto 8);
	TEST_OUTPUT_58 <= add_out14(23 downto 16);
	TEST_OUTPUT_59 <= add_out14(31 downto 24);
	TEST_OUTPUT_60 <= add_out15(7 downto 0);
	TEST_OUTPUT_61 <= add_out15(15 downto 8);
	TEST_OUTPUT_62 <= add_out15(23 downto 16);
	TEST_OUTPUT_63 <= add_out15(31 downto 24);
end Behavioral;




