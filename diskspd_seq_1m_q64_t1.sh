#!/bin/bash

current_dir=$(pwd)

working_dir=$1
if [[ $working_dir = "" ]]; then
  echo "Usage: ./diskspd.sh <target path>"
  exit 0
fi
cd $working_dir

# SEQ1M Q64T1
diskspd -c1G -Zr -b1M -d5 -o64 -t1 -W0 -Sd -w0   -L SEQ1M_Q64T1 2>&1 > $current_dir/SEQ1M_Q64T1_READ.log
diskspd      -Zr -b1M -d5 -o64 -t1 -W0 -Sd -w100 -L SEQ1M_Q64T1 2>&1 > $current_dir/SEQ1M_Q64T1_WRITE.log
