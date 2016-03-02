set logging file gdb.log
set logging on
set pagination off
set breakpoint pending on
set scheduler-locking step

file ls
set args

source gdb.bp

run
