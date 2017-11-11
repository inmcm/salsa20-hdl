LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.SALSA20_FUNCTIONS.all;
 
ENTITY SALSA20_TESTS_TB IS
END SALSA20_TESTS_TB;
 
ARCHITECTURE Behavioral OF SALSA20_TESTS_TB IS 
 
-- Component Declaration for the Unit Under Test (UUT) 
COMPONENT SALSA20_CIPHER_QUARTERROUND
    Port (FUNCTION_INPUT_0 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_1 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
	      FUNCTION_INPUT_2 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_INPUT_3 : in  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_0 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
		  FUNCTION_OUTPUT_1 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
	      FUNCTION_OUTPUT_2 : out  std_logic_vector (WORD_SIZE - 1 downto 0);
	      FUNCTION_OUTPUT_3 : out  std_logic_vector (WORD_SIZE - 1 downto 0));
    END COMPONENT;

COMPONENT SALSA20_CIPHER_ROWROUND
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
    END COMPONENT;


COMPONENT SALSA20_CIPHER_COLUMNROUND
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
    END COMPONENT;


COMPONENT SALSA20_CIPHER_DOUBLEROUND
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
    END COMPONENT;

COMPONENT SALSA20_HASH_FUNCTION
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
    END COMPONENT;

    signal hash_input_00 : std_logic_vector(7 downto 0);
    signal hash_input_01 : std_logic_vector(7 downto 0);
    signal hash_input_02 : std_logic_vector(7 downto 0);
    signal hash_input_03 : std_logic_vector(7 downto 0);
    signal hash_input_04 : std_logic_vector(7 downto 0);
    signal hash_input_05 : std_logic_vector(7 downto 0);
    signal hash_input_06 : std_logic_vector(7 downto 0);
    signal hash_input_07 : std_logic_vector(7 downto 0);
    signal hash_input_08 : std_logic_vector(7 downto 0);
    signal hash_input_09 : std_logic_vector(7 downto 0);
    signal hash_input_10 : std_logic_vector(7 downto 0);
    signal hash_input_11 : std_logic_vector(7 downto 0);
    signal hash_input_12 : std_logic_vector(7 downto 0);
    signal hash_input_13 : std_logic_vector(7 downto 0);
    signal hash_input_14 : std_logic_vector(7 downto 0);
    signal hash_input_15 : std_logic_vector(7 downto 0);
    signal hash_input_16 : std_logic_vector(7 downto 0);
    signal hash_input_17 : std_logic_vector(7 downto 0);
    signal hash_input_18 : std_logic_vector(7 downto 0);
    signal hash_input_19 : std_logic_vector(7 downto 0);
    signal hash_input_20 : std_logic_vector(7 downto 0);
    signal hash_input_21 : std_logic_vector(7 downto 0);
    signal hash_input_22 : std_logic_vector(7 downto 0);
    signal hash_input_23 : std_logic_vector(7 downto 0);
    signal hash_input_24 : std_logic_vector(7 downto 0);
    signal hash_input_25 : std_logic_vector(7 downto 0);
    signal hash_input_26 : std_logic_vector(7 downto 0);
    signal hash_input_27 : std_logic_vector(7 downto 0);
    signal hash_input_28 : std_logic_vector(7 downto 0);
    signal hash_input_29 : std_logic_vector(7 downto 0);
    signal hash_input_30 : std_logic_vector(7 downto 0);
    signal hash_input_31 : std_logic_vector(7 downto 0);
    signal hash_input_32 : std_logic_vector(7 downto 0);
    signal hash_input_33 : std_logic_vector(7 downto 0);
    signal hash_input_34 : std_logic_vector(7 downto 0);
    signal hash_input_35 : std_logic_vector(7 downto 0);
    signal hash_input_36 : std_logic_vector(7 downto 0);
    signal hash_input_37 : std_logic_vector(7 downto 0);
    signal hash_input_38 : std_logic_vector(7 downto 0);
    signal hash_input_39 : std_logic_vector(7 downto 0);
    signal hash_input_40 : std_logic_vector(7 downto 0);
    signal hash_input_41 : std_logic_vector(7 downto 0);
    signal hash_input_42 : std_logic_vector(7 downto 0);
    signal hash_input_43 : std_logic_vector(7 downto 0);
    signal hash_input_44 : std_logic_vector(7 downto 0);
    signal hash_input_45 : std_logic_vector(7 downto 0);
    signal hash_input_46 : std_logic_vector(7 downto 0);
    signal hash_input_47 : std_logic_vector(7 downto 0);
    signal hash_input_48 : std_logic_vector(7 downto 0);
    signal hash_input_49 : std_logic_vector(7 downto 0);
    signal hash_input_50 : std_logic_vector(7 downto 0);
    signal hash_input_51 : std_logic_vector(7 downto 0);
    signal hash_input_52 : std_logic_vector(7 downto 0);
    signal hash_input_53 : std_logic_vector(7 downto 0);
    signal hash_input_54 : std_logic_vector(7 downto 0);
    signal hash_input_55 : std_logic_vector(7 downto 0);
    signal hash_input_56 : std_logic_vector(7 downto 0);
    signal hash_input_57 : std_logic_vector(7 downto 0);
    signal hash_input_58 : std_logic_vector(7 downto 0);
    signal hash_input_59 : std_logic_vector(7 downto 0);
    signal hash_input_60 : std_logic_vector(7 downto 0);
    signal hash_input_61 : std_logic_vector(7 downto 0);
    signal hash_input_62 : std_logic_vector(7 downto 0);
    signal hash_input_63 : std_logic_vector(7 downto 0);
    signal hash_output_00 : std_logic_vector(7 downto 0);
    signal hash_output_01 : std_logic_vector(7 downto 0);
    signal hash_output_02 : std_logic_vector(7 downto 0);
    signal hash_output_03 : std_logic_vector(7 downto 0);
    signal hash_output_04 : std_logic_vector(7 downto 0);
    signal hash_output_05 : std_logic_vector(7 downto 0);
    signal hash_output_06 : std_logic_vector(7 downto 0);
    signal hash_output_07 : std_logic_vector(7 downto 0);
    signal hash_output_08 : std_logic_vector(7 downto 0);
    signal hash_output_09 : std_logic_vector(7 downto 0);
    signal hash_output_10 : std_logic_vector(7 downto 0);
    signal hash_output_11 : std_logic_vector(7 downto 0);
    signal hash_output_12 : std_logic_vector(7 downto 0);
    signal hash_output_13 : std_logic_vector(7 downto 0);
    signal hash_output_14 : std_logic_vector(7 downto 0);
    signal hash_output_15 : std_logic_vector(7 downto 0);
    signal hash_output_16 : std_logic_vector(7 downto 0);
    signal hash_output_17 : std_logic_vector(7 downto 0);
    signal hash_output_18 : std_logic_vector(7 downto 0);
    signal hash_output_19 : std_logic_vector(7 downto 0);
    signal hash_output_20 : std_logic_vector(7 downto 0);
    signal hash_output_21 : std_logic_vector(7 downto 0);
    signal hash_output_22 : std_logic_vector(7 downto 0);
    signal hash_output_23 : std_logic_vector(7 downto 0);
    signal hash_output_24 : std_logic_vector(7 downto 0);
    signal hash_output_25 : std_logic_vector(7 downto 0);
    signal hash_output_26 : std_logic_vector(7 downto 0);
    signal hash_output_27 : std_logic_vector(7 downto 0);
    signal hash_output_28 : std_logic_vector(7 downto 0);
    signal hash_output_29 : std_logic_vector(7 downto 0);
    signal hash_output_30 : std_logic_vector(7 downto 0);
    signal hash_output_31 : std_logic_vector(7 downto 0);
    signal hash_output_32 : std_logic_vector(7 downto 0);
    signal hash_output_33 : std_logic_vector(7 downto 0);
    signal hash_output_34 : std_logic_vector(7 downto 0);
    signal hash_output_35 : std_logic_vector(7 downto 0);
    signal hash_output_36 : std_logic_vector(7 downto 0);
    signal hash_output_37 : std_logic_vector(7 downto 0);
    signal hash_output_38 : std_logic_vector(7 downto 0);
    signal hash_output_39 : std_logic_vector(7 downto 0);
    signal hash_output_40 : std_logic_vector(7 downto 0);
    signal hash_output_41 : std_logic_vector(7 downto 0);
    signal hash_output_42 : std_logic_vector(7 downto 0);
    signal hash_output_43 : std_logic_vector(7 downto 0);
    signal hash_output_44 : std_logic_vector(7 downto 0);
    signal hash_output_45 : std_logic_vector(7 downto 0);
    signal hash_output_46 : std_logic_vector(7 downto 0);
    signal hash_output_47 : std_logic_vector(7 downto 0);
    signal hash_output_48 : std_logic_vector(7 downto 0);
    signal hash_output_49 : std_logic_vector(7 downto 0);
    signal hash_output_50 : std_logic_vector(7 downto 0);
    signal hash_output_51 : std_logic_vector(7 downto 0);
    signal hash_output_52 : std_logic_vector(7 downto 0);
    signal hash_output_53 : std_logic_vector(7 downto 0);
    signal hash_output_54 : std_logic_vector(7 downto 0);
    signal hash_output_55 : std_logic_vector(7 downto 0);
    signal hash_output_56 : std_logic_vector(7 downto 0);
    signal hash_output_57 : std_logic_vector(7 downto 0);
    signal hash_output_58 : std_logic_vector(7 downto 0);
    signal hash_output_59 : std_logic_vector(7 downto 0);
    signal hash_output_60 : std_logic_vector(7 downto 0);
    signal hash_output_61 : std_logic_vector(7 downto 0);
    signal hash_output_62 : std_logic_vector(7 downto 0);
    signal hash_output_63 : std_logic_vector(7 downto 0);

    signal function_input_0 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal function_input_1 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal function_input_2 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal function_input_3 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal function_output_0 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal function_output_1 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal function_output_2 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal function_output_3  : std_logic_vector(WORD_SIZE -1 downto 0);

    signal rr_function_input_00 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_01 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_02 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_03 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_04 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_05 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_06 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_07 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_08 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_09 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_10 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_11 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_12 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_13 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_14 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_input_15 : std_logic_vector(WORD_SIZE -1 downto 0);

    signal rr_function_output_00 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_01 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_02 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_03 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_04 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_05 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_06 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_07 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_08 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_09 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_10 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_11 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_12 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_13 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_14 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal rr_function_output_15 : std_logic_vector(WORD_SIZE -1 downto 0);


    signal cr_function_input_00 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_01 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_02 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_03 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_04 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_05 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_06 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_07 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_08 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_09 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_10 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_11 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_12 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_13 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_14 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_input_15 : std_logic_vector(WORD_SIZE -1 downto 0);

    signal cr_function_output_00 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_01 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_02 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_03 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_04 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_05 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_06 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_07 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_08 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_09 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_10 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_11 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_12 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_13 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_14 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal cr_function_output_15 : std_logic_vector(WORD_SIZE -1 downto 0);


    signal dr_function_input_00 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_01 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_02 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_03 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_04 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_05 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_06 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_07 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_08 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_09 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_10 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_11 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_12 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_13 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_14 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_input_15 : std_logic_vector(WORD_SIZE -1 downto 0);

    signal dr_function_output_00 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_01 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_02 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_03 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_04 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_05 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_06 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_07 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_08 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_09 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_10 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_11 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_12 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_13 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_14 : std_logic_vector(WORD_SIZE -1 downto 0);
    signal dr_function_output_15 : std_logic_vector(WORD_SIZE -1 downto 0);


