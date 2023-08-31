#!/bin/ksh --login
#####################################################
# machine set up (users should change this part)
#####################################################

#SBATCH --account=zrtrr
#SBATCH --qos=batch
#SBATCH --ntasks=1
#SBATCH --partition=service
#SBATCH --time=08:00:00
#SBATCH --job-name=get_sstObs
#SBATCH -o log.sstObs


#------#
# sst
#------# 

mkdir -p highres_sst
cd highres_sst

yy=2023
mm=06

for day in $(seq -w 09 10); do  
  hsi get /BMC/fdr/Permanent/${yy}/${mm}/${day}/grib/ftp/7/4/44/0_9331200_0/${yy}${mm}${day}0000.zip
  unzip ${yy}${mm}${day}0000.zip
  rm ${yy}${mm}${day}0000.zip
done

exit
