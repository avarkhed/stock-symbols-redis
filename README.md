# stock-symbols-redis

A solution to populate a Redis in memory database with key value pairs of Stock SYMBOL keys and Stock NAME values. This is useful for autocomplete solutions and other tools. Always up to date, NASDAQ & NYSE stocks. CAUTION: Redis server will be flushed, all preexisting data will be deleted.

Requirements: 

Redis (running on port 6379). 
Bash shell. 

Usage to populate Redis (bash):

> $ sh update_symbols.sh

Run the script through a scheduled cronjob at regular intervals using crontab (Recommended once a day).

Usage to retrieve symbols (bash):

> $ redis-cli get AMZN

> "Amazon.com, Inc."

