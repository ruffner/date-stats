#!/bin/bash
# Matt Ruffner April 2016
# A script for directory modification stats

today=`date +'%Y%m%d'`
tm1w=`date -d "today - 1 week" +"%Y%m%d"`
tm1m=`date -d "today - 1 month" +"%Y%m%d"`
tm6m=`date -d "today - 6 months" +"%Y%m%d"`
tm1y=`date -d "today - 1 year" +"%Y%m%d"`


echo -e "Directory, 1 Week, 1 Month, 6 Months, 1 Year\n"

totalm1w=0
totalm1m=0
totalm6m=0
totalm1y=0

for d in $1*/; do
    #echo "$d"
    #echo $d ': ' `find "$d" -mindepth 0 -maxdepth 1 -type d -print| wc -l`

    m1w=0
    m1m=0
    m6m=0
    m1y=0

    t=`find "$d" -maxdepth 1 -type d -empty`

    if [ "$t" == "$d" ] || [ "$t" == "" ]
    then
	continue
    else
	for s in "$d"*/; do
	    fdate=`stat -c %y "$s" | head -c10`
	    date=$(date -d $fdate +"%Y%m%d")
	    #echo -e '\t' $date 

	    if [ $date -gt $tm1w ]
	    then
		m1w=$((m1w+1))
	    fi

	    if [ $date -gt $tm1m ]
	    then
		m1m=$((m1m+1))
	    fi

	    if [ $date -gt $tm6m ]
	    then
		m6m=$((m6m+1))
	    fi

	    if [ $date -gt $tm1y ]
	    then
		m1y=$((m1y+1))
	    fi
	done
    fi

    echo -e $d , $m1w , $m1m , $m6m , $m1y

    totalm1w=$((totalm1w+m1w))
    totalm1m=$((totalm1m+m1m))
    totalm6m=$((totalm6m+m6m))
    totalm1y=$((totalm1y+m1y))
done

echo -e "\nSum 1 Week, Sum 1 Month, Sum 6 Months, Sum 1 Year"
echo -e $totalm1w , $totalm1m , $totalm6m , $totalm1y
