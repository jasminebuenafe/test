#!/bin/bash
# Documentation
#
# Sample pipe file.  I wish we can have it auto generated.
#
# Title
# URL
#
# Defining Minimum Edit Distance (7:04)|http://d19vezwu8eufl6.cloudfront.net/nlp/recoded_videos%2F%5B576500c9%5D%2001-03-defineMinEdit-v3.mp4
#Computing Minimum Edit Distance (5:54)|http://d19vezwu8eufl6.cloudfront.net/nlp/recoded_videos%2F%5B90d34220%5D%2001-03-computingmineditdistance-v2.mp4
#Backtrace for Computing Alignments (5:55)|http://d19vezwu8eufl6.cloudfront.net/nlp/recoded_videos%2F%5Bdb355aeb%5D%2001-03-backtrace-v5.mp4


# input 1 is pipe delimited file
# input 2 is output filename with xml in roku format
# file will be moved to myvideoplayer xml directory
echo "Enter Source File {Title,URL} which is pipe delimited"
read INPUT_FILE
echo "Enter output XML file name"
read OUTPUT_XML
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
