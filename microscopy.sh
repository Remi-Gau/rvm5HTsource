#!/bin/bash

#------------------------------------------------------------------------------#

# set to "true" delete all data from previous conversion run
clean_previous_run=true

# set to "true" to actually copy the files
# otherwise it will do a dry run create dummy files with "touch"
copy_files=true

source_folder=`pwd`
target_folder=`pwd`

subjects=`seq 110 308`

cells="A B C D E F G H I J K L"

runs=`seq 1 4`


if $clean_previous_run ;  then 
  rm log.txt
  rm -rf sub*
  #  prepare participants.tsv
#   echo "participant_id\tgroup\tsite" > $participants_file
fi


## Folders
folders=`find $source_folder -mindepth 1 -maxdepth 1 -type d | sort`

for i_folder in $folders
do

    echo "\n $i_folder"

    cd ${i_folder}

    xls_file=`ls *-*.xls`

    if [ -z "$xls_file" ]
    then
        echo "no xls file: skipping $i_folder"

    else
        subject_label=`echo $xls_file | awk '{print $1}' | sed s@-@@g`
        cd ..
        echo $xls_file '-->' $subjsubject_labelect_number

        mkdir -p sub-$subject_label/microscopy
        mv ${i_folder} sub-$subject_label/microscopy

    fi

done

