# DumpScraper

DumpScraper is a simple shell script.
It aims to look for a specific phrase in files. I originally wrote it to search through database dumps, such as [Collection #1](https://www.troyhunt.com/the-773-million-record-collection-1-data-reach/).

### Running the script

DumpScraper doesn't take arguments. Instead, it reads the user's input.
The script can be ran with this command:
```
./dumpscraper.sh
```
The user might have to run the following command to edit the excecute permissions:
```
chmod +x ./dumpscraper.sh
```
To use the script, the user's working directory must contain at least one directory, which must contain at least one file to search in.

### Saved data

The script saves the printed data to a file named `result_phrase.txt`, *phrase* being the user's input.

This file also contains the printed color codes.
It allows the user to reprint the original output later, using the `cat` command.
However, it also means that reading the file in a text editor won't be convenient.

So the user can use the following command (replacing *phrase* with the actual phrase) to save the plain data to a readable file:
```
cat result_phrase.txt | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g > plainresult_phrase.txt"
```
