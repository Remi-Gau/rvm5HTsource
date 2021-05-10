#!/bin/bash

#------------------------------------------------------------------------------#

source_folder=`pwd`/no\_interest
target_folder=`pwd`

echo $source_folder

cd ${source_folder}

files=`ls *.xls`

## Files
for i_file in $files
do

    sub_label=`echo ${i_file} | sed s@\.xls@@g`

    echo "\n\nProcessing ${i_file}"
    echo $sub_label

    mkdir -p ../sub-${sub_label}
    mv ${sub_label}* ../sub-${sub_label}

done

cd ..