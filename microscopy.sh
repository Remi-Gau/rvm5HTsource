#!/bin/bash

#------------------------------------------------------------------------------#

# set to "true" delete all data from previous conversion run
clean_previous_run=true

# set to "true" to actually copy the files
# otherwise it will do a dry run create dummy files with "touch"
copy_files=true

source_folder=`pwd`/source
target_folder=`pwd`/source

subjects=`seq 110 308`

cells="A B C D E F G H I J K L"

runs=`seq 1 4`


if $clean_previous_run ;  then 
  rm log.txt
  rm -rf $source_folder/sub*
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
    cd ..

    if [ -z "$xls_file" ]
    then
        echo "no xls file: skipping $i_folder"

    else

        subject_label=`echo $xls_file | awk '{print $1}' | sed s@-@@g`
        subject_label=`printf "%03d" $subject_label`
        
        echo $xls_file '-->' $subject_label

        subject_folder=$target_folder/sub-${subject_label}

        mkdir -p $subject_folder/microscopy
        mkdir -p $subject_folder/ephys

        # files=`find ${i_folder} | grep .psd`
        # for i_file in $files
        # do
        #     echo $i_file
        # done

        extensions="smr S2R srf sxy"
        for i_ext in $extensions
        do
            mv ${i_folder}/*.${i_ext} $subject_folder/ephys
            mv ${i_folder}/*/*.${i_ext} $subject_folder/ephys
        done

        extensions="psd tif jpg FH11 tiff"
        for i_ext in $extensions
        do
            mv ${i_folder}/*.${i_ext} $subject_folder/microscopy
            mv ${i_folder}/*/*.${i_ext} $subject_folder/microscopy
        done

        target_name=sub-${subject_label}_scans.xls

        mv ${i_folder}/*.xls $subject_folder
        mv ${i_folder}/*/*.xls $subject_folder

        mv ${i_folder}/* $subject_folder
    fi

done

# remove all empty folders
find $source_folder -type d -empty -delete

