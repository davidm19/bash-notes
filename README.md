# BASH SCRIPTING NOTES:
## Always first line of code: #!/bin/bash

### Basic Commands
* print something: ```echo```
* show contents of file: ```cat```
* change file permissions: ```chmod```
* determine file type: ```file```
* command to handle text files: ```awk '/search_pattern/ { action_to_take_if_pattern_matches; }' file_to_parse```
* find lines matching a pattern: ```grep 'pattern' file_to_parse```
* filter and transform text: ```sed```
	* replace all spaces with hyphens
	* sed 's/ /-/g' example.txt
* BONUS ROUND! The ```tar``` command:
	* Create a tarball named TARBALL_NAME and put file FILE or directory DIR inside: ```tar -cf TARBALL_NAME.tar FILE``` or ```tar -cf TARBALL_NAME.tar DIR/```
	* Uncompress tarball TARBALL: ```tar -xf TARBALL_NAME.tar```
		* You can pass in a specific file/directory name to extract just the file/directory
	* Tags (USE THESE IN CONJUNCTION WITH ```-f```):
		* ```-v```: Verbose (specify each file that's being compressed/uncompressed)
		* ```-r```: Append new files to an existing archive
		* ```-t```: List files inside a tarball

### Variables:
* declaring variables: ```variable_name="value"```
* accessing variable value: ```$variable_name```

### Conditionals:
* IF STATEMENTS:
```
	if [ condition ]; then
		action
	elif [ another condition ]; then
		another action
	else
		another action
	fi
```

* CASE STATEMENTS:
```
	case expression in
	    pattern1 )
		statements ;;
	    pattern2 )
		statements ;;
	    ...
	esac
```

* NUMBER COMPARATORS:
	* Equal: ```-eq```
	* Not equal: ```-ne```
	* Less than or equal: ```-le```
	* Less than: ```-lt```
	* Greater than or equal: ```-ge```
	* Greater than: ```-gt```
	* Is null: ```-z```

* STRING COMPARATORS:
	* Equal: ```==```
	* Not equal: ```!=```
	* REMEMBER TO PUT VARIABLES IN QUOTES!
	
* FILE COMPARATORS:
	* File exists: ```-a file```
	* File exists and is a directory: ```-d file```
	* File exists (same as -a): ```-e file```
	* File exists and is a regular file (i.e., not a directory or other special type of file): ```-f file```
	* You have read permission: ```-r file``` 
	* File exists and is not empty: ```-s file```
	* You have write permission: ```-w file```
	* You have execute permission on file, or directory search permission if it is a directory: ```-x file```
	* File was modified since it was last read: ```-N file```
	* You own file: ```-O file```
	* File's group ID matches yours (or one of yours, if you are in multiple groups): ```-G file```

	* File1 is newer than file2: ```file1 -nt file2```
	* file1 is older than file2: ```file1 -ot file2```

### Loops
* FOR LOOPS:
```
	for x := 1 to 10 do
	begin
	  statements
	end

	for word in $paragraph
	do
		action	
	done
	
	for (( initialisation ; ending condition ; update ))
	do
	  statements...
	done
	
	# looping through a list
	list_name ( item1 item2 item3 )
	for item in "${list_name[@]}"
	do
		statements (e.g. echo "$item")
	done
	
```

* WHILE LOOPS (keeps looping WHILE the provided condition is true):
```
	while [[ condition ]]
	do
		action
		thingy=$(( thingy + 1 ))
	done
```

* UNTIL LOOPS (keeps looping UNTIL the condition is true):
```
	until [[ condition ]]
	do
		action
		thingy=$(( thingy + 1 ))
	done
```

### Inputs
* assign input to a variable: ```read variable_name```
* same thing but with a message: ```read -p "Message" variable_name```
* external arguments inside a bash script: ```$1 $2, $3...```
* in order to iterate over indefinite number of arguments:
```
	for item in "$@"
	do
		action
	done
```

### Functions
```
function name() {
    shell commands
}
```

### Debug
You can easily debug the bash script by passing different options to bash command. For example -n will not run commands and check for syntax errors only. -v echo commands before running them. -x echo commands after command-line processing.
```
	bash -n scriptname
	bash -v scriptname
	bash -x scriptname
```
