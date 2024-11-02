#!/bin/bash

current_dir=$(pwd)

working_dir=$1
if [[ $working_dir = "" ]]; then
  echo "Usage: ./diskspd.sh <target path>"
  exit 0
fi
cd $working_dir

# SEQ4K Q64T1
diskspd -c1G -Zr -b4K -d30 -o64 -t1 -W0 -Sd -w0   -L SEQ4K_Q64T1 2>&1 > $current_dir/SEQ4K_Q64T1_READ.log
diskspd      -Zr -b4K -d30 -o64 -t1 -W0 -Sd -w100 -L SEQ4K_Q64T1 2>&1 > $current_dir/SEQ4K_Q64T1_WRITE.log
