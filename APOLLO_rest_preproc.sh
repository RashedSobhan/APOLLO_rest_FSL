#!/bin/bash 


########## After running "APOLLO_rest_FSL_code.sh", run this#################

module load fsl 

# Generate the subject list to make modifying this script
# to run just a subset of subjects easier.

#for id in `seq -w 001 003` ; do
#for id in `seq -w 007 2 015` ; do
#for id in `seq -w 016 2 018` ; do
#for id in `seq -w 019 025` ; do
#for id in `seq -w 028 031` ; do
#for id in `seq -w 035 036` ; do
#for id in `seq -w 041 042` ; do
#for id in `seq -w 045 2 049` ; do
#for id in `seq -w 018 019`; do
#for id in 002 023 038; do
#for id in 013 020; do
for id in 007 015 024 025; do



    	subj="sub_$id"
    
    	echo "===> Starting processing of $subj"_A" "
    	echo
    	cd /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj"_A"
        
        # If the brain mask doesn’t exist, create it
        #if [ ! -f anat/${subj}_T1w_brain.nii.gz ]; then
            #echo "Skull-stripped brain not found, using bet with a fractional intensity threshold of 0.4"
            # Note: This fractional intensity appears to work well for most of the subjects in the
            # Flanker dataset. You may want to change it if you modify this script for your own study.
            # bet2 anat/${subj}_T1w.nii.gz \
                #anat/${subj}_T1w_brain.nii.gz -f 0.4
        #fi

        # Copy the design files into the subject directory, and then
        # change “sub-08” to the current subject number
        cp /gpfs/home/wae16sru/APOLLO_rest_FSL/design.fsf .
        

        # Note that we are using the | character to delimit the patterns
        # instead of the usual / character because there are / characters
        # in the pattern.
	# the following line is modified from original code from DT to follow the file pattern created by RS        
	sed -i "s|sub_001|$subj|g" design.fsf   
        
        # Now everything is set up to run MELODIC
       	echo "===> Starting MELODIC for ICA"
        feat design.fsf
        
    # Go back to the directory containing all of the subjects, and repeat the loop
    	cd ..
     
    	
done

echo
