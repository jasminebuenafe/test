# anchors extraction from html document
import sys
import urllib2
import urllib


from bs4 import BeautifulSoup

total = len(sys.argv) 
cmdargs = str(sys.argv)

page = urllib2.urlopen(sys.argv[1]).read()
soup = BeautifulSoup(page)
soup.prettify()

#print ("The number of args: %d " % total)
#print ("Args list: %s " % cmdargs)
baseurl = sys.argv[1]
#print ("BaseURL is %s " % baseurl)
 
#soup = BeautifulSoup(open("./index.html"))
#soup = BeautifulSoup(open(sys.argv[1]))
 
for anchor in soup.find_all('a'):
    moviefile=anchor.get('href', '/')
#    moviefile_no_ext= moviefile.rsplit( ".", 1 )[ 0 ]
    moviefile_no_ext= urllib.unquote(moviefile.rsplit( ".", 1 )[ 0 ])
    (prefix, sep, suffix) = moviefile.rpartition('.')
#   check if slash is needed between baseurl and moviefile
    print( moviefile_no_ext+"|"+ baseurl + "/" + moviefile +"|" + suffix )

#print("##############################")

#for anchor in soup.findAll('a', href=True):
#    print anchor['href']

