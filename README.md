# date-stats
A bash script for last modification stats on a directory of directories.

### Usage
The script ignores empty directories, as well as directories that only contain empty directories.

Specify the directory to analyze as an argument to the script, including the trailing '/'
```bash
./date-stats.sh ~/
```

### Output
The output is printed to the console as comma delimited data and may be output redirected to a `.csv` file for easy analysis.
Example:
```bash
matt@agate:~$ ./date-stats.sh ~/
Directory, 1 Week, 1 Month, 6 Months, 1 Year

/home/matt/Desktop/ , 1 , 1 , 5 , 18
/home/matt/Documents/ , 0 , 0 , 4 , 8

Sum 1 Week, Sum 1 Month, Sum 6 Months, Sum 1 Year
1 , 1 , 9 , 26
```

Or, to save to a file:
```bash
./date-stats.sh ~/ > stats.csv
```
