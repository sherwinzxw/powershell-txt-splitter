# PowerShell TXT file splitter
A simple powershell program to split the content of a single TXT file by user-defined MATCHSTRING value, and output the splits into individual TXT files.

# Instruction
To use the program:
* Copy and paste the content into the <i><b>src/input/input.txt</i></b> file
* Open the <i><b>src/txt-splitter.ps1</i></b> in a text editor, and assign the split delimiter string value to the variable <i><b>$MATCHSTRING</i></b>
* Save the change, and in the command-line terminal, enter the FULL PATH of the <i><b>txt-splitter.ps1</i></b> to run.
* Once completed, you will find the outputs from the following relative path <i><b>output/extraction_\<yyyyMMddHHmmss\>/*</i></b>
