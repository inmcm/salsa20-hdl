library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.SALSA20_CONSTANTS.all;
use work.SALSA20_FUCNTIONS.all;


entity SALSA20_CIPHER is
	Generic(KEY_SIZE : integer range 0 to 256 := 256;
			BLOCK_SIZE : integer range 0 to 128 := 128;
			ROUND_LIMIT: integer range 0 to 72 := 72);
    
    Port (SYS_CLK,RST : in std_logic;
    		BUSY : out  std_logic;
    		CONTROL : in  std_logic_vector(1 downto 0);
    		KEY : in  std_logic_vector (KEY_SIZE - 1 downto 0);
			BLOCK_INPUT : in  std_logic_vector (BLOCK_SIZE - 1 downto 0);
			BLOCK_OUTPUT : out  std_logic_vector (BLOCK_SIZE - 1 downto 0));
			
end SALSA20_CIPHER;


architecture Behavioral of SALSA20_CIPHER is


type ARRAY_4X4_WORDSIZE is array (0 to 3, 0 to 3) of std_logic_vector(WORD_SIZE - 1 downto 0);

signal y0 : unsigned(WORD_SIZE - 1 downto 0);
signal y1 : unsigned(WORD_SIZE - 1 downto 0);
signal y2 : unsigned(WORD_SIZE - 1 downto 0);
signal y3 : unsigned(WORD_SIZE - 1 downto 0);

signal add_y0_y3 : unsigned(WORD_SIZE - 1 downto 0);
signal add_z1_y0 : unsigned(WORD_SIZE - 1 downto 0);
signal add_z2_z1 : unsigned(WORD_SIZE - 1 downto 0);
signal add_z3_z2 : unsigned(WORD_SIZE - 1 downto 0);

alias z0 : unsigned(WORD_SIZE - 1 downto 0);
alias z1 : unsigned(WORD_SIZE - 1 downto 0);
alias z2 : unsigned(WORD_SIZE - 1 downto 0);
alias z3 : unsigned(WORD_SIZE - 1 downto 0);


