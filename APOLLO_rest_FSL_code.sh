#!/bin/bash
APOLLO_rest_FSL(){

#=========================================================================
# TITLE: "Bash Script for resting state analysis, Version 0" 
# PURPOSE: Script for brain extracting resting state data (baseline) for APOLLO analysis . 
# Performs BET, ..........??????? 

# AUTHOR:  Rashed Sobhan
# CREATED: 23/12/2022
# LAST UPDATED: 
# VERSION HISTORY: 
#
# data directory: /gpfs/home/wae16sru/APOLLO_rest_FSL
# code directory: /gpfs/home/wae16sru/APOLLO_rest_FSL
# input:  
# output: 

#----------------SELECT WORKING DIRECTORY AND MRI DATA--------------------

# Error if function called with no arguments...
local val=${1:?Must provide at least one argument}
echo "$val"
subj_id="$@"

echo " extracting brain using BET ..."

#BET using threshold and repeated iteration for robust brain centre estimation 
/gpfs/software/ada/fsl/6.0.5.2b/bin/bet \
/gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W" \
/gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W_bet_robust" \
-R -f 0.4 -g 0


#bias plus neck cleanup (for data that has neck voxels)
#later, this process was found to be the better one 
/gpfs/software/ada/fsl/6.0.5.2b/bin/bet \
/gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W" \
/gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W_brain" \
-B -f 0.4 -g 0

echo "PROCESSING COMPLETE"

#fsleyes --scene ortho --worldLoc -3.2446556185434474 21.892641634247795 -29.09391603721238 --displaySpace /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W".nii.gz --xcentre  0.00000  0.00000 --ycentre -0.00000  0.00000 --zcentre -0.00000  0.00000 --xzoom 871.1569156918001 --yzoom 871.1569156918001 --zzoom 871.6977243594947 --showLocation no --layout horizontal --cursorWidth 1.0 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --colourBarSize 100.0 --labelSize 12 --performance 3 --movieSync /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W".nii.gz --name "$subj_id"_T1W"" --overlayType volume --alpha 100.0 --brightness 49.74999999999999 --contrast 49.90029860765409 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 1307.95 --clippingRange 0.0 1307.95 --modulateRange 0.0 1295.0 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 150 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W_brain".nii.gz --name "$subj_id"_T1W_brain"" --overlayType volume --alpha 100.0 --brightness 49.75000000000001 --contrast 49.90029860765409 --cmap green --negativeCmap greyscale --displayRange 0.0 387.84 --clippingRange 0.0 387.84 --modulateRange 0.0 384.0 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 150 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W_brain_no_bias+neck".nii.gz --name "$subj_id"_T1W_brain_no_bias+neck"" --overlayType volume --alpha 100.0 --brightness 49.75000000000001 --contrast 49.90029860765409 --cmap red --negativeCmap greyscale --displayRange 0.0 387.7434323120117 --clippingRange 0.0 387.7434323120117 --modulateRange 0.0 383.9043884277344 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 150 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

echo "LET'S SEE IT IN FSLEYES"

fsleyes --scene ortho --displaySpace /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/subj_id"_T1W".nii.gz  --showLocation no --layout horizontal --cursorWidth 1.0 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --colourBarSize 100.0 --labelSize 12 --performance 3 --movieSync /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W".nii.gz --overlayType volume --alpha 100.0 --brightness 49.75000000000001 --contrast 49.90029860765409 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 963.54 --clippingRange 0.0 963.54 --modulateRange 0.0 954.0 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 150 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W_brain".nii.gz --overlayType volume --alpha 100.0 --brightness 49.74999999999999 --contrast 49.90029860765409 --cmap green --negativeCmap greyscale --displayRange 0.0 408.04 --clippingRange 0.0 408.04 --modulateRange 0.0 404.0 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 150 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /gpfs/home/wae16sru/APOLLO_rest_FSL/$subj_id"_A"/anat/$subj_id"_T1W_brain_no_bias+neck".nii.gz --overlayType volume --alpha 100.0 --brightness 49.75000000000001 --contrast 49.90029860765409 --cmap red --negativeCmap greyscale --displayRange 0.0 371.2126037597656 --clippingRange 0.0 371.2126037597656 --modulateRange 0.0 367.5372314453125 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 150 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

}