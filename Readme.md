**WORK IN PROGRESS**


Behavioral VHDL Implementation of the [Salsa20](https://cr.yp.to/snuffle.html) Stream Cipher

Compilation/Simultation test suite using [GHDL](https://github.com/ghdl/ghdl) can be run:

`sh
./simulate.sh
`

In addition to reporting success/failure, a VCD file is output which can be rendered with tools such as
[Scansion](http://www.logicpoet.com/scansion/) and [GTKWave](http://gtkwave.sourceforge.net)

Test vectors taken from the [offical paper](https://cr.yp.to/snuffle/spec.pdf) and generated with Python [Salsa20 NaCl bindings](https://pypi.org/project/salsa20/)

### Complete
From the offical paper:
 - quarterround function
 - rowround function
 - columnround function
 - doubleround function
 - Salsa20 Hash Function 
 - Salsa20 Expansion Function 
 - Salsa20 Encryption Function
 
 ### TODO
- Setup logic
- Count Increment
- Input/Output
- Message XOR








