FolderName="cache"

Generatelist(){
echo "Generatelist Start"
mkdir -p $FolderName
bash generateRequest.sh | sed -e '0~5 s/$/\nwait/g;'| sed -e '0~6 s/$/\nsleep 1/g;'| bash
cat $FolderName/reksainfo/* | jq -s 'flatten' > $FolderName/allReksadana.txt
cat $FolderName/allReksadana.txt | jq '[try .[] | {id_reksa: .id , symbol: .symbol,name: .name, type: .type ,robocategory: .robocategory, source: "bibit.id" }]' > $FolderName/reksa.txt
echo "Generatelist End"
}

GenerateFolder(){
echo "GenerateFolder Start"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed "s/^/mkdir -p $FolderName\/product\//"|bash
echo "GenerateFolder End"
}

GenerateProduct(){
#node ReksadanaInfo.js product RD68
echo "GenerateProduct Start"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/node ReksadanaInfo.js product /; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "GenerateProduct End"
}

GenerateProspectus(){
echo "GenerateProspectus Start"
# node ReksadanaInfo.js prospectus RD68
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js prospectus /; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "GenerateProspectus End"
}

GenerateFactsheets(){
echo "GenerateFactsheets Start"
#  node ReksadanaInfo.js factsheets RD68
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js factsheets /; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "GenerateFactsheets End"
}

GenerateSimulation(){
echo "GenerateSimulation Start"
#  node ReksadanaInfo.js simulation RD68
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js simulation /; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "GenerateSimulation End"
}

GenerateChart(){
echo "GenerateChart Start"
#  node ReksadanaInfo.js chart RD68 1y
#Avail range peroid for method "chart, aum":
#1D,1M,3M,YTD,1Y,3Y,5Y,10Y,ALL
echo "1D"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ 1D/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "1M"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ 1M/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "3M"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ 3M/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "YTD"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ YTD/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "1Y"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ 1Y/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "3Y"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ 3Y/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "5Y"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ 5Y/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "10Y"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ 10Y/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "ALL"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js chart /; s/$/ ALL/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "GenerateChart End"
}

GenerateAum(){
echo "GenerateAum Start"
#  node ReksadanaInfo.js aum RD68 1y
#Avail range peroid for method "chart, aum":
#1D,1M,3M,YTD,1Y,3Y,5Y,10Y,ALL
echo "1D"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ 1D/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "1M"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ 1M/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "3M"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ 3M/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "YTD"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ YTD/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "1Y"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ 1Y/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "3Y"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ 3Y/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "5Y"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ 5Y/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "10Y"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ 10Y/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "ALL"
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js aum /; s/$/ ALL/; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
wait
echo "GenerateAum End"
}

GenerateDividends(){
echo "GenerateDividends Start"
#   node ReksadanaInfo.js dividends RD68
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js dividends /; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "GenerateDividends End"
}

GenerateSwitchables(){
echo "GenerateSwitchables Start"
#   node ReksadanaInfo.js switchables RD68
cat $FolderName/allReksadana.txt | jq -r '.[].symbol' | sed 's/^/timeout 15 node ReksadanaInfo.js switchables /; s/$/ \&/' | sed -e '0~20 s/$/\nwait/g;'|bash
echo "GenerateSwitchables End"
}

### UNCOMMENT TO UNUSE FUNCTION ###
#Generatelist
#GenerateFolder
#GenerateProduct
#GenerateProspectus
#GenerateFactsheets
#GenerateSimulation
#GenerateChart
#GenerateAum
#GenerateDividends
#GenerateSwitchables
