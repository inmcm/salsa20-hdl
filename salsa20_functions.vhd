library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.ALL;

package SALSA20_FUNCTIONS is

constant WORD_SIZE: integer range 0 to 32 := 32;
type ARRAY_4X1_WORDSIZE is array (0 to 3) of std_logic_vector(WORD_SIZE - 1 downto 0); 
type ARRAY_4X4_WORDSIZE is array (0 to 3, 0 to 3) of std_logic_vector(WORD_SIZE - 1 downto 0);

-- Define constants
constant sigma_0 : std_logic_vector(WORD_SIZE - 1 downto 0) := X"61707865";
constant sigma_1 : std_logic_vector(WORD_SIZE - 1 downto 0) := X"3320646e";
constant sigma_2 : std_logic_vector(WORD_SIZE - 1 downto 0) := X"79622d32";
constant sigma_3 : std_logic_vector(WORD_SIZE - 1 downto 0) := X"6b206574"; 
-- If k0 , k1 , n are 16-byte sequences then Salsa20k0 ,k1 (n) = Salsa20(o0, k0, o1, n, o2, k1, o3).


constant tau_0  : std_logic_vector(WORD_SIZE - 1 downto 0) := X"61707865";
constant tau_1  : std_logic_vector(WORD_SIZE - 1 downto 0) := X"3120646e";
constant tau_2  : std_logic_vector(WORD_SIZE - 1 downto 0) := X"79622d36";
constant tau_3  : std_logic_vector(WORD_SIZE - 1 downto 0) := X"6b206574";
--If k, n are 16-byte sequences then Salsa20k (n) = Salsa20(t0, k, t1, n, t2, k, t3).

function QuarterRound(y0, y1, y2, y3 : std_logic_vector(WORD_SIZE -1 downto 0)) return ARRAY_4X1_WORDSIZE;
function RowRound (y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15 : std_logic_vector(WORD_SIZE-1 downto 0)) return ARRAY_4X4_WORDSIZE;
function ColumnRound (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15 : std_logic_vector(WORD_SIZE-1 downto 0)) return ARRAY_4X4_WORDSIZE;
function DoubleRound (x00, x01, x02, x03, x04, x05, x06, x07, x08, x09, x10, x11, x12, x13, x14, x15 : std_logic_vector(WORD_SIZE-1 downto 0)) return ARRAY_4X4_WORDSIZE;

end SALSA20_FUNCTIONS;

package body SALSA20_FUNCTIONS is

-- function QuarterRound(y0, y1, y2, y3 : std_logic_vector(WORD_SIZE-1 downto 0)) return std_logic_vector is
function QuarterRound(y0, y1, y2, y3 : std_logic_vector(WORD_SIZE-1 downto 0)) return ARRAY_4X1_WORDSIZE is
	variable y0_u, y1_u, y2_u, y3_u : unsigned(WORD_SIZE - 1 downto 0);
	variable add_y0_y3 : unsigned(WORD_SIZE - 1 downto 0);
	variable add_z1_y0 : unsigned(WORD_SIZE - 1 downto 0);
	variable add_z2_z1 : unsigned(WORD_SIZE - 1 downto 0);
	variable add_z3_z2 : unsigned(WORD_SIZE - 1 downto 0);
	variable z0, z1, z2, z3 : unsigned(WORD_SIZE - 1 downto 0);
	variable z_output : ARRAY_4X1_WORDSIZE;
