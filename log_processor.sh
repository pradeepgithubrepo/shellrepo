#!/bin/sh
#######################################################
# Script_name : log_processor.sh                      #
# Purpose     : Parse the logs and build a csv report #
# Invocation  : log_processor.sh <parm> <csv location># 
######################################################

parm_processor=/Users/pradeepp/Desktop/javasam/log_processing/parm_processor.csv
report_loc=/Users/pradeepp/Desktop/javasam/log_processing/log_analysis_report.csv
log_file_loc=/Users/pradeepp/Desktop/javasam/log_processing/logx1.log

OLDIFS=$IFS
IFS=','
[ ! -f $parm_processor ] && { echo "$parm_processor file not found"; exit 99; }
row_counter=1
declare -A parm_matrix
while read parm_pattern parm_start_pos parm_end_pos
do
    echo "Pattern :"$parm_pattern $row_counter
    parm_matrix[$row_counter,1]=$parm_pattern
    parm_matrix[$row_counter,2]=$parm_start_pos
    parm_matrix[$row_counter,3]=$parm_end_pos
    ((row_counter=row_counter+1))
done < $parm_processor
IFS=$OLDIFS

if [ ! -f $report_loc ]; then
echo "Job ID , Job start date , job end date" >> $report_loc
fi

#Resetting the IFS
IFS=$OLDIFS

while read log_line
do
echo "Log lie : $log_line"
for ((i=1;i<=row_counter;i++)) do
  check_pattern=${parm_matrix[$i,1]}
  echo "check_pattern : $check_pattern  $i"
  if [[ $log_line == *$check_pattern* ]]; then
  echo $log_line
  fi
done
done < $log_file_loc


