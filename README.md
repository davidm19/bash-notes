# BASH SCRIPTING NOTES:
## Always first line of code: #!/bin/bash

## basic commands
* print something: ```echo```
* show contents of file: ```cat```
* change file permissions: ```chmod```
* determine file type: ```file```
* command to handle text files: ```awk '/search_pattern/ { action_to_take_if_pattern_matches; }' file_to_parse```
* find lines matching a pattern: ```grep 'pattern' file_to_parse```
* filter and transform text: ```sed```
	* replace all spaces with hyphens
	* sed 's/ /-/g' example.txt

### variables:
* declaring variables: ```variable_name="value"```
* accessing variable value: ```$variable_name```

### conditionals:
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
	case EXPRESSION IN
	case1)
		action
		;;
	case2)
		another action
		;;
	case3)
		another action
		;;
	*)
		default action
		;;
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

### loops
* FOR LOOPS:
```
	for word in $paragraph
	do
		action	
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

### inputs
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
