# reset_test
Reset demo for blog post

Source code and FuseSoC .core file for a [blog post about resets](https://olofkindgren.blogspot.com/2017/11/resetting-reset-handling.html).

To use this with FuseSoC, make sure that `fusesoc.conf` contains the path to the cloned repo, or launch with `fusesoc --cores-root=/path/to/repo`. Once that is done, you can simulate with `fusesoc sim reset_test`. Default simulator is Icarus Verilog. To change simulator add `--sim=<simulator>` after the `sim` argument, where `simulator is any of `icarus`, `isim`, `modelsim`, `rivierapro` or `xsim`. To add VCD generation add `--vcd` at the end of the command-line. To discover all options run `fusesoc sim reset_test --help`.

To build the design with vivado, run `fusesoc build reset_test`. The generated project file is available in `build/reset_test_0/bld_vivado/reset_test_0.xpr`

Have fun!



