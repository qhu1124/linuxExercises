#!/bin/bash
cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d',' -f7 | \
{ 
  sum=0; 
  count=0; 
  while read value; do 
    sum=$((sum + value)); 
    count=$((count + 1)); 
  done; 
  echo "average totalAssessedValue for properties in MADISON SCHOOLS = $((sum / count))"; 
}
