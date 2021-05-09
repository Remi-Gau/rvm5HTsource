#!/bin/bash

#------------------------------------------------------------------------------#

source_folder=`pwd`
target_folder=`pwd`

cells="A B C D E F G H I J K L"

runs=`seq 1 4`

subjects=`seq 56 308`

## Files
for i_subject in $subjects
do

    echo "\n\nProcessing subject ${i_subject}"

    sub_folder=$source_folder/sub-${i_subject}/ephys

    for i_cell in $cells
    do

        file=`ls ${sub_folder}/*.smr | grep ${i_cell}1.smr`

    if [ -z "$file" ]
    then
        echo "no file: ${i_subject}*${i_cell}1.smr"
        break

    else
        echo " Processing cell ${i_cell}"

        for i_run in $runs
        do

         
            smr_file=`ls ${sub_folder}/*.smr | grep ${i_cell}${i_run}`   
            
            if [ -z "$smr_file" ]
            then
                echo "no file: ${i_subject}*${i_cell}${i_run}.smr"
                break

            else
                echo "  processing run ${i_run}"

                target_name=sub-${i_subject}_sample-${i_cell}_run-${i_run}_ephys.smr
                echo $smr_file "-->" $sub_folder/$target_name
                mv -v $smr_file $sub_folder/${target_name}

                S2R_file=`echo $smr_file | sed s@smr@S2R@g`
                target_name=`echo $target_name | sed s@smr@S2R@g`
                echo $S2R_file "-->" $sub_folder/$target_name
                mv -v $S2R_file $sub_folder/${target_name}

            fi

        done        

    fi   

    done

    # # if spreadhsheet data we process that subject
    # xls_files=$source_folder/${i_subject}.xls
    # xls_files=`find $xls_files`

    # if [ -z "$xls_files" ]
    # then
    #     echo "no file: ${i_subject}.xls: skipping subject"

    # else

    #     echo "processing subject ${i_subject}"

    #     subject_folder=$target_folder/sub-${i_subject}
    #     target_name=sub-${i_subject}_scans.xls

    #     # mkdir -p $subject_folder/ephys

    #     # mv -v $xls_files $subject_folder/$target_name


    #     done
    # fi    

done
