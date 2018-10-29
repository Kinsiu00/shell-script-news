echo -e "I bring you news! ( •̀ᄇ• ́)ﻭ✧"
menu="[U]K - BBC news | [N]ew York Post | [O]nion | [T]ech - BBC | [B]usiness - New York Post | [C]lear | [Q]uit"
ask="// END //"
echo $menu
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	u | U)
		w3m "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml?edition=int" -dump > bbc.txt
        grep "<title><!" bbc.txt | cut -c 29- | rev | cut -c 12- | rev | sed -n 2,11p
        echo $ask
        echo $menu
        rm bbc.txt
		;;
	n | N)
		w3m "https://nypost.com/news/feed/" -dump > nyp.txt
        sed 1,24d nyp.txt | grep "<title>" | cut -c 11- | rev | cut -c 9- | rev | sed -n 1,10p
        echo $ask
        echo $menu
        rm nyp.txt
		;;
    o | O)
        w3m "https://www.theonion.com/c/news-in-brief" -dump > onion.txt
        sed 1,24d onion.txt > onion2.txt
        lineNum=`grep -n "News in Brief" onion2.txt |cut -f1 -d:`
        lineArr=($(echo "$lineNum" | tr ' ' '\n'))
        for i in ${lineArr[@]:0:10}
        do
            sed -n $(($i+2)),$(($i+4))p onion2.txt
        done
        rm onion.txt onion2.txt
        echo $ask
        echo $menu
        ;;
    t | T)
        w3m "http://feeds.bbci.co.uk/news/technology/rss.xml" -dump > bbc.txt
        grep "<title><!" bbc.txt | cut -c 29- | rev | cut -c 12- | rev | sed -n 2,11p
        echo $ask
        echo $menu
        rm bbc.txt
        ;;
    b | B)
        w3m "https://nypost.com/business/feed/" -dump > nyp.txt
        sed 1,24d nyp.txt | grep "<title>" | cut -c 11- | rev | cut -c 9- | rev | sed -n 1,10p
        echo $ask
        echo $menu
        rm nyp.txt
        ;;
    c | C)
        clear
        echo $menu
        ;;
    q | Q)
        break
        ;;
	*)
		echo "[U]K - BBC news | [N]ew York Post | [O]nion | [T]ech - BBC | [B]usiness - New York Post | [Q]uit"
		;;
  esac
done
    clear
    echo "Goodbye! (。･∀･)ﾉ゛"