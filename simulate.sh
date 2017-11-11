#!/bin/sh
ghdl -a salsa20_functions.vhd
ghdl -a salsa20_tests.vhd
ghdl -a salsa20_tests_TB.vhd
ghdl -e SALSA20_TESTS_TB
ghdl -r SALSA20_TESTS_TB --vcd=salsa20.vcd