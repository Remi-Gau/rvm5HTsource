#!/bin/bash

#------------------------------------------------------------------------------#

source_folder=`pwd`
target_folder=`pwd`

subjects=`seq 110 308`

## Files
for i_subject in $subjects
do

    subject_folder=$target_folder/sub-${i_subject}

    mkdir -p $subject_folder/ephys

    mv -v $source_folder/${i_subject}*.xls $subject_folder
    mv -v $source_folder/${i_subject}*.smr $subject_folder/ephys
    mv -v $source_folder/${i_subject}*.S2R $subject_folder/ephys

done

find $source_folder -type d -empty -delete