#Pull The Onion's Webpage
w3m "https://www.theonion.com/c/news-in-brief" -dump > onion.txt
sed 1,24d onion.txt > onion2.txt
#Line numbers of "News in Brief"
lineNum=`grep -n "News in Brief" onion2.txt |cut -f1 -d:`
#Convert string of numbers to array
lineArr=($(echo "$lineNum" | tr ' ' '\n'))
for i in ${lineArr[@]:0:5}
do
    sed -n $(($i+2)),$(($i+4))p onion2.txt
done
rm onion.txt
rm onion2.txt
echo '//END (๑•̀ㅂ•́)و✧'