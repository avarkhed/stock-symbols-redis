curl -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" -o "nasdaq.csv" -J -L --silent "http://www.nasdaq.com/screening/companies-by-industry.aspx?exchange=NASDAQ&render=download"
curl -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" -o "nyse.csv" -J -L --silent "http://www.nasdaq.com/screening/companies-by-industry.aspx?exchange=NYSE&render=download"

NASDAQ_SYMBOLS=($(tail +2 nasdaq.csv | awk -F'\",\"' '{print substr($1,2);}')) 
NYSE_SYMBOLS=($(tail +2 nyse.csv | awk -F'\",\"' '{print substr($1,2);}')) 
OIFS=$IFS
IFS=$'\n'
NASDAQ_NAMES=($(tail +2 nasdaq.csv | awk -F'\",\"' 'BEGIN {OFS='\n';} {print $2}'))
NYSE_NAMES=($(tail +2 nyse.csv | awk -F'\",\"' 'BEGIN {OFS='\n';} {print $2}'))
IFS=$OIFS

redis-cli flushdb

INDEX=0
for SYM in "${NASDAQ_SYMBOLS[@]}"; do
    echo $SYM
	echo ${NASDAQ_NAMES[$INDEX]}
	redis-cli set "$SYM" "${NASDAQ_NAMES[$INDEX]}"
	INDEX=$(expr $INDEX + 1)
done

INDEX=0
for SYM in "${NYSE_SYMBOLS[@]}"; do
    echo $SYM
	echo ${NYSE_NAMES[$INDEX]}
	redis-cli set "$SYM" "${NYSE_NAMES[$INDEX]}"
	INDEX=$(expr $INDEX + 1)
done


