#!/usr/bin/bash

##### Run this script from the command line while in the testSuite directory #####

cd ../ptsrc
make scanner
cd ../testSuite
for path in * ; do
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    echo $dirname
    for file in "$dirname"/*; do
        if [ ${file: -3} == ".pt" ]
        then
            ssltrace "ptc -o2 -t2 -L ../ptsrc/lib/pt ${file}" ../ptsrc/lib/pt/parser.def -e > ${file%.*}.eOutput
        fi
    done
done
