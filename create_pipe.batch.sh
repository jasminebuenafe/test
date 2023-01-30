#!/bin/bash
#
#
# Enter List of URLS to processes


#IFS=$(echo "")
rm -f junk
for record in `cat url.list`
do

#echo Processing $record

title=`echo $record | cut -f1 -d"|"`
url=`echo $record | cut -f2 -d"|"`

#echo
echo "TITLE is $title"
echo "URL is $url"

outputfilepipe="$url".pipe

echo -e  "python url2pipe.py \"${url}\" | tail -n +2  > $title.pipe"  >> junk

echo
#python url2pipe.py "$url" > junk 

#cp -i junk ./archive/"$title".`date +%Y%M%d_%H%m`

#cp directdownload.pipe $outputfilepipe
done

echo cut and paste the out and run it
read
echo continue
#egrep -i "mp4|mkv|mp3" junk > junk1
cat junk 


