#!/bin/bash

current_dir=$(pwd)

working_dir=$1
if [[ $working_dir = "" ]]; then
  echo "Usage: ./diskspd.sh <target path>"
  exit 0
fi
cd $working_dir

# SEQ1M Q8T1
diskspd -c1G -Zr -b1M -d5 -o8 -t1 -W0 -Sd -w0   -L SEQ1M_Q8T1 2>&1 > $current_dir/SEQ1M_Q8T1_READ.log
diskspd      -Zr -b1M -d5 -o8 -t1 -W0 -Sd -w100 -L SEQ1M_Q8T1 2>&1 > $current_dir/SEQ1M_Q8T1_WRITE.log

# RND4K Q32T16
diskspd -c1G -Zr -b4K -d5 -o32 -t16 -W0 -Sd -w0   -L -r RND4K_Q32T16 2>&1 > $current_dir/RND4K_Q32T16_READ.log
diskspd      -Zr -b4K -d5 -o32 -t16 -W0 -Sd -w100 -L -r RND4K_Q32T16 2>&1 > $current_dir/RND4K_Q32T16_WRITE.log

