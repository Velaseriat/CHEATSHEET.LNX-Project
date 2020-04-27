# CHEATSHEET.LNX

The Cheatsheet must only be edited using either Vim or Emacs, as per official notice from instructor.

# Conventions

`~` means a user's home directory. `.` means the current directory. `..` means the parent directory.

## Some Useful Commands

### `apropos`---helps the user when they don't remember the exact command.

For example, type `apropos email messages` to see which commands may have that functionality.

### Others

1. `rmdir` -- removes empty directories
2. `mv` -- moves one or more files or directories
3. `cp` -- copies
4. `ls` -- lists a directory

## Soft Links

The command `ls` highlights soft links to directories as light blue.

## How to use the echo command

echo t e x t
	will print ``t e x t''.

echo -e ...
	This enables escape sequences to appear.
	The text must be enclosed in "".

echo -e "t\bext"
	will print "ext". t is erased due to the presence of the backslash control (\b).

echo -e "t\next"
	will print "t
	ext." a newline is inserted.

echo -e "Ten sting \rFax"
	will print "Fax sting ". The return (\r) control brings the cursor back to the first character.

echo -e "Ten sting \vFax"
	Does not work. In the MAN manual, it is supposed to be a ``vertical tab.''

echo -e "Ten\t a"
	will print "Ten		a". It is a tab character.

echo *
	will print every visible item in the current folder. Hidden files are not shown.

## How to use that cat command to view and edit files

cat is a versatile command.

cat [filename] displays the contents of a file.

cat > [filename] overwrites the file from stdin. Use ^C (Control-C) to save and exit.

cat [filename] [filename] ... [filename] concatenates the files in sequence from the leftmost listed to the rightmost listed.

cat -n [filename] prints line numbers.

## How to use the ls command

ls lists the files and directories in the current folder.

ls -al > [filename] lists all files and directories in the listing format, and redirects the results to the file called [filename], creating it if nonexistent.

## Redirection

`>` is a redirection with overwriting.

`>>` is a redirection with appending.

`<` is a redirection from.

`0<` is from [file] into standard input.

The number 0 represents the standard input. On the other hand, the number 2 refers to the standard error.

# What are the yellow files?

Yellow indicates it is a device file.

# How to get the version of bash?

The variable BASH_VERSION indicates the current version of Bash.

# Variables
## How do you store a variable?

In a command line, type

$ VAR_MONA="I am a student"

Then, within this terminal session, from now on, the variable VAR_MONA will mean "I am a student".

Recall a variable using $[name]

$ echo $VAR_MONA
or
$ echo "$VAR_MONA"

This prints

I am a student

However, single quotes will not do the same thing:

$ echo '$VAR_MONA'

Which prints

$VAR_MONA

Let's say a variable has not been defined. In this example, COLORADO has not been defined.

Then, `echo $COLORADO' will print just a blank line.

The `export' command will show all variables defined using the export command.

Reminder of single quotes vs. double quotes when it comes to using variables.

In double quotes,
	- All characters within double quotes are interpreted as regular characters except for $ and `` which will be expanded on the shell.
	- The use is determined if you want to enclose variables or use shell expansion inside a string.

In single quotes,
	- All characters are interpreted as regular characters.

GLOBING

An asterisk matches one or more instances of any character, including no character.

	file *
	prints all files in the current directory. [Try it!]

A question mark matches a single occurence of any character.

	file ?.txt
	prints all files that matches this template: ?.txt.
	for example> a.txt; b.txt; ...; z.txt; ...

Bracketed characters ([]) matches any occurence of any of the characters enclosed in the square brackets. It is possible to use different types of characters (alphanumeric characters): numbers, letters, other special sequences, etc.

	Let there be 1.txt and b.txt. Then,
	file [1b].txt
	will match 1.txt and b.txt

Curly brackets---terms are separated by commas and each term must be the name of something or a wildcard.

	file {a,b}.txt
	will match a.txt and b.txt.

Curly bracket range expression---{a..z} will match {a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}.

The exclamation mark negates the following expression. It's kinda confusing how it works.

Bash Scripting

rm [file]
	removes a file.

touch [file]
	creates a file.

ls -l [file]
	looks up information, most importantly, the permission, of a file.

chmod u+x [file]
	creates a user [u; meaning myself] permission to execute.