begin
    y0_u := unsigned(y0); 	
    y1_u := unsigned(y1); 
    y2_u := unsigned(y2); 
    y3_u := unsigned(y3);
    add_y0_y3 := y0_u + y3_u;
	z1 := y1_u xor (add_y0_y3((WORD_SIZE -1) - 7 downto 0) & add_y0_y3(WORD_SIZE -1 downto WORD_SIZE - 7));
    add_z1_y0 := z1 + y0_u;
	z2 := y2_u xor (add_z1_y0((WORD_SIZE -1) - 9 downto 0) & add_z1_y0(WORD_SIZE -1 downto WORD_SIZE - 9));
    add_z2_z1 := z2 + z1;
	z3 := y3_u xor (add_z2_z1((WORD_SIZE -1) - 13 downto 0) & add_z2_z1(WORD_SIZE -1 downto WORD_SIZE - 13));
    add_z3_z2 := z3 + z2; 	 
    z0 := y0_u xor (add_z3_z2((WORD_SIZE -1) - 18 downto 0) & add_z3_z2(WORD_SIZE -1 downto WORD_SIZE - 18));
    z_output := (std_logic_vector(z0), std_logic_vector(z1), std_logic_vector(z2), std_logic_vector(z3));
    return z_output;
end QuarterRound;


function RowRound (y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15 : std_logic_vector(WORD_SIZE-1 downto 0)) return ARRAY_4X4_WORDSIZE is
	variable z_out0, z_out1, z_out2, z_out3 : ARRAY_4X1_WORDSIZE;
	variable z_out_array : ARRAY_4X4_WORDSIZE;
begin

	z_out0 := QuarterRound(y0, y1, y2, y3);
	z_out1 := QuarterRound(y5, y6, y7, y4);
	z_out2 := QuarterRound(y10, y11, y8, y9);
	z_out3 := QuarterRound(y15, y12, y13, y14);
	z_out_array := ((z_out0(0), z_out0(1), z_out0(2), z_out0(3)),
				    (z_out1(3), z_out1(0), z_out1(1), z_out1(2)),
				    (z_out2(2), z_out2(3), z_out2(0), z_out2(1)),
				    (z_out3(1), z_out3(2), z_out3(3), z_out3(0)));
	return z_out_array;
end RowRound;


function ColumnRound (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15 : std_logic_vector(WORD_SIZE-1 downto 0)) return ARRAY_4X4_WORDSIZE is
	variable z_out0, z_out1, z_out2, z_out3 : ARRAY_4X1_WORDSIZE;
	variable z_out_array : ARRAY_4X4_WORDSIZE;
begin
	z_out0 := QuarterRound(x0, x4, x8, x12);
	z_out1 := QuarterRound(x5, x9, x13, x1);
	z_out2 := QuarterRound(x10, x14, x2, x6);
	z_out3 := QuarterRound(x15, x3, x7, x11);

	z_out_array := ((z_out0(0), z_out1(3) ,z_out2(2) ,z_out3(1)),
					(z_out0(1), z_out1(0) ,z_out2(3) ,z_out3(2)),
				    (z_out0(2), z_out1(1) ,z_out2(0) ,z_out3(3)), 
				    (z_out0(3), z_out1(2) ,z_out2(1) ,z_out3(0))); 

	return z_out_array;
end ColumnRound;



function DoubleRound (x00, x01, x02, x03, x04, x05, x06, x07, x08, x09, x10, x11, x12, x13, x14, x15 : std_logic_vector(WORD_SIZE-1 downto 0)) return ARRAY_4X4_WORDSIZE is
	variable cround_out, rround_out : ARRAY_4X4_WORDSIZE;
begin

	cround_out := ColumnRound(x00, x01, x02, x03,
				   			  x04, x05, x06, x07,
				   			  x08, x09, x10, x11,
				   			  x12, x13, x14, x15);
	rround_out := RowRound(cround_out(0,0), cround_out(0,1), cround_out(0,2), cround_out(0,3),
						   cround_out(1,0), cround_out(1,1), cround_out(1,2), cround_out(1,3), 
						   cround_out(2,0), cround_out(2,1), cround_out(2,2), cround_out(2,3),
						   cround_out(3,0), cround_out(3,1), cround_out(3,2), cround_out(3,3));

	return rround_out;
end DoubleRound;

end SALSA20_FUNCTIONS;