echo "Welcome! What kind of news are you looking for? |。･ω･|ﾉ"
menu="[B]BC news | [N]ew York Post | [O]nion | [T]ech - BBC | [E]ntertainment - New York Post | [S]ports - New York Post"
ask="// END //"
echo $menu
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	b | B)
		w3m "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml?edition=int" -dump > bbc.txt
        grep "<title><!" bbc.txt | cut -c 29- | rev | cut -c 12- | rev | sed -n 2,6p
        echo $ask
        echo $menu
		;;
	n)
		echo "n selected!"
		;;
    o)
        echo "o selected!"
        ;;
    q)
        echo "goodbye"
        break
        ;;
	*)
		echo "[B]BC news | [N]ew York Post | [O]nion | [T]ech - BBC | [E]ntertainment - New York Post | [S]ports - New York Post"
		;;

  esac
done
    echo "that's it."