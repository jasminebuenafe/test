#!/bin/bash
echo
echo Create PIPE file from URL
echo
echo Enter URL
read url
echo Enter Output File Name without pipe
read outputfile
outputfilepipe=$outputfile.pipe
##################################################################
## python url2pipe.py $url > $OUTPUT
python url2pipe.py $url > directdownload.pipe
cp -v directdownload.pipe /tmp/$outputfilepipe.`date +%Y%M%d_%H%m`

#egrep -i "mkv|mp4" directdownload.pipe > $outputfilepipe

egrep -i "m4v|mkv|mp4|mp3" directdownload.pipe > $outputfilepipe
echo File created
ls -l $outputfilepipe
echo done


echo "Enter Source File {Title,URL} which is pipe delimited"
INPUT_FILE=$outputfilepipe
echo "Enter output XML file name"
cp "$INPUT_FILE" "`basename $INPUT_FILE .pipe`.xml"
OUTPUT_XML=$outputfile.xml
echo "Enter URL of image"
read URLPIC

if [ -z $URLPIC ]
then
  echo "URLPIC is null."
  URLPIC=http://tinyurl.com/kgba3x6
else
  echo "$URLPIC is NOT null."
fi     # $String is null.

#OUTPUT_XML=$2
#OUTPUT_XML="cctv.xml"
#OUTPUT_XML="china.xml"

OUTPUT_DIR=/home/buenafe/Research/ROKU/examples/source/myvideoplayer/xml
perl ./xml_generator.pl $INPUT_FILE  $OUTPUT_XML $URLPIC

#cp $OUTPUT_DIR/$OUTPUT_XML /tmp/$OUTPUT_XML.$$.backup 
echo "XML file is:" $OUTPUT_XML
echo "Output directory: " $OUTPUT_DIR

cp -v $OUTPUT_XML ${OUTPUT_DIR}/${OUTPUT_XML}

