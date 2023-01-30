#!/bin/perl 
#
# perl script to generate video xml for ROKU videoplayer
# needs a lot of work
#
# Description
# URL
###############
#these are not included in source since I had to manually fetch the URL
# Duration
# Picture URL
# Synopsis
# Genres

use strict;
use XML::Writer;
use IO;


if ($#ARGV != 2 ) {
	print "usage: perl xml_generator pipefile target.xml URL for image\n";
exit;
}
print "Gonna print $ARGV[0]\n";
print "Gonna print $ARGV[1]\n";
print "Gonna print $ARGV[2]\n";

my $doc = new IO::File(">$ARGV[1]");
my $writer = new XML::Writer(OUTPUT => $doc, DATA_MODE => 1,DATA_INDENT => 2);

# Open the file
my $data_file=$ARGV[0];
open(DAT, $data_file) || die("Could not open file!");
my @raw_data=<DAT>;

$writer->startTag("feed");           # tag + att
  $writer->dataElement( 'resultLength', "3");# text elt
  $writer->dataElement( 'endIndex', "3");# text elt

#1:Introduction to the course (14 min)|http://download-videos.db-class.org/cs145/videos/01-01-introduction.mp4|0|http://openclassroom.stanford.edu/MainFolder/courses/IntroToDatabases/dblogo.png||Stanford University

my $LINE_VAR;
my $title;
my $url;
my $duration;
my $urlpic;
my $synopsis; 
$synopsis = "";
my $genres;  #$genres = "dl.taktaraneh217.com";
my $suffix;

$urlpic="$ARGV[2]";




foreach $LINE_VAR (@raw_data)
{
  chomp ($LINE_VAR);
  ($title, $url , $suffix)=split(/\|/,$LINE_VAR);
#  ($title, $url, $duration, $urlpic, $synopsis, $genres)=split(/\|/,$LINE_VAR);
#  print "$title, $url, $duration, $urlpic, $duration, $synopsis, $genres\n";
#   $synopsis = 'Coursera.org';
#   $genres = 'Education';

   $writer->startTag( 'item', sdImg => $urlpic, hdImg => $urlpic );
   $writer->dataElement( 'title', $title);
   $writer->dataElement( 'contentId', "1");
   $writer->dataElement( 'contentType', "1");
   $writer->dataElement( 'contentQuality', "SD");
   $writer->dataElement( 'streamFormat', $suffix);
   $writer->startTag( "media");
   	$writer->dataElement( 'streamQuality',"SD");
   	$writer->dataElement( 'streamBitrate',"700");
   	$writer->dataElement( 'streamUrl',$url);
   $writer->endTag();                        # close section      
   #$writer->dataElement( 'synopsis', $synopsis);
   $writer->dataElement( 'synopsis', $synopsis);
   $writer->dataElement( 'genres', $genres);
   $writer->dataElement( 'runtime',$duration);
   $writer->endTag();                        # close section      
}
 $writer->endTag();                        # close section      
$writer->end();      #feed                     
$doc->close();

close(DAT);
