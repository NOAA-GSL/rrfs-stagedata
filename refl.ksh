#!/bin/ksh
#####################################################
# machine set up (users should change this part)
#####################################################

# For Hera, Jet, Orion
#SBATCH --account=zrtrr
#SBATCH --qos=batch
#SBATCH --ntasks=1
#SBATCH --partition=service
#SBATCH --time=08:00:00
#SBATCH --job-name=get_reflObs
#SBATCH -o log.reflObs

# For WCOSS2
#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=06:00:00
#PBS -N get_reflObs
#PBS -j oe -o log.reflObs

#--------------#
# reflectivity
#--------------# 
mkdir -p tmp
cd tmp

yy=2023
mm=06

for dd in $(seq -w 10 11); do

 # 2020-Jun. 2022
 #htar -xvf /NCEPPROD/hpssprod/runhistory/rh${yy}/${yy}${mm}/${yy}${mm}${dd}/dcom_prod_ldmdata_obs.tar ./upperair/mrms/conus/MergedReflectivityQC/MergedReflectivityQC_*_${yy}${mm}${dd}-*.grib2.gz

 # start from Jul. 2022, tar file name changed
 htar -xvf /NCEPPROD/hpssprod/runhistory/rh${yy}/${yy}${mm}/${yy}${mm}${dd}/dcom_ldmdata_obs.tar ./upperair/mrms/conus/MergedReflectivityQC/MergedReflectivityQC_*_${yy}${mm}${dd}-*.grib2.gz

 cd upperair/mrms/conus/MergedReflectivityQC
 for file in `ls MergedReflectivityQC_*_${yy}${mm}${dd}-*.grib2.gz  `
 do
   gzip -d ${file}
 done

 # return to tmp directory
 cd ../../../../

done

exit



