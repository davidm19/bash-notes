# BASH SCRIPTING NOTES:
## Always first line of code: ```#!/bin/bash```

### Basic Commands
* print something: ```echo```
* show contents of file: ```cat```
* change file permissions: ```chmod```
* determine file type: ```file```
* command to handle text files: ```awk '/search_pattern/ { action_to_take_if_pattern_matches; }' file_to_parse```
* find lines matching a pattern: ```grep 'pattern' file_to_parse```
* filter and transform text: ```sed```
	* replace all spaces with hyphens
	* ```sed 's/ /-/g'``` example.txt
* BONUS ROUND! The ```tar``` command:
	* Create a tarball named TARBALL_NAME and put file FILE or directory DIR inside: ```tar -cf TARBALL_NAME.tar FILE``` or ```tar -cf TARBALL_NAME.tar DIR/```
	* Extract tarball TARBALL: ```tar -xf TARBALL_NAME.tar``` (You can pass in a specific file/directory name to extract just the file/directory)
	* Tags (USE THESE IN CONJUNCTION WITH ```-f```):
		* ```-v```: Verbose (specify each file that's being compressed/uncompressed)
		* ```-r```: Append new files to an existing archive
		* ```-t```: List files inside a tarball
			* NOTE: IF YOU HAVE TARBALLS INSIDE TARBALLS FOR SOME WEIRD REASON, THOSE FILES WILL NOT BE LISTED, EVEN IF YOU TRY AND ACCESS A SPECIFIC TARBALL INSIDE ANOTHER; __HOWEVER__, YOU WILL BE ABLE TO SEE ALL FILES INSIDE DIRECTORIES IN A TARBALL)
			* ALSO: You can specify files you want to search for, like this: if you're looking for a file called ```foo``` in the tarball, just write ```tar -tf TARBALL_NAME.tar foo```, and if you're looking for files which start with ```c``` or any other string, you can ```tar -tf TARBALL_NAME.tar c*```
		* ```-z```: Create/Extract a tarball using ```gzip```
		* ```-J```: Create/Extract a tarball using ```xz```
	* In order to get the ```.xz```/```.gz``` file extensions, use the ```gzip``` or ```xz``` commands respectively (opposites are ```gunzip``` and ```unxz```) or just use the ```-z``` or ```-J``` tags (REMEMBER TO ZIP THINGS __AFTER__ YOU'VE ```tar```-ED EVERYTHING! AND REMEMBER TO __PUT EVERYTHING YOU WANT TO ZIP INSIDE A DIRECTORY__ BECAUSE IT'S EASIER THAT WAY):
		* Archiving data/wrapping up a big project or something: ```xz``` (better compression ratios but uses more time and memory)
		* Everything else: ```gzip``` (uses less time)

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
* exit status of last command: ```$?```
* in order to iterate over indefinite number of arguments:
```
	for item in "$@"
	do
		action
	done
```
 * Quick note on file descriptors: the ```>``` operator can work with numbers in front which are called file descriptors.
   These descriptors represent different parts of Standard Output. ```1``` represents stdout while ```2``` represents stderr.
   Leaving the ```operator``` by itself is the same as ```1>```.
   For instance:
   	```cat foo.txt > output.txt 2>&1```
   The ```2>&1``` essentially tells the ```>``` operator to redirect stderr to the same place as stdout (note the reference operator ```&``` in front of the one)

### Functions
```
function name() {
    shell commands
}
```
-------------------------------------------------------------------------------------------------------
## WE'RE DONE!
All credit goes to tldp.org, unix manpages, the Codecademy bash scripting course, [a blog post on redirection operators](https://www.brianstorti.com/understanding-shell-script-idiom-redirect/) and a StackOverflow answer about gzip vs. xz. Unfortunately I didn't keep tabs on every single source I used so I can't properly/formally cite them here.
