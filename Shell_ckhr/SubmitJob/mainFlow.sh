#!/bin/sh
set -ax
# same as r01 but add total UST
export RUN_ID=r09
# uses test500 case in Couple_Lib_grids_WW3_Dir=$Couple_Lib_grids_Dir/WW3/test500
export NCO=/usr/local/other/nco/5.0.1/bin

# starting time : YYYYS MMS DDS HHS
export YYYYS=2020
export MMS=01
export DDS=02
export HHS=00

# ending time : YYYYE MME DDE HHE
YYYYE=`echo $1 | cut -d':' -f1`
MME=`echo $1 | cut -d':' -f2`
DDE=`echo $1 | cut -d':' -f3`
HHE=`echo $1 | cut -d':' -f4`

export gridname=tpos1
export gridname2=tpos

# restart option; 
export RESTART=$2
export LastNHour=$3
### $2 RESTART = Yes or NO
### $3 LastNHour = Start Date if the run is restarted

#Number of CPUs used
# THIS NEED TO BE MATCHED IN THE SGL script and ocean.in file
export wrfNCPU=144
export romsNCPU=144
export ww3NCPU=144



# Compiler; intel or pgi
export FC=intel



#####--------------------- END OF USER DEFINITION -----------------------#####
echo "CF is $CF"
if [ $CPL_PHYS = WRF_PHYS ]; then
        echo "Use WRF's boudary layer physics!"
elif [ $CPL_PHYS = ROMS_PHYS ]; then
        echo "Use ROMS' Bulk formula"
fi
if [ $UaUo = yes ]; then
        echo "Ua-Uo is ON"
elif [ $UaUo = no ]; then
        echo "Ua-Uo is OFF"
fi
#####--------------------- END OF PRINT OUT -----------------------#####


# r07 or r09





#General OUTPUT Directories
for DIR in $Couple_Run_Dir $Couple_Data_Dir $Couple_Data_WRF_Dir $Couple_Data_ROMS_Dir $Couple_Data_tempo_files_Dir 
do 
        mkdir -p $DIR 2>/dev/null
done


#####--------------------- END OF EXPORT -----------------------#####

#COPY NECESSARY FILES



#####--------------------- END OF COPYING FILES  -----------------------#####

# COMPILE COUPLER CODES
# STARTING RUN
cd $Couple_Run_Dir || exit 8
        $Couple_Run_Dir/couple_with_ww3_restart.sh || exit 8
echo "DONE"