BEGIN
  
-- Instantiate the Unit Under Test (UUT)
uut_1: SALSA20_CIPHER_QUARTERROUND
    PORT MAP (
        FUNCTION_INPUT_0 => function_input_0,
        FUNCTION_INPUT_1 => function_input_1,
        FUNCTION_INPUT_2 => function_input_2,
        FUNCTION_INPUT_3 => function_input_3,
        FUNCTION_OUTPUT_0 => function_output_0,
        FUNCTION_OUTPUT_1 => function_output_1,
        FUNCTION_OUTPUT_2 => function_output_2,
        FUNCTION_OUTPUT_3 => function_output_3
    );

uut_2: SALSA20_CIPHER_ROWROUND
    PORT MAP (
        FUNCTION_INPUT_00 => rr_function_input_00,
        FUNCTION_INPUT_01 => rr_function_input_01,
        FUNCTION_INPUT_02 => rr_function_input_02,
        FUNCTION_INPUT_03 => rr_function_input_03,
        FUNCTION_INPUT_04 => rr_function_input_04,
        FUNCTION_INPUT_05 => rr_function_input_05,
        FUNCTION_INPUT_06 => rr_function_input_06,
        FUNCTION_INPUT_07 => rr_function_input_07,
        FUNCTION_INPUT_08 => rr_function_input_08,
        FUNCTION_INPUT_09 => rr_function_input_09,
        FUNCTION_INPUT_10 => rr_function_input_10,
        FUNCTION_INPUT_11 => rr_function_input_11,
        FUNCTION_INPUT_12 => rr_function_input_12,
        FUNCTION_INPUT_13 => rr_function_input_13,
        FUNCTION_INPUT_14 => rr_function_input_14,
        FUNCTION_INPUT_15 => rr_function_input_15,
        FUNCTION_OUTPUT_00 => rr_function_output_00,
        FUNCTION_OUTPUT_01 => rr_function_output_01,
        FUNCTION_OUTPUT_02 => rr_function_output_02,
        FUNCTION_OUTPUT_03 => rr_function_output_03,
        FUNCTION_OUTPUT_04 => rr_function_output_04,
        FUNCTION_OUTPUT_05 => rr_function_output_05,
        FUNCTION_OUTPUT_06 => rr_function_output_06,
        FUNCTION_OUTPUT_07 => rr_function_output_07,
        FUNCTION_OUTPUT_08 => rr_function_output_08,
        FUNCTION_OUTPUT_09 => rr_function_output_09,
        FUNCTION_OUTPUT_10 => rr_function_output_10,
        FUNCTION_OUTPUT_11 => rr_function_output_11,
        FUNCTION_OUTPUT_12 => rr_function_output_12,
        FUNCTION_OUTPUT_13 => rr_function_output_13,
        FUNCTION_OUTPUT_14 => rr_function_output_14,
        FUNCTION_OUTPUT_15 => rr_function_output_15
    );


uut_3: SALSA20_CIPHER_COLUMNROUND
    PORT MAP (
        FUNCTION_INPUT_00 => cr_function_input_00,
        FUNCTION_INPUT_01 => cr_function_input_01,
        FUNCTION_INPUT_02 => cr_function_input_02,
        FUNCTION_INPUT_03 => cr_function_input_03,
        FUNCTION_INPUT_04 => cr_function_input_04,
        FUNCTION_INPUT_05 => cr_function_input_05,
        FUNCTION_INPUT_06 => cr_function_input_06,
        FUNCTION_INPUT_07 => cr_function_input_07,
        FUNCTION_INPUT_08 => cr_function_input_08,
        FUNCTION_INPUT_09 => cr_function_input_09,
        FUNCTION_INPUT_10 => cr_function_input_10,
        FUNCTION_INPUT_11 => cr_function_input_11,
        FUNCTION_INPUT_12 => cr_function_input_12,
        FUNCTION_INPUT_13 => cr_function_input_13,
        FUNCTION_INPUT_14 => cr_function_input_14,
        FUNCTION_INPUT_15 => cr_function_input_15,
        FUNCTION_OUTPUT_00 => cr_function_output_00,
        FUNCTION_OUTPUT_01 => cr_function_output_01,
        FUNCTION_OUTPUT_02 => cr_function_output_02,
        FUNCTION_OUTPUT_03 => cr_function_output_03,
        FUNCTION_OUTPUT_04 => cr_function_output_04,
        FUNCTION_OUTPUT_05 => cr_function_output_05,
        FUNCTION_OUTPUT_06 => cr_function_output_06,
        FUNCTION_OUTPUT_07 => cr_function_output_07,
        FUNCTION_OUTPUT_08 => cr_function_output_08,
        FUNCTION_OUTPUT_09 => cr_function_output_09,
        FUNCTION_OUTPUT_10 => cr_function_output_10,
        FUNCTION_OUTPUT_11 => cr_function_output_11,
        FUNCTION_OUTPUT_12 => cr_function_output_12,
        FUNCTION_OUTPUT_13 => cr_function_output_13,
        FUNCTION_OUTPUT_14 => cr_function_output_14,
        FUNCTION_OUTPUT_15 => cr_function_output_15
    );


uut_4: SALSA20_CIPHER_DOUBLEROUND
    PORT MAP (
        FUNCTION_INPUT_00 => dr_function_input_00,
        FUNCTION_INPUT_01 => dr_function_input_01,
        FUNCTION_INPUT_02 => dr_function_input_02,
        FUNCTION_INPUT_03 => dr_function_input_03,
        FUNCTION_INPUT_04 => dr_function_input_04,
        FUNCTION_INPUT_05 => dr_function_input_05,
        FUNCTION_INPUT_06 => dr_function_input_06,
        FUNCTION_INPUT_07 => dr_function_input_07,
        FUNCTION_INPUT_08 => dr_function_input_08,
        FUNCTION_INPUT_09 => dr_function_input_09,
        FUNCTION_INPUT_10 => dr_function_input_10,
        FUNCTION_INPUT_11 => dr_function_input_11,
        FUNCTION_INPUT_12 => dr_function_input_12,
        FUNCTION_INPUT_13 => dr_function_input_13,
        FUNCTION_INPUT_14 => dr_function_input_14,
        FUNCTION_INPUT_15 => dr_function_input_15,
        FUNCTION_OUTPUT_00 => dr_function_output_00,
        FUNCTION_OUTPUT_01 => dr_function_output_01,
        FUNCTION_OUTPUT_02 => dr_function_output_02,
        FUNCTION_OUTPUT_03 => dr_function_output_03,
        FUNCTION_OUTPUT_04 => dr_function_output_04,
        FUNCTION_OUTPUT_05 => dr_function_output_05,
        FUNCTION_OUTPUT_06 => dr_function_output_06,
        FUNCTION_OUTPUT_07 => dr_function_output_07,
        FUNCTION_OUTPUT_08 => dr_function_output_08,
        FUNCTION_OUTPUT_09 => dr_function_output_09,
        FUNCTION_OUTPUT_10 => dr_function_output_10,
        FUNCTION_OUTPUT_11 => dr_function_output_11,
        FUNCTION_OUTPUT_12 => dr_function_output_12,
        FUNCTION_OUTPUT_13 => dr_function_output_13,
        FUNCTION_OUTPUT_14 => dr_function_output_14,
        FUNCTION_OUTPUT_15 => dr_function_output_15
    );
uut_5 : SALSA20_HASH_FUNCTION
    PORT MAP(TEST_INPUT_00 => hash_input_00,
             TEST_INPUT_01 => hash_input_01,
             TEST_INPUT_02 => hash_input_02,
             TEST_INPUT_03 => hash_input_03,
             TEST_INPUT_04 => hash_input_04,
             TEST_INPUT_05 => hash_input_05,
             TEST_INPUT_06 => hash_input_06,
             TEST_INPUT_07 => hash_input_07,
             TEST_INPUT_08 => hash_input_08,
             TEST_INPUT_09 => hash_input_09,
             TEST_INPUT_10 => hash_input_10,
             TEST_INPUT_11 => hash_input_11,
             TEST_INPUT_12 => hash_input_12,
             TEST_INPUT_13 => hash_input_13,
             TEST_INPUT_14 => hash_input_14,
             TEST_INPUT_15 => hash_input_15,
             TEST_INPUT_16 => hash_input_16,
             TEST_INPUT_17 => hash_input_17,
             TEST_INPUT_18 => hash_input_18,
             TEST_INPUT_19 => hash_input_19,
             TEST_INPUT_20 => hash_input_20,
             TEST_INPUT_21 => hash_input_21,
             TEST_INPUT_22 => hash_input_22,
             TEST_INPUT_23 => hash_input_23,
             TEST_INPUT_24 => hash_input_24,
             TEST_INPUT_25 => hash_input_25,
             TEST_INPUT_26 => hash_input_26,
             TEST_INPUT_27 => hash_input_27,
             TEST_INPUT_28 => hash_input_28,
             TEST_INPUT_29 => hash_input_29,
             TEST_INPUT_30 => hash_input_30,
             TEST_INPUT_31 => hash_input_31,
             TEST_INPUT_32 => hash_input_32,
             TEST_INPUT_33 => hash_input_33,
             TEST_INPUT_34 => hash_input_34,
             TEST_INPUT_35 => hash_input_35,
             TEST_INPUT_36 => hash_input_36,
             TEST_INPUT_37 => hash_input_37,
             TEST_INPUT_38 => hash_input_38,
             TEST_INPUT_39 => hash_input_39,
             TEST_INPUT_40 => hash_input_40,
             TEST_INPUT_41 => hash_input_41,
             TEST_INPUT_42 => hash_input_42,
             TEST_INPUT_43 => hash_input_43,
             TEST_INPUT_44 => hash_input_44,
             TEST_INPUT_45 => hash_input_45,
             TEST_INPUT_46 => hash_input_46,
             TEST_INPUT_47 => hash_input_47,
             TEST_INPUT_48 => hash_input_48,
             TEST_INPUT_49 => hash_input_49,
             TEST_INPUT_50 => hash_input_50,
             TEST_INPUT_51 => hash_input_51,
             TEST_INPUT_52 => hash_input_52,
             TEST_INPUT_53 => hash_input_53,
             TEST_INPUT_54 => hash_input_54,
             TEST_INPUT_55 => hash_input_55,
             TEST_INPUT_56 => hash_input_56,
             TEST_INPUT_57 => hash_input_57,
             TEST_INPUT_58 => hash_input_58,
             TEST_INPUT_59 => hash_input_59,
             TEST_INPUT_60 => hash_input_60,
             TEST_INPUT_61 => hash_input_61,
             TEST_INPUT_62 => hash_input_62,
             TEST_INPUT_63 => hash_input_63,
             TEST_OUTPUT_00 => hash_output_00,
             TEST_OUTPUT_01 => hash_output_01,
             TEST_OUTPUT_02 => hash_output_02,
             TEST_OUTPUT_03 => hash_output_03,
             TEST_OUTPUT_04 => hash_output_04,
             TEST_OUTPUT_05 => hash_output_05,
             TEST_OUTPUT_06 => hash_output_06,
             TEST_OUTPUT_07 => hash_output_07,
             TEST_OUTPUT_08 => hash_output_08,
             TEST_OUTPUT_09 => hash_output_09,
             TEST_OUTPUT_10 => hash_output_10,
             TEST_OUTPUT_11 => hash_output_11,
             TEST_OUTPUT_12 => hash_output_12,
             TEST_OUTPUT_13 => hash_output_13,
             TEST_OUTPUT_14 => hash_output_14,
             TEST_OUTPUT_15 => hash_output_15,
             TEST_OUTPUT_16 => hash_output_16,
             TEST_OUTPUT_17 => hash_output_17,
             TEST_OUTPUT_18 => hash_output_18,
             TEST_OUTPUT_19 => hash_output_19,
             TEST_OUTPUT_20 => hash_output_20,
             TEST_OUTPUT_21 => hash_output_21,
             TEST_OUTPUT_22 => hash_output_22,
             TEST_OUTPUT_23 => hash_output_23,
             TEST_OUTPUT_24 => hash_output_24,
             TEST_OUTPUT_25 => hash_output_25,
             TEST_OUTPUT_26 => hash_output_26,
             TEST_OUTPUT_27 => hash_output_27,
             TEST_OUTPUT_28 => hash_output_28,
             TEST_OUTPUT_29 => hash_output_29,
             TEST_OUTPUT_30 => hash_output_30,
             TEST_OUTPUT_31 => hash_output_31,
             TEST_OUTPUT_32 => hash_output_32,
             TEST_OUTPUT_33 => hash_output_33,
             TEST_OUTPUT_34 => hash_output_34,
             TEST_OUTPUT_35 => hash_output_35,
             TEST_OUTPUT_36 => hash_output_36,
             TEST_OUTPUT_37 => hash_output_37,
             TEST_OUTPUT_38 => hash_output_38,
             TEST_OUTPUT_39 => hash_output_39,
             TEST_OUTPUT_40 => hash_output_40,
             TEST_OUTPUT_41 => hash_output_41,
             TEST_OUTPUT_42 => hash_output_42,
             TEST_OUTPUT_43 => hash_output_43,
             TEST_OUTPUT_44 => hash_output_44,
             TEST_OUTPUT_45 => hash_output_45,
             TEST_OUTPUT_46 => hash_output_46,
             TEST_OUTPUT_47 => hash_output_47,
             TEST_OUTPUT_48 => hash_output_48,
             TEST_OUTPUT_49 => hash_output_49,
             TEST_OUTPUT_50 => hash_output_50,
             TEST_OUTPUT_51 => hash_output_51,
             TEST_OUTPUT_52 => hash_output_52,
             TEST_OUTPUT_53 => hash_output_53,
             TEST_OUTPUT_54 => hash_output_54,
             TEST_OUTPUT_55 => hash_output_55,
             TEST_OUTPUT_56 => hash_output_56,
             TEST_OUTPUT_57 => hash_output_57,
             TEST_OUTPUT_58 => hash_output_58,
             TEST_OUTPUT_59 => hash_output_59,
             TEST_OUTPUT_60 => hash_output_60,
             TEST_OUTPUT_61 => hash_output_61,
             TEST_OUTPUT_62 => hash_output_62,
             TEST_OUTPUT_63 => hash_output_63);
   
