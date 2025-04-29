#!/bin/bash
#SBATCH --job-name=mGPU
#SBATCH --nodes 1
#SBATCH --partition=gpu-a100
#SBATCH --gres=gpu:2
#SBATCH --time=2:00:00
## SBATCH --cpus-per-task=1
#SBATCH --ntasks=10
#SBATCH --mem-per-cpu=8192
#SBATCH -A punim1661
## Use an account that has GPGPU access

module purge
module load Julia/1.9.3-linux-x86_64

## julia multi_GPU_LES.jl
julia --project  distributed_nonhydrostatic_simulation.jl

##Job monitor command to list the resource usage
my-job-stats -a -n -s