#!/usr/bin/env bash

# Root directory for the tmp dir.
tmpdir_root=/p3700/chia
# Final dir.
finaldir=/hdd1/chia
# Number of jobs to run in parallel.
num_jobs=2
# How long to wait for a job to complete before killing it.
time_limit=330m
# How many seconds to stagger the job starts.
sleep_seconds=100

mt="multitail -s ${num_jobs}"
for (( i=0; i<num_jobs; i++ )); do
  tmpdir=${tmpdir_root}/${i}
  while true; do rm -fr ${tmpdir}; timeout ${time_limit} chia plots create -t${tmpdir} -d${finaldir}; done &> "${i}".log &
  if (( i < num_jobs - 1 )); then
    sleep ${sleep_seconds}
  fi
  mt="${mt} -cT ansi ${i}.log"
done
${mt}
