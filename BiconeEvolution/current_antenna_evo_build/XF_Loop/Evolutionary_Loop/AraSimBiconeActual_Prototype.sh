#In order to run AraSim in Parallel we will have to call a job for it by calling a script
#SBATCH -A PAS0654
#SBATCH -t 15:00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /fs/project/PAS0654/BiconeEvolutionOSC/BiconeEvolution/current_antenna_evo_build/XF_Loop/Evolutionary_Loop/scriptEOFiles/
#SBATCH -e /fs/project/PAS0654/BiconeEvolutionOSC/BiconeEvolution/current_antenna_evo_build/XF_Loop/Evolutionary_Loop/scriptEOFiles/
#cd into the AraSim directory
#cd /fs/project/PAS0654/BiconeEvolutionOSC/AraSim/
cd $AraSimDir
#this is the command in the XF script although I don't know if we can pass in variables from that script
#into this one like i and WorkingDir
#if in the job call we have
#sbatch -v num=$i

#WorkingDir=$1
#RunName=$2

source /fs/project/PAS0654/BiconeEvolutionOSC/new_root/new_root_setup.sh

#echo /fs/project/PAS0654/BiconeEvolutionOSC/AraSim/ARA_bicone6in_output.txt
echo $AraSimDir/ARA_bicone6in_output.txt

#./AraSim setup.txt 1 outputs/ /fs/project/PAS0654/BiconeEvolutionOSC/AraSim/ARA_bicone6in_output.txt > /fs/project/PAS0654/BiconeEvolutionOSC/BiconeEvolution/current_antenna_evo_build/XF_Loop/Evolutionary_Loop/Antenna_Performance_Metric/AraOut_ActualBicone.txt

./AraSim setup_many_nus.txt 1 outputs/ $AraSimDir/ARA_bicone6in_output.txt > $TMPDIR/AraOut_Actual_Bicone_10_18_Updated.txt

cd $TMPDIR


pbsdcp -g *  $WorkingDir

#cd $WorkingDir/Run_Outputs/$RunName/AraSimFlags

#cd /fs/project/PAS0654/BiconeEvolutionOSC/BiconeEvolution/current_antenna_evo_build/XF_Loop/Evolutionary_Loop/AraSimFlags/
#echo ARABicone > ARABicone.txt
#echo ARABicone_${Seeds} > ARABicone_${num}_${Seeds}.txt
