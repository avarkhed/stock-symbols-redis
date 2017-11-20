# stock-symbols-redis

A solution to populate a Redis in memory database with key value pairs of Stock SYMBOL keys and Stock NAME values. This is useful
for autocomplete solutions on user facing stock market websites, as well as internal tools. NASDAQ & NYSE stocks.

Requirements: 

Redis Server installed and running on default port. Redis server will be flushed upon execution of script.

Bash shell. 


Usage to populate Redis:

sh update_symbols.sh


Additional:

Run the script through a scheduled cronjob at regular intervals using crontab (Recommended once a day).


Usage to retrieve symbols (bash):

$redis-cli get AMZN

"Amazon.com, Inc."

