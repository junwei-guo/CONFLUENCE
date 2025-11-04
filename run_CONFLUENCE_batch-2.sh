#!/bin/bash
#SBATCH --job-name=CAN_01AD003_macro
#SBATCH --time=2:00:00
#SBATCH --ntasks=100
#SBATCH --mem-per-cpu=3500M
#SBATCH --account=rrg-mclark

module purge --force
module load StdEnv/2023
module load gcc/12.3
module load openmpi/4.1.5
module load python/3.11.5
module load netcdf/4.9.2
module load mpi4py/4.0.3
module load gdal/3.9.1
module load r/4.5.0
module load cdo/2.2.2
module load netcdf-fortran/4.6.1
module load openblas/0.3.24

#conda env create -f environment.yaml

# Activate your Python environment if necessary
#conda activate confluence
source venv/bin/activate

# Install additional python modules
#python -m pip install --no-binary=mpi4py mpi4py




CORES=${SLURM_NTASKS}
echo "Running on $CORES cores."
echo "Starting at `date`"

# Run the Python script

python -c "from CONFLUENCE import CONFLUENCE; cf = CONFLUENCE(\"config_CAN_01AD003_macro.yaml\"); cf.managers['optimization'].calibrate_model(); "   >> sbatch-DDS-$CORES-${SLURM_JOB_ID}.log

#python CONFLUENCE.py --config config_CAN_01AD003_macro.yaml >> run.log
echo "Finished at `date`"

echo "CONFLUENCE job complete"
