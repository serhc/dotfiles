#!/bin/bash
# takes input file (json) and optional output file name
if [ -z $1 ]; then
  echo 'needs an input file'
  exit 1
else
  file_in=${1%.*}.json
fi

if [ -z $2 ]; then
  file_out=${1%.*}.csv
else
  file_out=${2%.*}.csv
fi

echo `cat $file_in |
  jq -r 'to_entries[] |
          [   .key
            , "-------------"
            , (.value | to_entries[] | [.key, .value] | @csv )
            , "=============" ] |
          .[]' |
  sed 's/"//g' |
  tee $file_out`
exit 0
