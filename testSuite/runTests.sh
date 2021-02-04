#!/usr/bin/bash

cd ../ptsrc
make scanner
cd ../testSuite
for file in * ; do
    if [ ${file: -3} == ".pt" ]
    then
        ssltrace "ptc -o1 -t1 -L ../ptsrc/lib/pt ${file}" ../ptsrc/lib/pt/scan.def -e > ${file%.*}.eOutput
    fi
done