w3m "https://nypost.com/news/feed/" -dump > nyp.txt
sed 1,24d nyp.txt | grep "<title>" | cut -c 11- | rev | cut -c 9- | rev | sed -n 1,5p
