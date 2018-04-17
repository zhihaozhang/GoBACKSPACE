tell application "Finder"
set currentPath to POSIX path of (target of window 1 as alias)
set myArray to my theSplit(currentPath, "/")
set lengthOfArray to the length of myArray
set the_path to "" as string

if lengthOfArray ≤ 3 then
return "fail"
else
set lengthOfNewArray to (lengthOfArray - 2)
set parentPath to items 2 through lengthOfNewArray of myArray

repeat with anItem in parentPath
set the_path to the_path & "/" & anItem
end repeat
set the_path to the_path & "/"
-- go2Parent(the_path)
set the_folder to (POSIX file the_path) as alias
tell application "Finder"
activate
if window 1 exists then
set target of window 1 to the_folder
else
reveal the_folder
end if
end tell

return "OK"


end if

return myArray
end tell




on theSplit(theString, theDelimiter)
-- save delimiters to restore old settings
set oldDelimiters to AppleScript's text item delimiters
-- set delimiters to delimiter to be used
set AppleScript's text item delimiters to theDelimiter
-- create the array
set theArray to every text item of theString
-- restore the old setting
set AppleScript's text item delimiters to oldDelimiters
-- return the result
return theArray
end theSplit
