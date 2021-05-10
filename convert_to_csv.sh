#!/bin/bash

#------------------------------------------------------------------------------#

source_folder=`pwd`
target_folder=`pwd`

subjects=`ls -d sub-*`

## Files
for iSubject in $subjects
do

    sub_label=`echo ${iSubject} | sed s@sub-@@g`

    echo "\nProcessing ${iSubject}"
    xls_file=`ls ${iSubject}/${sub_label}*.xls | grep [0-9].xls`

    # needs to be installed via: apt-get install gnumeric
    # https://stackoverflow.com/questions/10557360/convert-xlsx-to-csv-in-linux-with-command-line
    ssconvert ${xls_file} ${iSubject}/sub-${sub_label}.csv

done

cd ..