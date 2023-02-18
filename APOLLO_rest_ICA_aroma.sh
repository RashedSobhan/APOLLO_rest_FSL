#!/bin/bash 


######After doing APOLLO_rest_FSL_code (BET) and then APOLLO_rest_preproc (FEAT)######

#=========================================================================
# TITLE: "Bash Script for resting state analysis, Version 0" 
# PURPOSE: Script for autiomatic ICA componenbt detection using ICA AROMA for APOLLO analysis . 
# Performs 
# AUTHOR:  Rashed Sobhan
# CREATED: 02/01/2023
# LAST UPDATED: 
# VERSION HISTORY: 
#
# data directory: /gpfs/home/wae16sru/APOLLO_rest_FSL
# code directory: /gpfs/home/wae16sru/APOLLO_rest_FSL
# input:  
# output: 


cd  /gpfs/home/wae16sru/APOLLO_rest_FSL/sub_001_A/sub_001_A_rest.feat

/gpfs/software/ada/python/anaconda/2020.11/3.8/bin/python  /gpfs/home/wae16sru/APOLLO_rest_FSL/ICA-AROMA-master/ICA_AROMA.py \
-in /gpfs/home/wae16sru/APOLLO_rest_FSL/sub_001_A/sub_001_A_rest.feat/filtered_func_data.nii.gz \
-out /gpfs/home/wae16sru/APOLLO_rest_FSL/sub_001_A/sub_001_A_rest.feat/ICA_AROMA \
-mc /gpfs/home/wae16sru/APOLLO_rest_FSL/sub_001_A/sub_001_A_rest.feat/mc/prefiltered_func_data_mcf.par \
-m /gpfs/home/wae16sru/APOLLO_rest_FSL/sub_001_A/sub_001_A_rest.feat/mask.nii.gz \
-affmat /gpfs/home/wae16sru/APOLLO_rest_FSL/sub_001_A/sub_001_A_rest.feat/reg/example_func2highres.mat \
-warp /gpfs/home/wae16sru/APOLLO_rest_FSL/sub_001_A/sub_001_A_rest.feat/reg/highres2standard_warp.nii.gz \
-md /gpfs/home/wae16sru/APOLLO_rest_FSL/sub_001_A/sub_001_A_rest.feat/filtered_func_data.ica







#######################Previous version (for sbatch submission, not working as python code is not taking the $subj###########

# Error if function called with no arguments...
#local val=${1:?Must provide at least one argument}
#echo "$val"
#subj_id="$@"

#module load python 
module load fsl
#cd /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"
#SUB_DIR="/gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/$subj_id"_A_rest.feat""

#SUB_DIR_str=$SUB_DIR

#/gpfs/software/ada/python/anaconda/2020.11/3.8/bin/python  /gpfs/home/wae16sru/APOLLO_rest_FSL/ICA-AROMA-master/ICA_AROMA.py \
#-in SUB_DIR/filtered_func_data.nii.gz \
#-out SUB_DIR/ICA_AROMA \
#-mc SUB_DIR/mc/prefiltered_func_data_mcf.par \
#-m SUB_DIR/mask.nii.gz \
#-affmat SUB_DIR/reg/example_func2highres.mat \
#-warp SUB_DIR/reg/highres2standard_warp.nii.gz \
#-md SUB_DIR/filtered_func_data.ica

#input_file=$SUB_DIR_str"/filtered_func_data.nii.gz"
#output_dir=$SUB_DIR_str"/sub_001_A_rest.feat/ICA_AROMA"
#mc_in=$SUB_DIR_str"/mc/prefiltered_func_data_mcf.par"
#m_in=$SUB_DIR_str"/mc/prefiltered_func_data_mcf.par"
#affmat_in=$SUB_DIR_str"/reg/example_func2highres.mat"
#warp_in=$SUB_DIR_str"/reg/highres2standard_warp.nii.gz"
#md_in=$SUB_DIR_str"/filtered_func_data.ica"

#/gpfs/software/ada/python/anaconda/2020.11/3.8/bin/python  /gpfs/home/wae16sru/APOLLO_rest_FSL/ICA-AROMA-master/ICA_AROMA.py \
#-in $SUB_DIR_str"/filtered_func_data.nii.gz" \
#-out $SUB_DIR_str"/ICA_AROMA" \
#-mc $SUB_DIR_str"/mc/prefiltered_func_data_mcf.par" \
#-m $SUB_DIR_str"/mask.nii.gz" \
#-affmat $SUB_DIR_str"/reg/example_func2highres.mat" \
#-warp $SUB_DIR_str"/reg/highres2standard_warp.nii.gz" \
#-md $SUB_DIR_str"/filtered_func_data.ica" 




#/gpfs/software/ada/python/anaconda/2020.11/3.8/bin/python  /gpfs/home/wae16sru/APOLLO_rest_FSL/ICA-AROMA-master/ICA_AROMA.py \
#-in input_file \
#-out output_dir \
#-mc mc_in \
#-m m_in \
#-affmat affmat_in \
#-warp warp_in \
#-md md_in 


