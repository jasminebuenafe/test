#!/bin/bash

echo enter url
read url
echo enter intended pipe name
read pipe_name
python url2pipe.py  "$url" | cut -f2 -d"|"  > 2.$$



grep  "/$"   2.$$  > 1.$$
mv  1.$$  junk.$$.urls

md5sum  junk.$$.urls
wc      junk.$$.urls


rm junk.$$.pipe

for url in `cat junk.$$.urls`; do 
echo "********************************"
echo WORKING on $url
python url2pipe.py "$url"  >> junk.$$.pipe; 
sleep 5
echo DONE
echo

done
# tail -f horror.pipe 
egrep -i "mp3|mp4|m3u8|mkv" junk.$$.pipe > junk.$$.tmp
mv junk.$$.tmp   $pipe_name
echo $pipe_name is done

rm junk.$$.pipe junk.$$.urls



