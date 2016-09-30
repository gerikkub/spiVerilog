@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim designWrapperTest_behav -key {Behavioral:designWrapperTest:Functional:designWrapperTest} -tclbatch designWrapperTest.tcl -view C:/Users/Gerik/Documents/sha-256/designWrapperTest_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
