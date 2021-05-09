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

## Files
for i_subject in $subjects
do

    echo "\n"

    # if spreadhsheet data we process that subject
    xls_files=$source_folder/${i_subject}.xls
    xls_files=`find $xls_files`

    if [ -z "$xls_files" ]
    then
        echo "no file: ${i_subject}.xls: skipping subject"
    else

        echo "processing subject ${i_subject}"

        subject_folder=$target_folder/sub-${i_subject}
        target_name=sub-${i_subject}_scans.xls

        mkdir -p $subject_folder/ephys

        if $copy_files ;  then 
            cp -v $xls_files $subject_folder/$target_name
        else 
            echo $xls_files "-->" ${target_name}
            touch ${target_name}
        fi

        for i_cell in $cells
        do

            file=`ls $source_folder/${i_subject}*.smr | grep ${i_cell}1`

            if [ -z "$file" ]
            then
                echo "no file: ${i_subject}*${i_cell}1.smr"
                break
            else
                echo " processing cell ${i_cell}"
            fi                      

            for i_run in $runs
            do

                smr_file=`ls $source_folder/${i_subject}*.smr | grep ${i_cell}${i_run}`   
                
                if [ -z "$smr_file" ]
                then
                    echo "no file: ${i_subject}*${i_cell}${i_run}.smr"
                    break
                else
                   echo "  processing run ${i_run}"

                   target_name=sub-${i_subject}_sample-${i_cell}_run-${i_run}_ephys.smr
                   echo $smr_file "-->" ${target_name}
                   touch $subject_folder/ephys/${target_name}

                   S2R_file=`echo $smr_file | sed s@smr@S2R@g`
                   target_name=`echo $target_name | sed s@smr@S2R@g`
                   echo $S2R_file "-->" ${target_name}
                   touch $subject_folder/ephys/${target_name}
                fi

            done

        done
    fi    

done