-- Stimulus process
StimulusProcess: process
begin		
    rr_function_input_00 <= X"00000000";
    rr_function_input_01 <= X"00000000";
    rr_function_input_02 <= X"00000000";
    rr_function_input_03 <= X"00000000";
    rr_function_input_04 <= X"00000000";
    rr_function_input_05 <= X"00000000";
    rr_function_input_06 <= X"00000000";
    rr_function_input_07 <= X"00000000";
    rr_function_input_08 <= X"00000000";
    rr_function_input_09 <= X"00000000";
    rr_function_input_10 <= X"00000000";
    rr_function_input_11 <= X"00000000";
    rr_function_input_12 <= X"00000000";
    rr_function_input_13 <= X"00000000";
    rr_function_input_14 <= X"00000000";
    rr_function_input_15 <= X"00000000";

    cr_function_input_00 <= X"00000000";
    cr_function_input_01 <= X"00000000";
    cr_function_input_02 <= X"00000000";
    cr_function_input_03 <= X"00000000";
    cr_function_input_04 <= X"00000000";
    cr_function_input_05 <= X"00000000";
    cr_function_input_06 <= X"00000000";
    cr_function_input_07 <= X"00000000";
    cr_function_input_08 <= X"00000000";
    cr_function_input_09 <= X"00000000";
    cr_function_input_10 <= X"00000000";
    cr_function_input_11 <= X"00000000";
    cr_function_input_12 <= X"00000000";
    cr_function_input_13 <= X"00000000";
    cr_function_input_14 <= X"00000000";
    cr_function_input_15 <= X"00000000";

    dr_function_input_00 <= X"00000000";
    dr_function_input_01 <= X"00000000";
    dr_function_input_02 <= X"00000000";
    dr_function_input_03 <= X"00000000";
    dr_function_input_04 <= X"00000000";
    dr_function_input_05 <= X"00000000";
    dr_function_input_06 <= X"00000000";
    dr_function_input_07 <= X"00000000";
    dr_function_input_08 <= X"00000000";
    dr_function_input_09 <= X"00000000";
    dr_function_input_10 <= X"00000000";
    dr_function_input_11 <= X"00000000";
    dr_function_input_12 <= X"00000000";
    dr_function_input_13 <= X"00000000";
    dr_function_input_14 <= X"00000000";
    dr_function_input_15 <= X"00000000";

    report "QuarterRound Test 1";
	function_input_0 <= X"00000000"; 
	function_input_1 <= X"00000000"; 
	function_input_2 <= X"00000000"; 
	function_input_3 <= X"00000000";
    wait for 100 ns;			
	
    assert function_output_0 /= X"00000000"  report "QuarterRound Word 0 Success" severity note;
    assert function_output_0  = X"00000000"  report "QuarterRound Word 0 Failed" severity failure;
    assert function_output_1 /= X"00000000"  report "QuarterRound Word 1 Success" severity note;
    assert function_output_1  = X"00000000"  report "QuarterRound Word 1 Failed" severity failure;
    assert function_output_2 /= X"00000000"  report "QuarterRound Word 2 Success" severity note;
    assert function_output_2  = X"00000000"  report "QuarterRound Word 2 Failed" severity failure;
    assert function_output_3 /= X"00000000"  report "QuarterRound Word 3 Success" severity note;
    assert function_output_3  = X"00000000"  report "QuarterRound Word 3 Failed" severity failure;

    report "QuarterRound Test 2";
    wait for 100 ns;			
	function_input_0 <= X"00000001"; 
	function_input_1 <= X"00000000"; 
	function_input_2 <= X"00000000"; 
	function_input_3 <= X"00000000"; 
    wait for 100 ns;			

    assert function_output_0 /= X"08008145"  report "QuarterRound Word 0 Success" severity note;
    assert function_output_0 = X"08008145"  report "QuarterRound Word 0 Failed" severity failure;
    assert function_output_1 /= X"00000080"  report "QuarterRound Word 1 Success" severity note;
    assert function_output_1 = X"00000080"  report "QuarterRound Word 1 Failed" severity failure;
    assert function_output_2 /= X"00010200"  report "QuarterRound Word 2 Success" severity note;
    assert function_output_2 = X"00010200"  report "QuarterRound Word 2 Failed" severity failure;
    assert function_output_3 /= X"20500000"  report "QuarterRound Word 3 Success" severity note;
    assert function_output_3 = X"20500000"  report "QuarterRound Word 3 Failed" severity failure;

    report "QuarterRound Test 3";
    wait for 100 ns;			
	function_input_0 <= X"00000000"; 
	function_input_1 <= X"00000001"; 
	function_input_2 <= X"00000000"; 
	function_input_3 <= X"00000000"; 
    wait for 100 ns;			

    assert function_output_0 /= X"88000100"  report "QuarterRound Word 0 Success" severity note;
    assert function_output_0 = X"88000100"  report "QuarterRound Word 0 Failed" severity failure;
    assert function_output_1 /= X"00000001"  report "QuarterRound Word 1 Success" severity note;
    assert function_output_1 = X"00000001"  report "QuarterRound Word 1 Failed" severity failure;
    assert function_output_2 /= X"00000200"  report "QuarterRound Word 2 Success" severity note;
    assert function_output_2 = X"00000200"  report "QuarterRound Word 2 Failed" severity failure;
    assert function_output_3 /= X"00402000"  report "QuarterRound Word 3 Success" severity note;
    assert function_output_3 = X"00402000"  report "QuarterRound Word 3 Failed" severity failure;

    report "QuarterRound Test 4";
    wait for 100 ns;			
	function_input_0 <= X"00000000"; 
	function_input_1 <= X"00000000"; 
	function_input_2 <= X"00000001"; 
	function_input_3 <= X"00000000"; 
    wait for 100 ns;			

    assert function_output_0 /= X"80040000"  report "QuarterRound Word 0 Success" severity note;
    assert function_output_0 = X"80040000"  report "QuarterRound Word 0 Failed" severity failure;
    assert function_output_1 /= X"00000000"  report "QuarterRound Word 1 Success" severity note;
    assert function_output_1 = X"00000000"  report "QuarterRound Word 1 Failed" severity failure;
    assert function_output_2 /= X"00000001"  report "QuarterRound Word 2 Success" severity note;
    assert function_output_2 = X"00000001"  report "QuarterRound Word 2 Failed" severity failure;
    assert function_output_3 /= X"00002000"  report "QuarterRound Word 3 Success" severity note;
    assert function_output_3 = X"00002000"  report "QuarterRound Word 3 Failed" severity failure;


    report "QuarterRound Test 5";
    wait for 100 ns;			
	function_input_0 <= X"d3917c5b"; 
	function_input_1 <= X"55f1c407"; 
	function_input_2 <= X"52a58a7a"; 
	function_input_3 <= X"8f887a3b"; 
    wait for 100 ns;			

    assert function_output_0 /= X"3e2f308c"  report "QuarterRound Word 0 Success" severity note;
    assert function_output_0 = X"3e2f308c"  report "QuarterRound Word 0 Failed" severity failure;
    assert function_output_1 /= X"d90a8f36"  report "QuarterRound Word 1 Success" severity note;
    assert function_output_1 = X"d90a8f36"  report "QuarterRound Word 1 Failed" severity failure;
    assert function_output_2 /= X"6ab2a923"  report "QuarterRound Word 2 Success" severity note;
    assert function_output_2 = X"6ab2a923"  report "QuarterRound Word 2 Failed" severity failure;
    assert function_output_3 /= X"2883524c"  report "QuarterRound Word 3 Success" severity note;
    assert function_output_3 = X"2883524c"  report "QuarterRound Word 3 Failed" severity failure;


    report "RowRound Test 1";
    wait for 100 ns;			
	rr_function_input_00 <= X"00000001";
    rr_function_input_01 <= X"00000000";
    rr_function_input_02 <= X"00000000";
    rr_function_input_03 <= X"00000000";
    rr_function_input_04 <= X"00000001";
    rr_function_input_05 <= X"00000000";
    rr_function_input_06 <= X"00000000";
    rr_function_input_07 <= X"00000000";
    rr_function_input_08 <= X"00000001";
    rr_function_input_09 <= X"00000000";
    rr_function_input_10 <= X"00000000";
    rr_function_input_11 <= X"00000000";
    rr_function_input_12 <= X"00000001";
    rr_function_input_13 <= X"00000000";
    rr_function_input_14 <= X"00000000";
    rr_function_input_15 <= X"00000000";
    wait for 100 ns;			

     assert rr_function_output_00 /= X"08008145" report "RowRound Word 0 Success" severity note;
     assert rr_function_output_00 = X"08008145" report "RowRound Word 0 Failure" severity failure;
     assert rr_function_output_01 /= X"00000080" report "RowRound Word 1 Success" severity note;
     assert rr_function_output_01 = X"00000080" report "RowRound Word 1 Failure" severity failure;
     assert rr_function_output_02 /= X"00010200" report "RowRound Word 2 Success" severity note;
     assert rr_function_output_02 = X"00010200" report "RowRound Word 2 Failure" severity failure;
     assert rr_function_output_03 /= X"20500000" report "RowRound Word 3 Success" severity note;
     assert rr_function_output_03 = X"20500000" report "RowRound Word 3 Failure" severity failure;
     assert rr_function_output_04 /= X"20100001" report "RowRound Word 4 Success" severity note;
     assert rr_function_output_04 = X"20100001" report "RowRound Word 4 Failure" severity failure;
     assert rr_function_output_05 /= X"00048044" report "RowRound Word 5 Success" severity note;
     assert rr_function_output_05 = X"00048044" report "RowRound Word 5 Failure" severity failure;
     assert rr_function_output_06 /= X"00000080" report "RowRound Word 6 Success" severity note;
     assert rr_function_output_06 = X"00000080" report "RowRound Word 6 Failure" severity failure;
     assert rr_function_output_07 /= X"00010000" report "RowRound Word 7 Success" severity note;
     assert rr_function_output_07 = X"00010000" report "RowRound Word 7 Failure" severity failure;
     assert rr_function_output_08 /= X"00000001" report "RowRound Word 8 Success" severity note;
     assert rr_function_output_08 = X"00000001" report "RowRound Word 8 Failure" severity failure;
     assert rr_function_output_09 /= X"00002000" report "RowRound Word 9 Success" severity note;
     assert rr_function_output_09 = X"00002000" report "RowRound Word 9 Failure" severity failure;
     assert rr_function_output_10 /= X"80040000" report "RowRound Word 10 Success" severity note;
     assert rr_function_output_10 = X"80040000" report "RowRound Word 10 Failure" severity failure;
     assert rr_function_output_11 /= X"00000000" report "RowRound Word 11 Success" severity note;
     assert rr_function_output_11 = X"00000000" report "RowRound Word 11 Failure" severity failure;
     assert rr_function_output_12 /= X"00000001" report "RowRound Word 12 Success" severity note;
     assert rr_function_output_12 = X"00000001" report "RowRound Word 12 Failure" severity failure;
     assert rr_function_output_13 /= X"00000200" report "RowRound Word 13 Success" severity note;
     assert rr_function_output_13 = X"00000200" report "RowRound Word 13 Failure" severity failure;
     assert rr_function_output_14 /= X"00402000" report "RowRound Word 14 Success" severity note;
     assert rr_function_output_14 = X"00402000" report "RowRound Word 14 Failure" severity failure;
     assert rr_function_output_15 /= X"88000100" report "RowRound Word 15 Success" severity note;
     assert rr_function_output_15 = X"88000100" report "RowRound Word 15 Failure" severity failure;


    report "RowRound Test 2";
    wait for 100 ns;			
	rr_function_input_00 <= X"08521bd6";
    rr_function_input_01 <= X"1fe88837";
    rr_function_input_02 <= X"bb2aa576";
    rr_function_input_03 <= X"3aa26365";
    rr_function_input_04 <= X"c54c6a5b";
    rr_function_input_05 <= X"2fc74c2f";
    rr_function_input_06 <= X"6dd39cc3";
    rr_function_input_07 <= X"da0a64f6";
    rr_function_input_08 <= X"90a2f23d";
    rr_function_input_09 <= X"067f95a6";
    rr_function_input_10 <= X"06b35f61";
    rr_function_input_11 <= X"41e4732e";
    rr_function_input_12 <= X"e859c100";
    rr_function_input_13 <= X"ea4d84b7";
    rr_function_input_14 <= X"0f619bff";
    rr_function_input_15 <= X"bc6e965a";
    wait for 100 ns;			

     assert rr_function_output_00 /= X"a890d39d" report "RowRound Word 0 Success" severity note;
     assert rr_function_output_00 = X"a890d39d" report "RowRound Word 0 Failure" severity failure;
     assert rr_function_output_01 /= X"65d71596" report "RowRound Word 1 Success" severity note;
     assert rr_function_output_01 = X"65d71596" report "RowRound Word 1 Failure" severity failure;
     assert rr_function_output_02 /= X"e9487daa" report "RowRound Word 2 Success" severity note;
     assert rr_function_output_02 = X"e9487daa" report "RowRound Word 2 Failure" severity failure;
     assert rr_function_output_03 /= X"c8ca6a86" report "RowRound Word 3 Success" severity note;
     assert rr_function_output_03 = X"c8ca6a86" report "RowRound Word 3 Failure" severity failure;
     assert rr_function_output_04 /= X"949d2192" report "RowRound Word 4 Success" severity note;
     assert rr_function_output_04 = X"949d2192" report "RowRound Word 4 Failure" severity failure;
     assert rr_function_output_05 /= X"764b7754" report "RowRound Word 5 Success" severity note;
     assert rr_function_output_05 = X"764b7754" report "RowRound Word 5 Failure" severity failure;
     assert rr_function_output_06 /= X"e408d9b9" report "RowRound Word 6 Success" severity note;
     assert rr_function_output_06 = X"e408d9b9" report "RowRound Word 6 Failure" severity failure;
     assert rr_function_output_07 /= X"7a41b4d1" report "RowRound Word 7 Success" severity note;
     assert rr_function_output_07 = X"7a41b4d1" report "RowRound Word 7 Failure" severity failure;
     assert rr_function_output_08 /= X"3402e183" report "RowRound Word 8 Success" severity note;
     assert rr_function_output_08 = X"3402e183" report "RowRound Word 8 Failure" severity failure;
     assert rr_function_output_09 /= X"3c3af432" report "RowRound Word 9 Success" severity note;
     assert rr_function_output_09 = X"3c3af432" report "RowRound Word 9 Failure" severity failure;
     assert rr_function_output_10 /= X"50669f96" report "RowRound Word 10 Success" severity note;
     assert rr_function_output_10 = X"50669f96" report "RowRound Word 10 Failure" severity failure;
     assert rr_function_output_11 /= X"d89ef0a8" report "RowRound Word 11 Success" severity note;
     assert rr_function_output_11 = X"d89ef0a8" report "RowRound Word 11 Failure" severity failure;
     assert rr_function_output_12 /= X"0040ede5" report "RowRound Word 12 Success" severity note;
     assert rr_function_output_12 = X"0040ede5" report "RowRound Word 12 Failure" severity failure;
     assert rr_function_output_13 /= X"b545fbce" report "RowRound Word 13 Success" severity note;
     assert rr_function_output_13 = X"b545fbce" report "RowRound Word 13 Failure" severity failure;
     assert rr_function_output_14 /= X"d257ed4f" report "RowRound Word 14 Success" severity note;
     assert rr_function_output_14 = X"d257ed4f" report "RowRound Word 14 Failure" severity failure;
     assert rr_function_output_15 /= X"1818882d" report "RowRound Word 15 Success" severity note;
     assert rr_function_output_15 = X"1818882d" report "RowRound Word 15 Failure" severity failure;



    report "ColumnRound Test 1";
    wait for 100 ns;			
	cr_function_input_00 <= X"00000001";
    cr_function_input_01 <= X"00000000";
    cr_function_input_02 <= X"00000000";
    cr_function_input_03 <= X"00000000";
    cr_function_input_04 <= X"00000001";
    cr_function_input_05 <= X"00000000";
    cr_function_input_06 <= X"00000000";
    cr_function_input_07 <= X"00000000";
    cr_function_input_08 <= X"00000001";
    cr_function_input_09 <= X"00000000";
    cr_function_input_10 <= X"00000000";
    cr_function_input_11 <= X"00000000";
    cr_function_input_12 <= X"00000001";
    cr_function_input_13 <= X"00000000";
    cr_function_input_14 <= X"00000000";
    cr_function_input_15 <= X"00000000";
    wait for 100 ns;			

    assert cr_function_output_00 /= X"10090288" report "ColumnRound Word 0 Success" severity note;
    assert cr_function_output_00 = X"10090288" report "ColumnRound Word 0 Failure" severity failure;
    assert cr_function_output_01 /= X"00000000" report "ColumnRound Word 1 Success" severity note;
    assert cr_function_output_01 = X"00000000" report "ColumnRound Word 1 Failure" severity failure;
    assert cr_function_output_02 /= X"00000000" report "ColumnRound Word 2 Success" severity note;
    assert cr_function_output_02 = X"00000000" report "ColumnRound Word 2 Failure" severity failure;
    assert cr_function_output_03 /= X"00000000" report "ColumnRound Word 3 Success" severity note;
    assert cr_function_output_03 = X"00000000" report "ColumnRound Word 3 Failure" severity failure;
    assert cr_function_output_04 /= X"00000101" report "ColumnRound Word 4 Success" severity note;
    assert cr_function_output_04 = X"00000101" report "ColumnRound Word 4 Failure" severity failure;
    assert cr_function_output_05 /= X"00000000" report "ColumnRound Word 5 Success" severity note;
    assert cr_function_output_05 = X"00000000" report "ColumnRound Word 5 Failure" severity failure;
    assert cr_function_output_06 /= X"00000000" report "ColumnRound Word 6 Success" severity note;
    assert cr_function_output_06 = X"00000000" report "ColumnRound Word 6 Failure" severity failure;
    assert cr_function_output_07 /= X"00000000" report "ColumnRound Word 7 Success" severity note;
    assert cr_function_output_07 = X"00000000" report "ColumnRound Word 7 Failure" severity failure;
    assert cr_function_output_08 /= X"00020401" report "ColumnRound Word 8 Success" severity note;
    assert cr_function_output_08 = X"00020401" report "ColumnRound Word 8 Failure" severity failure;
    assert cr_function_output_09 /= X"00000000" report "ColumnRound Word 9 Success" severity note;
    assert cr_function_output_09 = X"00000000" report "ColumnRound Word 9 Failure" severity failure;
    assert cr_function_output_10 /= X"00000000" report "ColumnRound Word 10 Success" severity note;
    assert cr_function_output_10 = X"00000000" report "ColumnRound Word 10 Failure" severity failure;
    assert cr_function_output_11 /= X"00000000" report "ColumnRound Word 11 Success" severity note;
    assert cr_function_output_11 = X"00000000" report "ColumnRound Word 11 Failure" severity failure;
    assert cr_function_output_12 /= X"40a04001" report "ColumnRound Word 12 Success" severity note;
    assert cr_function_output_12 = X"40a04001" report "ColumnRound Word 12 Failure" severity failure;
    assert cr_function_output_13 /= X"00000000" report "ColumnRound Word 13 Success" severity note;
    assert cr_function_output_13 = X"00000000" report "ColumnRound Word 13 Failure" severity failure;
    assert cr_function_output_14 /= X"00000000" report "ColumnRound Word 14 Success" severity note;
    assert cr_function_output_14 = X"00000000" report "ColumnRound Word 14 Failure" severity failure;
    assert cr_function_output_15 /= X"00000000" report "ColumnRound Word 15 Success" severity note;
    assert cr_function_output_15 = X"00000000" report "ColumnRound Word 15 Failure" severity failure;
    wait for 100 ns;



    report "ColumnRound Test 2";
    wait for 100 ns;			
	cr_function_input_00 <= X"08521bd6";
    cr_function_input_01 <= X"1fe88837";
    cr_function_input_02 <= X"bb2aa576";
    cr_function_input_03 <= X"3aa26365";
    cr_function_input_04 <= X"c54c6a5b";
    cr_function_input_05 <= X"2fc74c2f";
    cr_function_input_06 <= X"6dd39cc3";
    cr_function_input_07 <= X"da0a64f6";
    cr_function_input_08 <= X"90a2f23d";
    cr_function_input_09 <= X"067f95a6";
    cr_function_input_10 <= X"06b35f61";
    cr_function_input_11 <= X"41e4732e";
    cr_function_input_12 <= X"e859c100";
    cr_function_input_13 <= X"ea4d84b7";
    cr_function_input_14 <= X"0f619bff";
    cr_function_input_15 <= X"bc6e965a";
    wait for 100 ns;

    assert cr_function_output_00 /= X"8c9d190a" report "ColumnRound Word 0 Success" severity note;
    assert cr_function_output_00 = X"8c9d190a" report "ColumnRound Word 0 Failure" severity failure;
    assert cr_function_output_01 /= X"ce8e4c90" report "ColumnRound Word 1 Success" severity note;
    assert cr_function_output_01 = X"ce8e4c90" report "ColumnRound Word 1 Failure" severity failure;
    assert cr_function_output_02 /= X"1ef8e9d3" report "ColumnRound Word 2 Success" severity note;
    assert cr_function_output_02 = X"1ef8e9d3" report "ColumnRound Word 2 Failure" severity failure;
    assert cr_function_output_03 /= X"1326a71a" report "ColumnRound Word 3 Success" severity note;
    assert cr_function_output_03 = X"1326a71a" report "ColumnRound Word 3 Failure" severity failure;
    assert cr_function_output_04 /= X"90a20123" report "ColumnRound Word 4 Success" severity note;
    assert cr_function_output_04 = X"90a20123" report "ColumnRound Word 4 Failure" severity failure;
    assert cr_function_output_05 /= X"ead3c4f3" report "ColumnRound Word 5 Success" severity note;
    assert cr_function_output_05 = X"ead3c4f3" report "ColumnRound Word 5 Failure" severity failure;
    assert cr_function_output_06 /= X"63a091a0" report "ColumnRound Word 6 Success" severity note;
    assert cr_function_output_06 = X"63a091a0" report "ColumnRound Word 6 Failure" severity failure;
    assert cr_function_output_07 /= X"f0708d69" report "ColumnRound Word 7 Success" severity note;
    assert cr_function_output_07 = X"f0708d69" report "ColumnRound Word 7 Failure" severity failure;
    assert cr_function_output_08 /= X"789b010c" report "ColumnRound Word 8 Success" severity note;
    assert cr_function_output_08 = X"789b010c" report "ColumnRound Word 8 Failure" severity failure;
    assert cr_function_output_09 /= X"d195a681" report "ColumnRound Word 9 Success" severity note;
    assert cr_function_output_09 = X"d195a681" report "ColumnRound Word 9 Failure" severity failure;
    assert cr_function_output_10 /= X"eb7d5504" report "ColumnRound Word 10 Success" severity note;
    assert cr_function_output_10 = X"eb7d5504" report "ColumnRound Word 10 Failure" severity failure;
    assert cr_function_output_11 /= X"a774135c" report "ColumnRound Word 11 Success" severity note;
    assert cr_function_output_11 = X"a774135c" report "ColumnRound Word 11 Failure" severity failure;
    assert cr_function_output_12 /= X"481c2027" report "ColumnRound Word 12 Success" severity note;
    assert cr_function_output_12 = X"481c2027" report "ColumnRound Word 12 Failure" severity failure;
    assert cr_function_output_13 /= X"53a8e4b5" report "ColumnRound Word 13 Success" severity note;
    assert cr_function_output_13 = X"53a8e4b5" report "ColumnRound Word 13 Failure" severity failure;
    assert cr_function_output_14 /= X"4c1f89c5" report "ColumnRound Word 14 Success" severity note;
    assert cr_function_output_14 = X"4c1f89c5" report "ColumnRound Word 14 Failure" severity failure;
    assert cr_function_output_15 /= X"3f78c9c8" report "ColumnRound Word 15 Success" severity note;
    assert cr_function_output_15 = X"3f78c9c8" report "ColumnRound Word 15 Failure" severity failure;
    wait for 100 ns;


    report "DoubleRound Test 1";
    wait for 100 ns;			

	dr_function_input_00 <= X"00000001";
    dr_function_input_01 <= X"00000000";
    dr_function_input_02 <= X"00000000";
    dr_function_input_03 <= X"00000000";
    dr_function_input_04 <= X"00000000";
    dr_function_input_05 <= X"00000000";
    dr_function_input_06 <= X"00000000";
    dr_function_input_07 <= X"00000000";
    dr_function_input_08 <= X"00000000";
    dr_function_input_09 <= X"00000000";
    dr_function_input_10 <= X"00000000";
    dr_function_input_11 <= X"00000000";
    dr_function_input_12 <= X"00000000";
    dr_function_input_13 <= X"00000000";
    dr_function_input_14 <= X"00000000";
    dr_function_input_15 <= X"00000000";
    wait for 100 ns;

    assert dr_function_output_00 /= X"8186a22d" report "DoubleRound Word 0 Success" severity note;
    assert dr_function_output_00 = X"8186a22d" report "DoubleRound Word 0 Failure" severity failure;
    assert dr_function_output_01 /= X"0040a284" report "DoubleRound Word 1 Success" severity note;
    assert dr_function_output_01 = X"0040a284" report "DoubleRound Word 1 Failure" severity failure;
    assert dr_function_output_02 /= X"82479210" report "DoubleRound Word 2 Success" severity note;
    assert dr_function_output_02 = X"82479210" report "DoubleRound Word 2 Failure" severity failure;
    assert dr_function_output_03 /= X"06929051" report "DoubleRound Word 3 Success" severity note;
    assert dr_function_output_03 = X"06929051" report "DoubleRound Word 3 Failure" severity failure;
    assert dr_function_output_04 /= X"08000090" report "DoubleRound Word 4 Success" severity note;
    assert dr_function_output_04 = X"08000090" report "DoubleRound Word 4 Failure" severity failure;
    assert dr_function_output_05 /= X"02402200" report "DoubleRound Word 5 Success" severity note;
    assert dr_function_output_05 = X"02402200" report "DoubleRound Word 5 Failure" severity failure;
    assert dr_function_output_06 /= X"00004000" report "DoubleRound Word 6 Success" severity note;
    assert dr_function_output_06 = X"00004000" report "DoubleRound Word 6 Failure" severity failure;
    assert dr_function_output_07 /= X"00800000" report "DoubleRound Word 7 Success" severity note;
    assert dr_function_output_07 = X"00800000" report "DoubleRound Word 7 Failure" severity failure;
    assert dr_function_output_08 /= X"00010200" report "DoubleRound Word 8 Success" severity note;
    assert dr_function_output_08 = X"00010200" report "DoubleRound Word 8 Failure" severity failure;
    assert dr_function_output_09 /= X"20400000" report "DoubleRound Word 9 Success" severity note;
    assert dr_function_output_09 = X"20400000" report "DoubleRound Word 9 Failure" severity failure;
    assert dr_function_output_10 /= X"08008104" report "DoubleRound Word 10 Success" severity note;
    assert dr_function_output_10 = X"08008104" report "DoubleRound Word 10 Failure" severity failure;
    assert dr_function_output_11 /= X"00000000" report "DoubleRound Word 11 Success" severity note;
    assert dr_function_output_11 = X"00000000" report "DoubleRound Word 11 Failure" severity failure;
    assert dr_function_output_12 /= X"20500000" report "DoubleRound Word 12 Success" severity note;
    assert dr_function_output_12 = X"20500000" report "DoubleRound Word 12 Failure" severity failure;
    assert dr_function_output_13 /= X"a0000040" report "DoubleRound Word 13 Success" severity note;
    assert dr_function_output_13 = X"a0000040" report "DoubleRound Word 13 Failure" severity failure;
    assert dr_function_output_14 /= X"0008180a" report "DoubleRound Word 14 Success" severity note;
    assert dr_function_output_14 = X"0008180a" report "DoubleRound Word 14 Failure" severity failure;
    assert dr_function_output_15 /= X"612a8020" report "DoubleRound Word 15 Success" severity note;
    assert dr_function_output_15 = X"612a8020" report "DoubleRound Word 15 Failure" severity failure;
    wait for 100 ns;

    report "DoubleRound Test 2";
    wait for 100 ns;			

	dr_function_input_00 <= X"de501066";
    dr_function_input_01 <= X"6f9eb8f7";
    dr_function_input_02 <= X"e4fbbd9b";
    dr_function_input_03 <= X"454e3f57";
    dr_function_input_04 <= X"b75540d3";
    dr_function_input_05 <= X"43e93a4c";
    dr_function_input_06 <= X"3a6f2aa0";
    dr_function_input_07 <= X"726d6b36";
    dr_function_input_08 <= X"9243f484";
    dr_function_input_09 <= X"9145d1e8";
    dr_function_input_10 <= X"4fa9d247";
    dr_function_input_11 <= X"dc8dee11";
    dr_function_input_12 <= X"054bf545";
    dr_function_input_13 <= X"254dd653";
    dr_function_input_14 <= X"d9421b6d";
    dr_function_input_15 <= X"67b276c1";
    wait for 100 ns;

    assert dr_function_output_00 /= X"ccaaf672" report "DoubleRound Word 0 Success" severity note;
    assert dr_function_output_00 = X"ccaaf672" report "DoubleRound Word 0 Failure" severity failure;
    assert dr_function_output_01 /= X"23d960f7" report "DoubleRound Word 1 Success" severity note;
    assert dr_function_output_01 = X"23d960f7" report "DoubleRound Word 1 Failure" severity failure;
    assert dr_function_output_02 /= X"9153e63a" report "DoubleRound Word 2 Success" severity note;
    assert dr_function_output_02 = X"9153e63a" report "DoubleRound Word 2 Failure" severity failure;
    assert dr_function_output_03 /= X"cd9a60d0" report "DoubleRound Word 3 Success" severity note;
    assert dr_function_output_03 = X"cd9a60d0" report "DoubleRound Word 3 Failure" severity failure;
    assert dr_function_output_04 /= X"50440492" report "DoubleRound Word 4 Success" severity note;
    assert dr_function_output_04 = X"50440492" report "DoubleRound Word 4 Failure" severity failure;
    assert dr_function_output_05 /= X"f07cad19" report "DoubleRound Word 5 Success" severity note;
    assert dr_function_output_05 = X"f07cad19" report "DoubleRound Word 5 Failure" severity failure;
    assert dr_function_output_06 /= X"ae344aa0" report "DoubleRound Word 6 Success" severity note;
    assert dr_function_output_06 = X"ae344aa0" report "DoubleRound Word 6 Failure" severity failure;
    assert dr_function_output_07 /= X"df4cfdfc" report "DoubleRound Word 7 Success" severity note;
    assert dr_function_output_07 = X"df4cfdfc" report "DoubleRound Word 7 Failure" severity failure;
    assert dr_function_output_08 /= X"ca531c29" report "DoubleRound Word 8 Success" severity note;
    assert dr_function_output_08 = X"ca531c29" report "DoubleRound Word 8 Failure" severity failure;
    assert dr_function_output_09 /= X"8e7943db" report "DoubleRound Word 9 Success" severity note;
    assert dr_function_output_09 = X"8e7943db" report "DoubleRound Word 9 Failure" severity failure;
    assert dr_function_output_10 /= X"ac1680cd" report "DoubleRound Word 10 Success" severity note;
    assert dr_function_output_10 = X"ac1680cd" report "DoubleRound Word 10 Failure" severity failure;
    assert dr_function_output_11 /= X"d503ca00" report "DoubleRound Word 11 Success" severity note;
    assert dr_function_output_11 = X"d503ca00" report "DoubleRound Word 11 Failure" severity failure;
    assert dr_function_output_12 /= X"a74b2ad6" report "DoubleRound Word 12 Success" severity note;
    assert dr_function_output_12 = X"a74b2ad6" report "DoubleRound Word 12 Failure" severity failure;
    assert dr_function_output_13 /= X"bc331c5c" report "DoubleRound Word 13 Success" severity note;
    assert dr_function_output_13 = X"bc331c5c" report "DoubleRound Word 13 Failure" severity failure;
    assert dr_function_output_14 /= X"1dda24c7" report "DoubleRound Word 14 Success" severity note;
    assert dr_function_output_14 = X"1dda24c7" report "DoubleRound Word 14 Failure" severity failure;
    assert dr_function_output_15 /= X"ee928277" report "DoubleRound Word 15 Success" severity note;
    assert dr_function_output_15 = X"ee928277" report "DoubleRound Word 15 Failure" severity failure;
    wait for 100 ns;
    
    report "Salsa20 Hash Function Test 1";
    wait for 100 ns;			
    hash_input_00 <= X"D3";
    hash_input_01 <= X"9F";
    hash_input_02 <= X"0D";
    hash_input_03 <= X"73";
    hash_input_04 <= X"4C";
    hash_input_05 <= X"37";
    hash_input_06 <= X"52";
    hash_input_07 <= X"B7";
    hash_input_08 <= X"03";
    hash_input_09 <= X"75";
    hash_input_10 <= X"DE";
    hash_input_11 <= X"25";
    hash_input_12 <= X"BF";
    hash_input_13 <= X"BB";
    hash_input_14 <= X"EA";
    hash_input_15 <= X"88";
    hash_input_16 <= X"31";
    hash_input_17 <= X"ED";
    hash_input_18 <= X"B3";
    hash_input_19 <= X"30";
    hash_input_20 <= X"01";
    hash_input_21 <= X"6A";
    hash_input_22 <= X"B2";
    hash_input_23 <= X"DB";
    hash_input_24 <= X"AF";
    hash_input_25 <= X"C7";
    hash_input_26 <= X"A6";
    hash_input_27 <= X"30";
    hash_input_28 <= X"56";
    hash_input_29 <= X"10";
    hash_input_30 <= X"B3";
    hash_input_31 <= X"CF";
    hash_input_32 <= X"1F";
    hash_input_33 <= X"F0";
    hash_input_34 <= X"20";
    hash_input_35 <= X"3F";
    hash_input_36 <= X"0F";
    hash_input_37 <= X"53";
    hash_input_38 <= X"5D";
    hash_input_39 <= X"A1";
    hash_input_40 <= X"74";
    hash_input_41 <= X"93";
    hash_input_42 <= X"30";
    hash_input_43 <= X"71";
    hash_input_44 <= X"EE";
    hash_input_45 <= X"37";
    hash_input_46 <= X"CC";
    hash_input_47 <= X"24";
    hash_input_48 <= X"4F";
    hash_input_49 <= X"C9";
    hash_input_50 <= X"EB";
    hash_input_51 <= X"4F";
    hash_input_52 <= X"03";
    hash_input_53 <= X"51";
    hash_input_54 <= X"9C";
    hash_input_55 <= X"2F";
    hash_input_56 <= X"CB";
    hash_input_57 <= X"1A";
    hash_input_58 <= X"F4";
    hash_input_59 <= X"F3";
    hash_input_60 <= X"58";
    hash_input_61 <= X"76";
    hash_input_62 <= X"68";
    hash_input_63 <= X"36";
    wait for 100 ns;

    assert hash_output_00 /= X"6D" report "Hash Function Byte 0 Success" severity note;
    assert hash_output_00 = X"6D" report "Hash Function Byte 0 Failure" severity failure;
    assert hash_output_01 /= X"2A" report "Hash Function Byte 1 Success" severity note;
    assert hash_output_01 = X"2A" report "Hash Function Byte 1 Failure" severity failure;
    assert hash_output_02 /= X"B2" report "Hash Function Byte 2 Success" severity note;
    assert hash_output_02 = X"B2" report "Hash Function Byte 2 Failure" severity failure;
    assert hash_output_03 /= X"A8" report "Hash Function Byte 3 Success" severity note;
    assert hash_output_03 = X"A8" report "Hash Function Byte 3 Failure" severity failure;
    assert hash_output_04 /= X"9C" report "Hash Function Byte 4 Success" severity note;
    assert hash_output_04 = X"9C" report "Hash Function Byte 4 Failure" severity failure;
    assert hash_output_05 /= X"F0" report "Hash Function Byte 5 Success" severity note;
    assert hash_output_05 = X"F0" report "Hash Function Byte 5 Failure" severity failure;
    assert hash_output_06 /= X"F8" report "Hash Function Byte 6 Success" severity note;
    assert hash_output_06 = X"F8" report "Hash Function Byte 6 Failure" severity failure;
    assert hash_output_07 /= X"EE" report "Hash Function Byte 7 Success" severity note;
    assert hash_output_07 = X"EE" report "Hash Function Byte 7 Failure" severity failure;
    assert hash_output_08 /= X"A8" report "Hash Function Byte 8 Success" severity note;
    assert hash_output_08 = X"A8" report "Hash Function Byte 8 Failure" severity failure;
    assert hash_output_09 /= X"C4" report "Hash Function Byte 9 Success" severity note;
    assert hash_output_09 = X"C4" report "Hash Function Byte 9 Failure" severity failure;
    assert hash_output_10 /= X"BE" report "Hash Function Byte 10 Success" severity note;
    assert hash_output_10 = X"BE" report "Hash Function Byte 10 Failure" severity failure;
    assert hash_output_11 /= X"CB" report "Hash Function Byte 11 Success" severity note;
    assert hash_output_11 = X"CB" report "Hash Function Byte 11 Failure" severity failure;
    assert hash_output_12 /= X"1A" report "Hash Function Byte 12 Success" severity note;
    assert hash_output_12 = X"1A" report "Hash Function Byte 12 Failure" severity failure;
    assert hash_output_13 /= X"6E" report "Hash Function Byte 13 Success" severity note;
    assert hash_output_13 = X"6E" report "Hash Function Byte 13 Failure" severity failure;
    assert hash_output_14 /= X"AA" report "Hash Function Byte 14 Success" severity note;
    assert hash_output_14 = X"AA" report "Hash Function Byte 14 Failure" severity failure;
    assert hash_output_15 /= X"9A" report "Hash Function Byte 15 Success" severity note;
    assert hash_output_15 = X"9A" report "Hash Function Byte 15 Failure" severity failure;
    assert hash_output_16 /= X"1D" report "Hash Function Byte 16 Success" severity note;
    assert hash_output_16 = X"1D" report "Hash Function Byte 16 Failure" severity failure;
    assert hash_output_17 /= X"1D" report "Hash Function Byte 17 Success" severity note;
    assert hash_output_17 = X"1D" report "Hash Function Byte 17 Failure" severity failure;
    assert hash_output_18 /= X"96" report "Hash Function Byte 18 Success" severity note;
    assert hash_output_18 = X"96" report "Hash Function Byte 18 Failure" severity failure;
    assert hash_output_19 /= X"1A" report "Hash Function Byte 19 Success" severity note;
    assert hash_output_19 = X"1A" report "Hash Function Byte 19 Failure" severity failure;
    assert hash_output_20 /= X"96" report "Hash Function Byte 20 Success" severity note;
    assert hash_output_20 = X"96" report "Hash Function Byte 20 Failure" severity failure;
    assert hash_output_21 /= X"1E" report "Hash Function Byte 21 Success" severity note;
    assert hash_output_21 = X"1E" report "Hash Function Byte 21 Failure" severity failure;
    assert hash_output_22 /= X"EB" report "Hash Function Byte 22 Success" severity note;
    assert hash_output_22 = X"EB" report "Hash Function Byte 22 Failure" severity failure;
    assert hash_output_23 /= X"F9" report "Hash Function Byte 23 Success" severity note;
    assert hash_output_23 = X"F9" report "Hash Function Byte 23 Failure" severity failure;
    assert hash_output_24 /= X"BE" report "Hash Function Byte 24 Success" severity note;
    assert hash_output_24 = X"BE" report "Hash Function Byte 24 Failure" severity failure;
    assert hash_output_25 /= X"A3" report "Hash Function Byte 25 Success" severity note;
    assert hash_output_25 = X"A3" report "Hash Function Byte 25 Failure" severity failure;
    assert hash_output_26 /= X"FB" report "Hash Function Byte 26 Success" severity note;
    assert hash_output_26 = X"FB" report "Hash Function Byte 26 Failure" severity failure;
    assert hash_output_27 /= X"30" report "Hash Function Byte 27 Success" severity note;
    assert hash_output_27 = X"30" report "Hash Function Byte 27 Failure" severity failure;
    assert hash_output_28 /= X"45" report "Hash Function Byte 28 Success" severity note;
    assert hash_output_28 = X"45" report "Hash Function Byte 28 Failure" severity failure;
    assert hash_output_29 /= X"90" report "Hash Function Byte 29 Success" severity note;
    assert hash_output_29 = X"90" report "Hash Function Byte 29 Failure" severity failure;
    assert hash_output_30 /= X"33" report "Hash Function Byte 30 Success" severity note;
    assert hash_output_30 = X"33" report "Hash Function Byte 30 Failure" severity failure;
    assert hash_output_31 /= X"39" report "Hash Function Byte 31 Success" severity note;
    assert hash_output_31 = X"39" report "Hash Function Byte 31 Failure" severity failure;
    assert hash_output_32 /= X"76" report "Hash Function Byte 32 Success" severity note;
    assert hash_output_32 = X"76" report "Hash Function Byte 32 Failure" severity failure;
    assert hash_output_33 /= X"28" report "Hash Function Byte 33 Success" severity note;
    assert hash_output_33 = X"28" report "Hash Function Byte 33 Failure" severity failure;
    assert hash_output_34 /= X"98" report "Hash Function Byte 34 Success" severity note;
    assert hash_output_34 = X"98" report "Hash Function Byte 34 Failure" severity failure;
    assert hash_output_35 /= X"9D" report "Hash Function Byte 35 Success" severity note;
    assert hash_output_35 = X"9D" report "Hash Function Byte 35 Failure" severity failure;
    assert hash_output_36 /= X"B4" report "Hash Function Byte 36 Success" severity note;
    assert hash_output_36 = X"B4" report "Hash Function Byte 36 Failure" severity failure;
    assert hash_output_37 /= X"39" report "Hash Function Byte 37 Success" severity note;
    assert hash_output_37 = X"39" report "Hash Function Byte 37 Failure" severity failure;
    assert hash_output_38 /= X"1B" report "Hash Function Byte 38 Success" severity note;
    assert hash_output_38 = X"1B" report "Hash Function Byte 38 Failure" severity failure;
    assert hash_output_39 /= X"5E" report "Hash Function Byte 39 Success" severity note;
    assert hash_output_39 = X"5E" report "Hash Function Byte 39 Failure" severity failure;
    assert hash_output_40 /= X"6B" report "Hash Function Byte 40 Success" severity note;
    assert hash_output_40 = X"6B" report "Hash Function Byte 40 Failure" severity failure;
    assert hash_output_41 /= X"2A" report "Hash Function Byte 41 Success" severity note;
    assert hash_output_41 = X"2A" report "Hash Function Byte 41 Failure" severity failure;
    assert hash_output_42 /= X"EC" report "Hash Function Byte 42 Success" severity note;
    assert hash_output_42 = X"EC" report "Hash Function Byte 42 Failure" severity failure;
    assert hash_output_43 /= X"23" report "Hash Function Byte 43 Success" severity note;
    assert hash_output_43 = X"23" report "Hash Function Byte 43 Failure" severity failure;
    assert hash_output_44 /= X"1B" report "Hash Function Byte 44 Success" severity note;
    assert hash_output_44 = X"1B" report "Hash Function Byte 44 Failure" severity failure;
    assert hash_output_45 /= X"6F" report "Hash Function Byte 45 Success" severity note;
    assert hash_output_45 = X"6F" report "Hash Function Byte 45 Failure" severity failure;
    assert hash_output_46 /= X"72" report "Hash Function Byte 46 Success" severity note;
    assert hash_output_46 = X"72" report "Hash Function Byte 46 Failure" severity failure;
    assert hash_output_47 /= X"72" report "Hash Function Byte 47 Success" severity note;
    assert hash_output_47 = X"72" report "Hash Function Byte 47 Failure" severity failure;
    assert hash_output_48 /= X"DB" report "Hash Function Byte 48 Success" severity note;
    assert hash_output_48 = X"DB" report "Hash Function Byte 48 Failure" severity failure;
    assert hash_output_49 /= X"EC" report "Hash Function Byte 49 Success" severity note;
    assert hash_output_49 = X"EC" report "Hash Function Byte 49 Failure" severity failure;
    assert hash_output_50 /= X"E8" report "Hash Function Byte 50 Success" severity note;
    assert hash_output_50 = X"E8" report "Hash Function Byte 50 Failure" severity failure;
    assert hash_output_51 /= X"87" report "Hash Function Byte 51 Success" severity note;
    assert hash_output_51 = X"87" report "Hash Function Byte 51 Failure" severity failure;
    assert hash_output_52 /= X"6F" report "Hash Function Byte 52 Success" severity note;
    assert hash_output_52 = X"6F" report "Hash Function Byte 52 Failure" severity failure;
    assert hash_output_53 /= X"9B" report "Hash Function Byte 53 Success" severity note;
    assert hash_output_53 = X"9B" report "Hash Function Byte 53 Failure" severity failure;
    assert hash_output_54 /= X"6E" report "Hash Function Byte 54 Success" severity note;
    assert hash_output_54 = X"6E" report "Hash Function Byte 54 Failure" severity failure;
    assert hash_output_55 /= X"12" report "Hash Function Byte 55 Success" severity note;
    assert hash_output_55 = X"12" report "Hash Function Byte 55 Failure" severity failure;
    assert hash_output_56 /= X"18" report "Hash Function Byte 56 Success" severity note;
    assert hash_output_56 = X"18" report "Hash Function Byte 56 Failure" severity failure;
    assert hash_output_57 /= X"E8" report "Hash Function Byte 57 Success" severity note;
    assert hash_output_57 = X"E8" report "Hash Function Byte 57 Failure" severity failure;
    assert hash_output_58 /= X"5F" report "Hash Function Byte 58 Success" severity note;
    assert hash_output_58 = X"5F" report "Hash Function Byte 58 Failure" severity failure;
    assert hash_output_59 /= X"9E" report "Hash Function Byte 59 Success" severity note;
    assert hash_output_59 = X"9E" report "Hash Function Byte 59 Failure" severity failure;
    assert hash_output_60 /= X"B3" report "Hash Function Byte 60 Success" severity note;
    assert hash_output_60 = X"B3" report "Hash Function Byte 60 Failure" severity failure;
    assert hash_output_61 /= X"13" report "Hash Function Byte 61 Success" severity note;
    assert hash_output_61 = X"13" report "Hash Function Byte 61 Failure" severity failure;
    assert hash_output_62 /= X"30" report "Hash Function Byte 62 Success" severity note;
    assert hash_output_62 = X"30" report "Hash Function Byte 62 Failure" severity failure;
    assert hash_output_63 /= X"CA" report "Hash Function Byte 63 Success" severity note;
    assert hash_output_63 = X"CA" report "Hash Function Byte 63 Failure" severity failure;


    report "Salsa20 Hash Function Test 2";
    wait for 100 ns;			
    hash_input_00 <= X"58";
    hash_input_01 <= X"76";
    hash_input_02 <= X"68";
    hash_input_03 <= X"36";
    hash_input_04 <= X"4F";
    hash_input_05 <= X"C9";
    hash_input_06 <= X"EB";
    hash_input_07 <= X"4F";
    hash_input_08 <= X"03";
    hash_input_09 <= X"51";
    hash_input_10 <= X"9C";
    hash_input_11 <= X"2F";
    hash_input_12 <= X"CB";
    hash_input_13 <= X"1A";
    hash_input_14 <= X"F4";
    hash_input_15 <= X"F3";
    hash_input_16 <= X"BF";
    hash_input_17 <= X"BB";
    hash_input_18 <= X"EA";
    hash_input_19 <= X"88";
    hash_input_20 <= X"D3";
    hash_input_21 <= X"9F";
    hash_input_22 <= X"0D";
    hash_input_23 <= X"73";
    hash_input_24 <= X"4C";
    hash_input_25 <= X"37";
    hash_input_26 <= X"52";
    hash_input_27 <= X"B7";
    hash_input_28 <= X"03";
    hash_input_29 <= X"75";
    hash_input_30 <= X"DE";
    hash_input_31 <= X"25";
    hash_input_32 <= X"56";
    hash_input_33 <= X"10";
    hash_input_34 <= X"B3";
    hash_input_35 <= X"CF";
    hash_input_36 <= X"31";
    hash_input_37 <= X"ED";
    hash_input_38 <= X"B3";
    hash_input_39 <= X"30";
    hash_input_40 <= X"01";
    hash_input_41 <= X"6A";
    hash_input_42 <= X"B2";
    hash_input_43 <= X"DB";
    hash_input_44 <= X"AF";
    hash_input_45 <= X"C7";
    hash_input_46 <= X"A6";
    hash_input_47 <= X"30";
    hash_input_48 <= X"EE";
    hash_input_49 <= X"37";
    hash_input_50 <= X"CC";
    hash_input_51 <= X"24";
    hash_input_52 <= X"1F";
    hash_input_53 <= X"F0";
    hash_input_54 <= X"20";
    hash_input_55 <= X"3F";
    hash_input_56 <= X"0F";
    hash_input_57 <= X"53";
    hash_input_58 <= X"5D";
    hash_input_59 <= X"A1";
    hash_input_60 <= X"74";
    hash_input_61 <= X"93";
    hash_input_62 <= X"30";
    hash_input_63 <= X"71";
    wait for 100 ns;		

    assert hash_output_00 /= X"B3" report "Hash Function Byte 0 Success" severity note;
    assert hash_output_00 = X"B3" report "Hash Function Byte 0 Failure" severity failure;
    assert hash_output_01 /= X"13" report "Hash Function Byte 1 Success" severity note;
    assert hash_output_01 = X"13" report "Hash Function Byte 1 Failure" severity failure;
    assert hash_output_02 /= X"30" report "Hash Function Byte 2 Success" severity note;
    assert hash_output_02 = X"30" report "Hash Function Byte 2 Failure" severity failure;
    assert hash_output_03 /= X"CA" report "Hash Function Byte 3 Success" severity note;
    assert hash_output_03 = X"CA" report "Hash Function Byte 3 Failure" severity failure;
    assert hash_output_04 /= X"DB" report "Hash Function Byte 4 Success" severity note;
    assert hash_output_04 = X"DB" report "Hash Function Byte 4 Failure" severity failure;
    assert hash_output_05 /= X"EC" report "Hash Function Byte 5 Success" severity note;
    assert hash_output_05 = X"EC" report "Hash Function Byte 5 Failure" severity failure;
    assert hash_output_06 /= X"E8" report "Hash Function Byte 6 Success" severity note;
    assert hash_output_06 = X"E8" report "Hash Function Byte 6 Failure" severity failure;
    assert hash_output_07 /= X"87" report "Hash Function Byte 7 Success" severity note;
    assert hash_output_07 = X"87" report "Hash Function Byte 7 Failure" severity failure;
    assert hash_output_08 /= X"6F" report "Hash Function Byte 8 Success" severity note;
    assert hash_output_08 = X"6F" report "Hash Function Byte 8 Failure" severity failure;
    assert hash_output_09 /= X"9B" report "Hash Function Byte 9 Success" severity note;
    assert hash_output_09 = X"9B" report "Hash Function Byte 9 Failure" severity failure;
    assert hash_output_10 /= X"6E" report "Hash Function Byte 10 Success" severity note;
    assert hash_output_10 = X"6E" report "Hash Function Byte 10 Failure" severity failure;
    assert hash_output_11 /= X"12" report "Hash Function Byte 11 Success" severity note;
    assert hash_output_11 = X"12" report "Hash Function Byte 11 Failure" severity failure;
    assert hash_output_12 /= X"18" report "Hash Function Byte 12 Success" severity note;
    assert hash_output_12 = X"18" report "Hash Function Byte 12 Failure" severity failure;
    assert hash_output_13 /= X"E8" report "Hash Function Byte 13 Success" severity note;
    assert hash_output_13 = X"E8" report "Hash Function Byte 13 Failure" severity failure;
    assert hash_output_14 /= X"5F" report "Hash Function Byte 14 Success" severity note;
    assert hash_output_14 = X"5F" report "Hash Function Byte 14 Failure" severity failure;
    assert hash_output_15 /= X"9E" report "Hash Function Byte 15 Success" severity note;
    assert hash_output_15 = X"9E" report "Hash Function Byte 15 Failure" severity failure;
    assert hash_output_16 /= X"1A" report "Hash Function Byte 16 Success" severity note;
    assert hash_output_16 = X"1A" report "Hash Function Byte 16 Failure" severity failure;
    assert hash_output_17 /= X"6E" report "Hash Function Byte 17 Success" severity note;
    assert hash_output_17 = X"6E" report "Hash Function Byte 17 Failure" severity failure;
    assert hash_output_18 /= X"AA" report "Hash Function Byte 18 Success" severity note;
    assert hash_output_18 = X"AA" report "Hash Function Byte 18 Failure" severity failure;
    assert hash_output_19 /= X"9A" report "Hash Function Byte 19 Success" severity note;
    assert hash_output_19 = X"9A" report "Hash Function Byte 19 Failure" severity failure;
    assert hash_output_20 /= X"6D" report "Hash Function Byte 20 Success" severity note;
    assert hash_output_20 = X"6D" report "Hash Function Byte 20 Failure" severity failure;
    assert hash_output_21 /= X"2A" report "Hash Function Byte 21 Success" severity note;
    assert hash_output_21 = X"2A" report "Hash Function Byte 21 Failure" severity failure;
    assert hash_output_22 /= X"B2" report "Hash Function Byte 22 Success" severity note;
    assert hash_output_22 = X"B2" report "Hash Function Byte 22 Failure" severity failure;
    assert hash_output_23 /= X"A8" report "Hash Function Byte 23 Success" severity note;
    assert hash_output_23 = X"A8" report "Hash Function Byte 23 Failure" severity failure;
    assert hash_output_24 /= X"9C" report "Hash Function Byte 24 Success" severity note;
    assert hash_output_24 = X"9C" report "Hash Function Byte 24 Failure" severity failure;
    assert hash_output_25 /= X"F0" report "Hash Function Byte 25 Success" severity note;
    assert hash_output_25 = X"F0" report "Hash Function Byte 25 Failure" severity failure;
    assert hash_output_26 /= X"F8" report "Hash Function Byte 26 Success" severity note;
    assert hash_output_26 = X"F8" report "Hash Function Byte 26 Failure" severity failure;
    assert hash_output_27 /= X"EE" report "Hash Function Byte 27 Success" severity note;
    assert hash_output_27 = X"EE" report "Hash Function Byte 27 Failure" severity failure;
    assert hash_output_28 /= X"A8" report "Hash Function Byte 28 Success" severity note;
    assert hash_output_28 = X"A8" report "Hash Function Byte 28 Failure" severity failure;
    assert hash_output_29 /= X"C4" report "Hash Function Byte 29 Success" severity note;
    assert hash_output_29 = X"C4" report "Hash Function Byte 29 Failure" severity failure;
    assert hash_output_30 /= X"BE" report "Hash Function Byte 30 Success" severity note;
    assert hash_output_30 = X"BE" report "Hash Function Byte 30 Failure" severity failure;
    assert hash_output_31 /= X"CB" report "Hash Function Byte 31 Success" severity note;
    assert hash_output_31 = X"CB" report "Hash Function Byte 31 Failure" severity failure;
    assert hash_output_32 /= X"45" report "Hash Function Byte 32 Success" severity note;
    assert hash_output_32 = X"45" report "Hash Function Byte 32 Failure" severity failure;
    assert hash_output_33 /= X"90" report "Hash Function Byte 33 Success" severity note;
    assert hash_output_33 = X"90" report "Hash Function Byte 33 Failure" severity failure;
    assert hash_output_34 /= X"33" report "Hash Function Byte 34 Success" severity note;
    assert hash_output_34 = X"33" report "Hash Function Byte 34 Failure" severity failure;
    assert hash_output_35 /= X"39" report "Hash Function Byte 35 Success" severity note;
    assert hash_output_35 = X"39" report "Hash Function Byte 35 Failure" severity failure;
    assert hash_output_36 /= X"1D" report "Hash Function Byte 36 Success" severity note;
    assert hash_output_36 = X"1D" report "Hash Function Byte 36 Failure" severity failure;
    assert hash_output_37 /= X"1D" report "Hash Function Byte 37 Success" severity note;
    assert hash_output_37 = X"1D" report "Hash Function Byte 37 Failure" severity failure;
    assert hash_output_38 /= X"96" report "Hash Function Byte 38 Success" severity note;
    assert hash_output_38 = X"96" report "Hash Function Byte 38 Failure" severity failure;
    assert hash_output_39 /= X"1A" report "Hash Function Byte 39 Success" severity note;
    assert hash_output_39 = X"1A" report "Hash Function Byte 39 Failure" severity failure;
    assert hash_output_40 /= X"96" report "Hash Function Byte 40 Success" severity note;
    assert hash_output_40 = X"96" report "Hash Function Byte 40 Failure" severity failure;
    assert hash_output_41 /= X"1E" report "Hash Function Byte 41 Success" severity note;
    assert hash_output_41 = X"1E" report "Hash Function Byte 41 Failure" severity failure;
    assert hash_output_42 /= X"EB" report "Hash Function Byte 42 Success" severity note;
    assert hash_output_42 = X"EB" report "Hash Function Byte 42 Failure" severity failure;
    assert hash_output_43 /= X"F9" report "Hash Function Byte 43 Success" severity note;
    assert hash_output_43 = X"F9" report "Hash Function Byte 43 Failure" severity failure;
    assert hash_output_44 /= X"BE" report "Hash Function Byte 44 Success" severity note;
    assert hash_output_44 = X"BE" report "Hash Function Byte 44 Failure" severity failure;
    assert hash_output_45 /= X"A3" report "Hash Function Byte 45 Success" severity note;
    assert hash_output_45 = X"A3" report "Hash Function Byte 45 Failure" severity failure;
    assert hash_output_46 /= X"FB" report "Hash Function Byte 46 Success" severity note;
    assert hash_output_46 = X"FB" report "Hash Function Byte 46 Failure" severity failure;
    assert hash_output_47 /= X"30" report "Hash Function Byte 47 Success" severity note;
    assert hash_output_47 = X"30" report "Hash Function Byte 47 Failure" severity failure;
    assert hash_output_48 /= X"1B" report "Hash Function Byte 48 Success" severity note;
    assert hash_output_48 = X"1B" report "Hash Function Byte 48 Failure" severity failure;
    assert hash_output_49 /= X"6F" report "Hash Function Byte 49 Success" severity note;
    assert hash_output_49 = X"6F" report "Hash Function Byte 49 Failure" severity failure;
    assert hash_output_50 /= X"72" report "Hash Function Byte 50 Success" severity note;
    assert hash_output_50 = X"72" report "Hash Function Byte 50 Failure" severity failure;
    assert hash_output_51 /= X"72" report "Hash Function Byte 51 Success" severity note;
    assert hash_output_51 = X"72" report "Hash Function Byte 51 Failure" severity failure;
    assert hash_output_52 /= X"76" report "Hash Function Byte 52 Success" severity note;
    assert hash_output_52 = X"76" report "Hash Function Byte 52 Failure" severity failure;
    assert hash_output_53 /= X"28" report "Hash Function Byte 53 Success" severity note;
    assert hash_output_53 = X"28" report "Hash Function Byte 53 Failure" severity failure;
    assert hash_output_54 /= X"98" report "Hash Function Byte 54 Success" severity note;
    assert hash_output_54 = X"98" report "Hash Function Byte 54 Failure" severity failure;
    assert hash_output_55 /= X"9D" report "Hash Function Byte 55 Success" severity note;
    assert hash_output_55 = X"9D" report "Hash Function Byte 55 Failure" severity failure;
    assert hash_output_56 /= X"B4" report "Hash Function Byte 56 Success" severity note;
    assert hash_output_56 = X"B4" report "Hash Function Byte 56 Failure" severity failure;
    assert hash_output_57 /= X"39" report "Hash Function Byte 57 Success" severity note;
    assert hash_output_57 = X"39" report "Hash Function Byte 57 Failure" severity failure;
    assert hash_output_58 /= X"1B" report "Hash Function Byte 58 Success" severity note;
    assert hash_output_58 = X"1B" report "Hash Function Byte 58 Failure" severity failure;
    assert hash_output_59 /= X"5E" report "Hash Function Byte 59 Success" severity note;
    assert hash_output_59 = X"5E" report "Hash Function Byte 59 Failure" severity failure;
    assert hash_output_60 /= X"6B" report "Hash Function Byte 60 Success" severity note;
    assert hash_output_60 = X"6B" report "Hash Function Byte 60 Failure" severity failure;
    assert hash_output_61 /= X"2A" report "Hash Function Byte 61 Success" severity note;
    assert hash_output_61 = X"2A" report "Hash Function Byte 61 Failure" severity failure;
    assert hash_output_62 /= X"EC" report "Hash Function Byte 62 Success" severity note;
    assert hash_output_62 = X"EC" report "Hash Function Byte 62 Failure" severity failure;
    assert hash_output_63 /= X"23" report "Hash Function Byte 63 Success" severity note;
    assert hash_output_63 = X"23" report "Hash Function Byte 63 Failure" severity failure;

    report "Salsa20 Encryption Test 1";
    wait for 100 ns;			
    hash_input_00 <= X"65";
    hash_input_01 <= X"78";
    hash_input_02 <= X"70";
    hash_input_03 <= X"61";
    hash_input_04 <= X"80";
    hash_input_05 <= X"00";
    hash_input_06 <= X"00";
    hash_input_07 <= X"00";
    hash_input_08 <= X"00";
    hash_input_09 <= X"00";
    hash_input_10 <= X"00";
    hash_input_11 <= X"00";
    hash_input_12 <= X"00";
    hash_input_13 <= X"00";
    hash_input_14 <= X"00";
    hash_input_15 <= X"00";
    hash_input_16 <= X"00";
    hash_input_17 <= X"00";
    hash_input_18 <= X"00";
    hash_input_19 <= X"00";
    hash_input_20 <= X"6e";
    hash_input_21 <= X"64";
    hash_input_22 <= X"20";
    hash_input_23 <= X"33";
    hash_input_24 <= X"00";
    hash_input_25 <= X"00";
    hash_input_26 <= X"00";
    hash_input_27 <= X"00";
    hash_input_28 <= X"00";
    hash_input_29 <= X"00";
    hash_input_30 <= X"00";
    hash_input_31 <= X"00";
    hash_input_32 <= X"00";
    hash_input_33 <= X"00";
    hash_input_34 <= X"00";
    hash_input_35 <= X"00";
    hash_input_36 <= X"00";
    hash_input_37 <= X"00";
    hash_input_38 <= X"00";
    hash_input_39 <= X"00";
    hash_input_40 <= X"32";
    hash_input_41 <= X"2D";
    hash_input_42 <= X"62";
    hash_input_43 <= X"79";
    hash_input_44 <= X"00";
    hash_input_45 <= X"00";
    hash_input_46 <= X"00";
    hash_input_47 <= X"00";
    hash_input_48 <= X"00";
    hash_input_49 <= X"00";
    hash_input_50 <= X"00";
    hash_input_51 <= X"00";
    hash_input_52 <= X"00";
    hash_input_53 <= X"00";
    hash_input_54 <= X"00";
    hash_input_55 <= X"00";
    hash_input_56 <= X"00";
    hash_input_57 <= X"00";
    hash_input_58 <= X"00";
    hash_input_59 <= X"00";
    hash_input_60 <= X"74";
    hash_input_61 <= X"65";
    hash_input_62 <= X"20";
    hash_input_63 <= X"6B";
    wait for 100 ns;		

    wait;	
end process;

END Behavioral;