@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim spiHwTest_behav -key {Behavioral:spiHw_sim:Functional:spiHwTest} -tclbatch spiHwTest.tcl -view C:/Users/Gerik/Documents/sha-256/spiHwTest_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
