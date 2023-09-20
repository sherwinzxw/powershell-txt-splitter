#### for user customised definitiondeclare variable for the string to match
$MATCHSTRING = "`n"

#---------------------------------------------------------------------------------------------

#remove file input/input_trimmed.txt to prepare for new task
Remove-Item -Path input/input_trimmed.txt

#remove all empty lines from the input.txt
gc input/input.txt | where {$_ -ne ""} > input/input_trimmed.txt

#get the content from the input.txt and assign value as string into variable $content
$content = Get-Content -path input/input_trimmed.txt | Out-String

#split the string by the match string into an array of strings
$outputArray =$content -split $MATCHSTRING

#get timestamp and format as yyyyMMddHHmmss
$timestamp = Get-Date -Format "yyyyMMddHHmmss"

#define relative output folder path
$outputFolderPathRelative = "output/extraction_$timestamp";

#create directory as per relative output folder path
New-Item -Path "output/extraction_$timestamp" -ItemType Directory

#iterate through the string array and output the indexed string to output folder
for ($i=0; $i -lt $outputArray.Length; $i++) 
{ 
  if($i -gt 0){      
    if($MATCHSTRING -eq "`n") {
      $outputstring = $outputArray[$i]
      $exportPath = "$outputFolderPathRelative/statement-$i.txt"
      $outputstring | Out-File -FilePath $exportPath 
    }  
    else{
      $outputstring = $MATCHSTRING + $outputArray[$i]          
      $exportPath = "$outputFolderPathRelative/statement-$i.txt"
      $outputstring | Out-File -FilePath $exportPath 
    }
  }
}