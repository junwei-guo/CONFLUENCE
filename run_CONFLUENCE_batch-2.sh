#!/bin/bash
#SBATCH --job-name=CAN_01AD003_macro
#SBATCH --time=96:00:00
#SBATCH --ntasks=20
#SBATCH --mem=20G
#SBATCH --account=ees250064

# Load necessary modules (adjust as needed for your HPC environment)
# module restore confluence_modules
module load  conda/2024.09  mpfr/4.0.2  gcc/11.2.0   zlib/1.2.11  netlib-lapack/3.8.0  openmpi/4.1.6  netcdf-c/4.7.4  openblas/0.3.17 gmp/6.2.1    mpc/1.1.0  libszip/2.1.1  hdf/4.2.15  numactl/2.0.14   hdf5/1.10.7  netcdf-fortran/4.5.3

# Activate your Python environment if necessary
conda activate confluence

# Run the Python script
python CONFLUENCE.py --config config_CAN_01AD003_macro.yaml >> run.log

echo "CONFLUENCE job complete"
