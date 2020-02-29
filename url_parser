#!/bin/sh
#######################################################
# Script_name : urlparser.sh                      #
# Purpose     : Parse the logs and build a csv report #
# Invocation  : log_processor.sh <parm> <csv location># 
######################################################

tmp_xml_res_loc="/Users/pradeepp/Desktop/javasam/log_processing/res.xml"
apiresponse=$(curl -sb -H "Accept: */*" "https://gorest.co.in/public-api/users?_format=xml&access-token=VURD3Ga5FVXyULMsYgBedesdgaXiUGn-wejc")
echo "Response from server"
echo $apiresponse > $tmp_xml_res_loc
HOST=$(xmllint --xpath 'string(/response/_meta/totalCount)' $tmp_xml_res_loc)
echo $HOST
