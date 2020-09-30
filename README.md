# DumpScraper

DumpScraper is a simple shell script that looks for a specific phrase in files.
It works with database dumps such as [Collection #1](https://www.troyhunt.com/the-773-million-record-collection-1-data-reach/).

### Running the script

DumpScraper doesn't take arguments. Instead, it reads the user's input.
To use the script, the working directory must contain at least one directory, which must contain at least one file to search in.
Run the following command once to edit the execute permissions:
```
chmod +x ./dumpscraper.sh
```
The script runs with this command:
```
./dumpscraper.sh
```

### Processed data

The script saves the printed data to a file named `result_phrase.txt`, *phrase* being the user's input.
The file `result_phrase.txt` also contains the printed formatting codes so that the original output can be reprinted in a terminal.
To copy the processed data to a file readable in a text editor, use the following command (replacing *phrase* by the actual phrase):
```
cat result_phrase.txt | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g > plainresult_phrase.txt"
```