quater_round : process(SYS_CLK)
begin
	if (SYS_CLK'event and SYS_CLK = '1') then
		if RST = '0' then
			y0 <= others => '0';
			y1 <= others => '0';
			y2 <= others => '0';
			y3 <= others => '0';
		elsif (CONTROL = '01') then
			y0 <= unsigned(data);
			y1 <= unsigned(data);
			y2 <= unsigned(data);
			y3 <= unsigned(data);
		elsif (CONTROL = '10' or CONTROL = '11') then
			y0 <= z0;
			y1 <= z1;
			y2 <= z2;
			y3 <= z3;
		end if;
	end if;
-- -----------
-- Async Signals
-- -----------
add_y0_y3 <= y0 + y3;
add_z1_y0 <= z1 + y0;
add_z2_z1 <= z2 + z1;
add_z3_z2 <= z3 + z2;

z0 <= y0 xor (add_z3_z2((WORD_SIZE -1) - 18 downto 0) & add_z3_z2(WORD_SIZE -1 downto WORD_SIZE - 18));
z1 <= y1 xor (add_y0_y3((WORD_SIZE -1) - 7 downto 0) & add_y0_y3(WORD_SIZE -1 downto WORD_SIZE - 7));
z2 <= y2 xor (add_z1_y0((WORD_SIZE -1) - 9 downto 0) & add_z1_y0(WORD_SIZE -1 downto WORD_SIZE - 9));
z3 <= y3 xor (add_z2_z1((WORD_SIZE -1) - 13 downto 0) & add_z2_z1(WORD_SIZE -1 downto WORD_SIZE - 13));


function QuaterRound(y0, y1, y2, y3 : std_logic_vector(WORD_SIZE -1 downto 0)) return std_logic_vector is
	variable y0_u, y1_u, y2_u, y3_u : unsigned(WORD_SIZE - 1 downto 0);
	variable add_y0_y3 : unsigned(WORD_SIZE - 1 downto 0);
	variable add_z1_y0 : unsigned(WORD_SIZE - 1 downto 0);
	variable add_z2_z1 : unsigned(WORD_SIZE - 1 downto 0);
	variable add_z3_z2 : unsigned(WORD_SIZE - 1 downto 0);
	variable z0, z1, z2, z3 : unsigned(WORD_SIZE - 1 downto 0);
	variable z_output : std_logic_vector((WORD_SIZE*4) - 1 downto 0);
begin
	y0_u := unsigned(y0); 	
	y1_u := unsigned(y1); 
	y2_u := unsigned(y2); 
	y3_u := unsigned(y3);
	add_y0_y3 := y0_u + y3;
	add_z1_y0 := z1 + y0_u;
	add_z2_z1 := z2 + z1;
	add_z3_z2 := z3 + z2; 	 
	z0 := y0_u xor (add_z3_z2((WORD_SIZE -1) - 18 downto 0) & add_z3_z2(WORD_SIZE -1 downto WORD_SIZE - 18));
	z1 := y1_u xor (add_y0_y3((WORD_SIZE -1) - 7 downto 0) & add_y0_y3(WORD_SIZE -1 downto WORD_SIZE - 7));
	z2 := y2_u xor (add_z1_y0((WORD_SIZE -1) - 9 downto 0) & add_z1_y0(WORD_SIZE -1 downto WORD_SIZE - 9));
	z3 := y3_u xor (add_z2_z1((WORD_SIZE -1) - 13 downto 0) & add_z2_z1(WORD_SIZE -1 downto WORD_SIZE - 13));
	
	z_output := std_logic_vector(z3) & std_logic_vector(z2) & std_logic_vector(z1) & std_logic_vector(z0)
	return z_output;

end QuaterRound;


function RowRound (word_state : ARRAY_4X4_WORDSIZE) return ARRAY_4X4_WORDSIZE is
	variable z_out0, z_out1, z_out2, z_out3 : std_logic_vector((WORD_SIZE*4) -1 downto 0);
	variable z_out_array : ARRAY_4X4_WORDSIZE;
begin
	z_out0 = QuaterRound(word_state(0,0), word_state(0,1), word_state(0,2), word_state(0,3));
	z_out1 = QuaterRound(word_state(1,0), word_state(1,1), word_state(1,2), word_state(1,3));
	z_out2 = QuaterRound(word_state(2,0), word_state(2,1), word_state(2,2), word_state(2,3));
	z_out3 = QuaterRound(word_state(3,0), word_state(3,1), word_state(3,2), word_state(3,3));
	z_out_array = ((z_out0(WORD_SIZE - 1 downto 0), z_out0((WORD_SIZE*2) - 1 downto WORD_SIZE), z_out0((WORD_SIZE*3) - 1 downto (WORD_SIZE*2)), z_out0((WORD_SIZE*4) - 1 downto (WORD_SIZE*3))),
				   (z_out1(WORD_SIZE - 1 downto 0), z_out1((WORD_SIZE*2) - 1 downto WORD_SIZE), z_out1((WORD_SIZE*3) - 1 downto (WORD_SIZE*2)), z_out1((WORD_SIZE*4) - 1 downto (WORD_SIZE*3))),
				   (z_out2(WORD_SIZE - 1 downto 0), z_out2((WORD_SIZE*2) - 1 downto WORD_SIZE), z_out2((WORD_SIZE*3) - 1 downto (WORD_SIZE*2)), z_out2((WORD_SIZE*4) - 1 downto (WORD_SIZE*3))),
				   (z_out3(WORD_SIZE - 1 downto 0), z_out3((WORD_SIZE*2) - 1 downto WORD_SIZE), z_out3((WORD_SIZE*3) - 1 downto (WORD_SIZE*2)), z_out3((WORD_SIZE*4) - 1 downto (WORD_SIZE*3))));
	return z_out_array;
end RowRound;

function ColumnRound (word_state : ARRAY_4X4_WORDSIZE) return ARRAY_4X4_WORDSIZE is
	variable y_out0, y_out1, y_out2, y_out3 : std_logic_vector((WORD_SIZE*4) -1 downto 0);
	variable y_out_array : ARRAY_4X4_WORDSIZE;
begin
	y_out0 = QuaterRound(word_state(0,0), word_state(1,0), word_state(2,0), word_state(3,0));
	y_out1 = QuaterRound(word_state(0,1), word_state(1,1), word_state(2,1), word_state(3,1));
	y_out2 = QuaterRound(word_state(0,2), word_state(1,2), word_state(2,2), word_state(3,2));
	y_out3 = QuaterRound(word_state(0,3), word_state(1,3), word_state(2,3), word_state(3,3));

	y_out_array = ((y_out0(WORD_SIZE - 1 downto 0), y_out1(WORD_SIZE - 1 downto 0), y_out2(WORD_SIZE - 1 downto 0), y_out3(WORD_SIZE - 1 downto 0)),
					(y_out0((WORD_SIZE*2) - 1 downto WORD_SIZE), y_out1((WORD_SIZE*2) - 1 downto WORD_SIZE), y_out2((WORD_SIZE*2) - 1 downto WORD_SIZE), y_out3((WORD_SIZE*2) - 1 downto WORD_SIZE)),
				    (y_out0((WORD_SIZE*3) - 1 downto (WORD_SIZE*2)), y_out1((WORD_SIZE*3) - 1 downto (WORD_SIZE*2)), y_out2((WORD_SIZE*3) - 1 downto (WORD_SIZE*2)), y_out3((WORD_SIZE*3) - 1 downto (WORD_SIZE*2))), 
				    (y_out0((WORD_SIZE*4) - 1 downto (WORD_SIZE*3)), y_out1((WORD_SIZE*4) - 1 downto (WORD_SIZE*3)), y_out2((WORD_SIZE*4) - 1 downto (WORD_SIZE*3)), y_out3((WORD_SIZE*4) - 1 downto (WORD_SIZE*3)))), 

	return y_out_array;
end ColumnRound;