chmod u-x [file]
	removes the user [u] permission to execute.

	I have a script called no-execute.sh. I do not have the user permission to execute it. Therefore, when I try to run it, it says, ``Permission denied.''

chmod a+x [file]
	creates an all-user [a] permission to execute.

chmod a-x [file]
	removes the all-user [a] permission to execute.

#!/bin/bash
	is placed as the first line of a bash script to indicate that it is to be run by bash.

Control Signals

Ctrl-C
	interrupts or kills the process (SIGINT)

Ctrl-L
	clears the screen

Ctrl-S
	stops output to the sreen

Ctrl-Q
	allows output to the screen when stopped

Ctrl-D
	sends an EOF marker. Unless disabled by an option, this will close the current shell.

Ctrl-Z
	sends the SIGTSTP signal to the current task, which suspends it. To return, enter 'fg [process name]'. FG stands for 'foreground.'

# Exit Codes

0 means a successful exit.

To find the latest exit code, examine the value of $?.

# How to pass in command line arguments and how to use them.

Passing arguments to a shell script---

$0 is the program name
$1 is the first argument
$2 is the second
...
$n is the nth argument.

$# is the number of arguments
$* is all the arguments are double quoted
$@ is all the arguments are single quoted
$$ the process number of the current shell
$! process number of the last background command

# If-then-fi

If statements allow us to make decisions.

Five total conditional statements are available:

1. If
2. If-else
3. If-elif-else-fi
4. If-then-else- if-then-else-fi -fi
5. switch

If and elif need a then. Else does not need a then.

If and elif take the [ ] thing to evaluate the expression.

[ is an alias for the test command and, only when it is called [, it needs to be closed with a ].

The evaluation syntax is governed by the TEST program. Use man test to find out the syntax.

# March 30, 2020

## Before

Discussing the pipe operator (|).

## GREP

Acronym of "global regular expression print."

Highlights (matches) the given string or pattern even if it is found as a substring in a file.

### Options

--color option higlights matches within their lines.

### Exotic

grep -c "Unix" *

The above command does something wonderful.

The star (\*) will only look at the directory specified.

## HEAD

Print the top N number of data of given input.

By default, it prints the first 10 lines of the specified stdin

(Question: Data = line?)

### Option n

head -n 5 file.txt

Will print the top 5 lines of the file.

There is no problem for specifying more lines than available in the file.

## TAIL

Print the bottom N number of data of the given input.

By default, it prints the last 10 lines of the specified stdin

Syntax: `tail [option] [file]`

## SORT

used to sort a file, arranging the records in a particular order. Follows these features as stated below:

1. Lines starting with a number will appear before lines starting with a letter.
2. Lines starting with a letter that appears earlier in the alphabet will appear before lines starting witha aletter that appears later in the alphabet.
3. Lines starting with a lowercase letter will appear before lines starting with the same letter in uppercase.

### Option u

The option u will only report unique rows after the sorting.

## TEE

Two different things at the same time.

Reads the standard input and writes it to both the standard output and one or more files.

That is to say, this breaks the output of a program so that it can be both displayed and saved in a file.

### Option a

The `a` option appends (instead of replaces) to the file specified. The file will be created if it does not exist.

## Technique of having multiple pipes in a row

Multiple pipes can be joined together in a linear fashion by chaining commands with pipe symbols (`|`).

For example: `ls -1 | wc -l | tee -a CountDir.txt`

The above command will count the number of files and directories in the current directory.

## UNIQ

Reports or filters out repeated lines in a file; by default, writes to standard output.

This helps detect the adjacent duplicate lines and also deletes the duplicate lines.

`uniq` is **NOT ABLE** to detect duplicate lines unless they are adjacent. The content in the file must be therefore sorted before using `uniq`.

## TR

The `tr` command, or **translate**, is used for translating or deleting characters. This supports a range of transformations including uppercase to lowercase, deleting specific characters, basic find and replace, etc.

Example:

```bash
$ echo "Welcome to Class" | tr "[a-z]" "[A-Z]"
WELCOME TO CLASS

$ echo "Welcome to Class" | tr "[A-Z]" "[a-z]"
welcome to class

$ echo "Welcome to Class" | tr 'c' '&'
Wel&ome to Class

$ echo "Welcome to Class" | tr 's' '&'
Welcome to Cla&&

$ echo "Welcome to Class" | tr "[:lower:]" "[:upper:]" | tr "S" "&"
WELCOME TO CLA&&
```
