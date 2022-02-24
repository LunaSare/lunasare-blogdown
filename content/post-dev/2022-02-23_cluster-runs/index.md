---
title: TIPS to run something on a cluster
author: Luna L. Sanchez-Reyes
date: "2022-02-23"

tags:
- Work
- Computation
- Teaching

---

# Running a job on a cluster

## If you are outside the cluster network, turn your VPN on!

For security, on most cluster you can only ssh into them from within their network.
If you are working from outside the cluster network, for example, from home, you
will have to start a VPN to connect from within the cluster network.

## ssh into the cluster

```
ssh USER-NAME@CLUSTER.ADDRESS
```

## Create a job submission script.

A submission script looks like this:

```
# copy that in your home folder and remove THIS first line
#! /bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#
#SBATCH --partition fast.q
#SBATCH --time=0-00:15:00     # 0days 15 minutes
#
#SBATCH --output=myjob_%j.stdout
#
#SBATCH --job-name=test
#SBATCH --export=ALL
# This submission file will run a simple set of commands. All stdout will be
# captured in mmyjob_XXXX.stdout (as specified in the Slurm command above).
# This job file uses a shared-memory parallel environment and requests 1 cores
# on a single node.This script loads PGI compiler module named "pgi"
whoami
module load pgi
```

## Submit the job

```
sbatch sample.sub
```

## Check your queue

```
squeue -u USER-NAME
```

## Find results of your job

```
cat JOB_IDNUMBER.stdout
```

## Use screen to leave work on the background

```
screen
screen -aD
```

## To finish the ssh connection press Ctrl + d

## copy a file form your computer into the server

```
scp local/file/address USER-NAME@CLUSTER.ADDRESS:/destinationfolder/
```

## Copy a file from the server back to your computer

From your own computer, do:

```
rsync USER-NAME@CLUSTER.ADDRESS:path/to/file/on/cluster/name .
```
