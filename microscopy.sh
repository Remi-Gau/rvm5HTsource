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
folders=`find $source_folder -maxdepth 1 -type d | sort`

for i_folder in $folders
do

    xls_file=`ls ${i_folder}/*\ -\ *.xls`
    echo $xls_file

done

