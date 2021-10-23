mkdir -p cache/reksainfo
for i in `seq -w 1 90`
do
 echo " node ReksadanaInfo.js \"list\" $i &" 
done