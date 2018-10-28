w3m "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml?edition=int" -dump > bbc.txt
grep "<title><!" bbc.txt | cut -c 29- | rev | cut -c 12- | rev | sed -n 2,6p