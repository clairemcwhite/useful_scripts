#!/bin/bash
#SBATCH -J job1           # job name
#SBATCH -o job1.o%j       # output and error file name (%j expands to jobID)
#SBATCH -n 30              # total number of mpi tasks requested
#SBATCH -p normal    # queue (partition) -- normal, development, etc.
#SBATCH -t 5:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=[your email]
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes
#SBATCH -A [allocation code]          # Specify allocation to charge against

### This template is for running commands in parallel on TACC Lone Star 5 as of 2017
### The commands file has one command per line

### Put the name of your commands file here.
export CONTROL_FILE=commands.txt


### Nothing needs to change below here
module load launcher;
export EXECUTABLE=$TACC_LAUNCHER_DIR/init_launcher
export WORKDIR=.
cd $WORKDIR;
$TACC_LAUNCHER_DIR/paramrun $EXECUTABLE $CONTROL_FILE;
