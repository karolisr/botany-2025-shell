# botany-2025-shell, Alexa's section
<!-- how i made the example files:
cat Chloroplast_Genes.fa | while IFS= read -r line; do if [[ $line == \>* ]]; then filename="${line:1}.txt"; echo $filename; fi; touch $filename; echo $line >> $filename;  done
 -->
## Welcome and Learning Objectives
<!-- TODO: explain comment pound signs -->
We are dedicated to equity-focused teaching. We will do our best to make the material accessible and transparent to all participants, regardless of background or system type. 
Please feel free to let us know during the session that if some material is not accessible to you (commands/links not working, teaching too fast, etc.)

This is where the table of contents will go.

## Computer and file basics
This section will cover some of the basics of interacting with your computer through the command line. 
### Navigation
The most common way to interact with your computer is through a GUI (Graphical User Interface). 
Actions like clicking and dragging a file, or renaming a file, or creating a folder, are done through menus and buttons that easily display what their functions are. 
Underneath the GUI, like a skeleton, the computer is told to perform a cascade of actions that result in the file being moved, or the folder name changing, for example. 
When we use the command line interface (CLI), we get closer to operating in the same language as the computer, without as much visual output, and we gain the power to interact with our computers through scripts and complex actions.

Since many of us are familiar with the basics of moving files around a desktop and creating folders, this is one of the first exercises that we can do using the CLI. 

Depending on your familiarity with your operating system and its file explorer, this might feel very familiar. 
One way to visualize what is going on is to open files in your file explorer at the same time as you edit them using the CLI. 

Ready? 
Now let's open your terminal window. 
You'll see some kind of a prompt. 
Note: my prompt is `»`. 
It'll appear when I copy and paste my output.
You do not need to type this into your input since it just lets me know where I started typing. 
You can change yours if you'd like, but we can get to that later. 

<!-- KF: I love this intro! -->

### `ls` (list files)
Let's run this command first. Type this into the window:
```bash
ls
```

You'll see a list of the folders and files you have in your root directory!

```console
~ » ls
AlDente                      Public
Applications                 Trimmomatic
BIOS430                      Zotero
Corset                       cv-corpus-7.0-2021-07-21
Desktop                      gadm
Documents                    iqtree-1.6.12-MacOSX
Downloads                    kallisto
Dropbox                      kanboard
(etc...)
```
We can list files from inside each of these folders, too. 
Try:
```bash
ls Desktop
```
To access a folder inside a folder, you can use a `/`. 
Pick a folder of your choice, or from another place if your desktop is folder-less.
```bash
ls Desktop/sra
```
Different options exist for using `ls`. 
When you add an option to a command, you will use `-`. 
The most basic options will have letters that may have something to do with the type of option.
Sometimes, they might not make much sense. 
They will sometimes have a longer form, which will work the same. 
I am constantly using cheat sheets or taking my own notes on commands and their options, and Google is definitely your friend here.

Here are some useful options for `ls`.
Try them out!
<!-- | First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | -->

| Option  | Long form |What it does|
| ------------- | ------------- | ------------- |
| `-l`  |       | use a long listing format  |
| `-a`  | `--all` |  do not ignore entries starting with `.` (show otherwise hidden files) |
|`-m`||fill width with a comma separated list of entries|
|`-r`|`--reverse`|Reverse order while sorting.|
|`-t`||sort by time, newest first|
|`-o`||Use long listing format without group info.|
|`-x`||list entries by lines instead of by columns|
|`-1`||list one file per line|
<!-- ||`--help`|display help and exit| -->

You can combine options, too, by chaining together letters. You cannot chain long forms. Some options depend on other options, so must be used in tandem.

| Full command  | What it does|
| ------------- | ------------- |
| `ls -lah`  |   Displays the `-l` long form, `-a` all files, in a `-h` human-readable form    |
| `ls -ltrah`  | Displays files in  `-l` long form,`-t` time-sorted, `-r` reverse sorted (so the most recent is at the bottom where you can see it!), `-a` all files, in a `-h` human-readable form. |
|`ls -oh`| Displays `-o` long format with no no group information `-h` in human-readable sizes. |

>[!TIP]
>Note also that the order of your options doesn't matter. 
>`ls -ltrah` is the same as `ls -latrh`. 

### `man` (manual)
One way to learn more about a command is by using the `man` command! 
You can scroll through the options available for a certain command. 
The options will range from interesting to entirely obscure. 
Don't worry if they don't make sense to you.
```bash
man ls
```

Click <kbd>Q</kbd> on your keyboard when you're ready to exit the manual page. 

### `cd` (change directory)
Thus far, we have been listing files starting from the same directory. 
In order to actually move around the system, we need to use a different command. 
<!-- %fixme not sure how this will work, will we have them git pull the directory first?  -->
<!-- KF: not sure if we want them to do everything on the remote server from the beginning
or on their system first. If start with their system then, they need to git pull or we just make
all the examples to a zip and send them those. -->
Locate the directory with the course files. It's titled `botany-2025-shell`. 

Now run
```bash
ls -lah
cd examplefiles
ls -lah
```

> [!TIP]
> When using the terminal, you can press <kbd>Up</kbd>/<kbd>Down</kbd> on your keyboard to access previous commands. Another handy shortcut is using <kbd>Tab</kbd> to complete file paths. When I type `cd`, I also usually hit <kbd>Tab</kbd> to see the folders that I can move into. When you're presented with multiple folders after pressing <kbd>Tab</kbd>, you can use the <kbd>Up</kbd>/<kbd>Down</kbd> arrows to select a folder. 

### Terminal shortcuts save time!
<!-- CTRL+U, E, A, up/down, CTRL+C -->

If you accidentally use `cd examplefiles` instead of `cd examplefiles/`, you will usually end up in the right place. 
But please note that the trailing `/` indicates that this is a directory. <kbd>Tab</kbd> autocomplete should always include the trailing `/`. 
By using the `<kbd>Tab</kbd>` autocomplete shortcut, you can avoid some typo-induced frustration. 

At this point you may have also noticed that you cannot use the cursor to select a spot to edit your input, so it might be frustrating to `<kbd>DEL</kbd>` all the way back to where you want to edit. 
You are essentially working on a screen where there is one "insertion point" which you control using the keyboard rather than the mouse. 
I'm including a few time-saving terminal keyboard shortcuts here that I use all the time.
<!-- KF: 2 kbd not working here -->

<!-- | First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | -->

| Shortcut  | Action |
| ------------- | ------------- |
| <kbd>Ctrl</kbd>+<kbd>U</kbd>  | Delete line in terminal  |
| <kbd>Ctrl</kbd>+<kbd>C</kbd>  | Cancel command (this is your emergency 'stop' lever!) |
| <kbd>Ctrl</kbd>+<kbd>R</kbd>  | **R**everse search/browse past commands |
| <kbd>Ctrl</kbd>+<kbd>L</kbd>  | c**L**ear the screen  |
| <kbd>Ctrl</kbd>+<kbd>A</kbd>  | Move the insertion point to the st**A**rt of the line |
| <kbd>Ctrl</kbd>+<kbd>E</kbd>  | Move the insertion point to the **E**nd of the line  |
| <kbd>Ctrl</kbd>+<kbd>W</kbd>  | Delete content to the beginning of the last **W**ord  |
<!-- | <kbd>Ctrl</kbd>+<kbd>C</kbd>  | Content Cell  | -->

<!--%fixme source: https://gist.github.com/bradtraversy/cc180de0edee05075a6139e42d5f28ce -->

### file paths (`.`, `..`, `/`)

<!-- KF: I am not sure if it's good to name the example folders someone's section. By content name
may be better -->
Let's see what's in the folder `examplefiles/alexas_section`
```bash
cd alexas_section/
ls -lah
```
> [!TIP]
> Notice how the sorting of folders proceeds differently than we would sort them - it is technically alphabetical, but not sequential.

To enter one of these folders, we can use:

```bash
cd 11/
ls -lah
```

Now that we are here, how can we get back to the main folder? 
When calling `ls -lah`, you should see a screen like this:
```console
ls -lah
total 0
drwxr-xr-x   3 alexa  staff    96B Feb  6 10:23 .
drwxr-xr-x  16 alexa  staff   512B Feb  6 10:23 ..
-rw-r--r--   1 alexa  staff     0B Feb  6 10:23 11.txt
```
The `.` and `..` represent the current directory and the parent directory, respectively. 
These are file paths we can call with `cd` and `ls` just like we used folders. 


<!-- | First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | -->

| Relative path | Call | Explanation |
| ------------- | ------------- | ------------- |
| `.`  | `ls .` OR `cd .` |Calls current directory, so `cd` and `ls` just show you or take you to the current directory. Note that this is different from `cd` as a standalone call, which will take you back to your home/root directory.|
| `..`  | `ls ..` OR `cd ..` ||
|`~`| `ls ~/(filepath)` OR `cd ~/(filepath)`| `~` is your **root directory**, which means that this is a method for getting an absolute path. Since your root directory should retain the same file structure, you can call full file paths from the root directory without worrying about your currrent location. |

<!-- KF: the explanation for '..' is missing? And also would it be useful to mention the absolute path
on different machines might be different? Depending where they downloaded the files -->

> [!TIP] 
> **The difference between absolute and relative file paths.**
> An absolute file path looks like this: `~/Documents/GitHub/botany-2025-shell/examplefiles/alexas_section/11/11.txt` 
>
>but if I have navigated to 
>
>` ~/Documents/GitHub/botany-2025-shell/examplefiles/` 
>
> already, I can just find this file with 
>
> `ls ./11/11.txt` 
>
> You can also call 
>
>`ls /11/11.txt`

The difference between absolute and relative file paths will matter more later, when you want to be sure of the locations of your files. 
To maintain consistency in my scripts, I try to use **absolute paths** so I can remember where exactly I ran an analysis. 
For simple, quick movement around the filesystem, **relative paths** work great. For now, let's use relative paths and I will try to keep things consistent. 
Locate your github folder, and if you ever get lost, you can always `cd` back to the main github folder using an absolute path. 

Since my path to this folder is `Documents/GitHub/botany-2025-shell/` I can call 
```
cd ~/Documents/GitHub/botany-2025-shell/
```
from any location on my computer's file system, and I will return to the main directory for this course. 
In this way, an absolute path can be an escape lever for you if you get lost. 

> [!TIP]
> You can also call `pwd` on its own to display a full path for any location you find yourself in. 

### `cat` 🐈 (concatenate and print)

`cat` will print out lines of a file, or add to the end of the file. 
It is most commonly used for the first purpose.


To try it out, navigate to `examplefiles/alexas_section/chloro/` from the main github directory.

Now try out `cat` on some files here.

```
cat Firstgenes.fa
```

After typing cat, you can press `[Tab]` to activate the autocomplete, which saves you time. 
You should essentially never be typing file names from memory, as this could result in trying to call a file that does not exist.

<!-- FIXME need to add more once i generate example files -->


### wild cards `*`

What if we want to `cat` or `ls` some, but not _all_ files in a directory? 
<!-- You should be aware that one part of command line scripting is the manipulation of [regular expressions](https://en.wikipedia.org/wiki/Regular_expression), which are referred to as RegEx. 
RegEx is complicated and implemented slightly differently depending on where you encounter it. 
For now, it is enough to know that it forms the basis of matching and finding (and sometimes replacing) a specific pattern in a given text.
For our purposes, an easy  -->
<!-- FIXME need to read more about this, idk if this use of * is really technically regular expression. -->

In this case we can use `*` as a matching character. 
From `examplefiles/alexas_section/chloro/`, try:
```bash
ls -lah
ls -lah *2.txt
ls -lah rps*.txt
```


### clear, history
Here are some other useful basic commands.

`clear` is possibly the simplest command you will learn today.
It clears your screen.
And it's named in a way that makes sense! 
Nice!

```bash
clear
```


In the same vein, `history` will simply print the history of the commands you have run.

```bash
history 
#this will show your command history
history -c 
#this will clear your history, but you shouldn't need to do this.
```



## More basic commands
### `echo` (print a variable)
<!-- FIXME complete this section-->

`echo` is another one that pretty much does what it says on the tin!
```bash
echo "hello world\!"
```
when run, you should see something like this:
```console
alexas_section/chloro [main●] » echo "hello world\!"


hello world!
```

`echo` can also be used to print variables that you've stored like so:

```bash
echo "hello world\!"

my_var="hello everyone\!"
echo $my_var
```
This is useful for when we don't want to type the same thing multiple times. 
Setting a variable can be used for `strings`, which are essentially strings of words and are 

#### A short introduction to variables
<!-- https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html -->
Variables are a type of data that can be called again after they are declared.

| Variable type  | Description | Example command |
| ------------- | ------------- | ------------- | 
| string  | a phrase consising of numbers, letters, spaces, or other characters  | `my_string="hello everyone\!" ; echo $my_string` 
| number  | an integer or float that can be used in mathematical equations  | `my_num=4 ; echo $(( myv*2 )); my_float=3.5; echo $((my_float+2))`|
<!-- could also talk about let and (( )) -->

>[!TIP]
> When writing more than one line of code, you can use an **endline** character (`;`) to indicate a new line.
>The results of these lines will be the same, try it out!
>
>```bash
>my_var_a="my string is going to print soon!\!" ; echo $my_var
>```
>
>```bash
>my_var_b="my string will print after I echo it!\!"
> echo $my_var
>```

### `touch` (create a file)
<!-- FIXME complete this section-->
This is an easy way to create files.
```bash
man touch
mkdir emptyfiles
cd emptyfiles
touch helloworld.txt
ls -lah
cat helloworld.text #this will not return anything since touch only creates empty files!
touch file1.txt file2.txt file3.txt
```
Note that you need to add extensions manually by typing them in. 
The .txt extension is good for right now, other formats carry certain syntax.
<!-- cat will print any file text but use .txt since your OS will throw a fit trying to open it.  -->
<!-- File extensions are fake. -->


## `>>` and `>` (redirection)
Now that we have our empty files, how do we add to them?
The easiest way is to use redirection operators.
In the same directory as before:
```bash
echo "now my file1 has text" >> file1.txt
cat file1.txt
```
What is the difference between `>>` and `>`?
Try it for yourself:

```bash
echo "now my file2 has text" >> file2.txt
cat file2.txt
echo "now my file2 has text that is appended" >> file2.txt
cat file2.txt

echo "now my file3 has text" > file3.txt
cat file3.txt
echo "now my file3 has text that is overwritten" > file3.txt
cat file3.txt
cat *.txt
```

`>` overwrites any text existing in the file, while `>>` appends your text to the end of the file.
When iterating across multiple inputs, it's very useful to write to a file using `>>`. 
It's a simple way to generate a summary file, or to store information about what you've run so far.

You can also use this with `cat` to overwrite or append files to each other without printing to the terminal.

```bash
touch file4.txt
echo "this text comes from file4" > file4.txt
cat file2.txt
cat file4.txt >> file2.txt
cat file2.txt
cat file1.txt
cat file4.txt > file1.txt
cat file2.txt
```
>[!TIP]
>You can create a **new line** in a .txt file by using `\n`. 
>The backslash `\` indicates special characters and is frequently used for this.

```bash
touch file5.txt
myfilecontents="this\ncan\nbe\nhard\nto\nread"
echo $myfilecontents > file5.txt
cat file5.txt
```

**Knowledge check:** what is the difference between 
`echo file5.txt` and `cat file5.txt`? 
Run each one yourself to check.

### `mv` (move and rename)
<!-- FIXME complete this section-->

Now go up a directory and find the `chloro` folder. 
```bash
cd ../chloro/
man mv
```
`mv` will move and rename files. 

Let's make a new folder and move files into it.
Feel free to open these folders in your normal file browser (Finder for MacOS users) to confirm that you have moved the file.
Once you begin using `mv`, you will hopefully realize how useful it is, especially when combined with the **wildcard character** `*`.



```bash
ls -lah
mkdir ndh
ls -lah

mv ndhA.txt ndh/
ls -lah ndh/
#the file has moved!
#check that it's not in the main folder
ls -lah
ls -lah ndhA.txt
ls -lah ndh/ndhA.txt
```
You can use `mv` with multiple files at once, essentially performing a simple search and moving the files.
```bash
ls -lah ndh*.txt
mv ndh*
mv ndh*.txt ndh/
ls -lah ndh*.txt
ls -lah ndh/
```
Using `mv` to rename files is as simple as "moving" the file to a new location with a different name. 
```bash
cd ndh/
cat ndhA.txt
mv ndhA.txt ndhA_chloro.txt
ls -lah
cat ndhA.txt
cat ndhA_chloro.txt
#this is just to show that the file is the same after it is moved!
```
### `cp` (copy)
<!-- FIXME complete this section-->
You might need to copy files like you would in a file browser. 
I usually use copying to make a backup or test folder for a script, when you're not sure if your code will work the way you want it to.
It's a good idea to make a backup of your files in other ways, but this redundancy can definitely save you some trouble. 

Let's make a backup of the `chloro` folder.
```bash
cd ../..

man cp 
cp -R chloro chloro2 
#-R option allows you to copy a directory and its subfolders
```
If you just want to copy certain files, you can select them using the `*` wildcard.
```bash
cd chloro2/
mkdir ps
cp ps*.txt ps # copies all files starting with "ps" and ending with ".txt" to the new ps directory
```
### `rm` (remove file/directory)
<!-- KF: there is an empty section here! Just in case if you forgot -->

### `nano` (file editor)
In order to edit our files, we've covered how to create and append to files.
Typically, we want to edit text files in a different way.
This is where a **text editor** comes in.
You might think of Microsoft Word, for example, as a very advanced **text editor**, with a GUI (Graphical User Interface) and special file formats.

For programming, however, we want to use a text editor that suits our purposes better.

A text editor is not one-size-fits-all, so it's up to you to find a text editor that suits you well. 
Once you find one that works with your approach, you'll have to learn the shortcuts associated with the text editor.
Some text editors take the form of GUIs or desktop applications. (I like VSCode and Sublime Text, but you can also use your OS' default text editor if this works for you.)
Some text editors should be preinstalled on your OS, however, so let's check these out briefly.

```bash
nano
```
`nano` is one of the simplest editors you can use.
Once you've opened it, feel free to type something fun, like `Hello world!`

The commands listed along the bottom row show the ^ symbol, which is <kbd>Ctrl</kbd>.

Once you've written your text, press <kbd>Ctrl</kbd><kbd>X</kbd> to exit. 
You'll be prompted to save, then enter a file name.
Enter something ending in `.txt` - may I recommend `nanohw.txt`?
Press <kbd>Enter</kbd>, and you're back at the terminal.

Call `cat` on your file to check that your text is included.

Now call `nano` on a file.
For example,
```bash
nano firstgenes.fa
```

### `vim` (file editor)

Let's try another file editor.


```bash
vim
```
Once you've opened `vim`, you'll need to remember that it is different from your CLI. 
It does have a short summary of commands displayed.
`vim` has a special set of commands and shortcuts that you will need to memorize if you plan on becoming a regular `vim` user.
Here are a few that will get you started off the bat:

| Command  | Short description of what it does |
| ------------- | ------------- |
| `:q`  | exit vim  |
| `:help`  | for on-line help  |


First try these:

```
:help # take a look at some of the commands here. there are quite a few so let's move on


:q # exit the help page now that we know it's there
```
Now you will see a blank page like this:
```console

~
~
~
~
~
~
~
~
~
```

Use `:i` to enter `insert mode`. 
Type something in your file now :)


You may want to write `hello world! this is vim!`.

Now hit `ESC` to enter command mode and type: 
```bash
:wq vimfile.txt
```
This will exit `vim` and save the file to the name we've given.

Call `cat` on your file to confirm that it includes your text!
> [!TIP]
>For more information, please see this cheat sheet:
>[https://vim.rtorr.com/](https://vim.rtorr.com/)

<!-- #### Other text editors
You can also check out these text editors if you are interested.
| Text Editor  | Short description | Link or command |
| ------------- | ------------- | ------------- |
| `nano`  | Content  || -->

### `head` and `tail`
Sometimes, a file can be so large that it's unwieldy to use `cat`.
Or, occasionally, you'll only want to see the top or bottom of a file. 
In this case, you can use `head` or `tail`.
```bash
head Chloroplast_Genes.fa
# to get only the first two lines:
head -n 2 Chloroplast_Genes.fa 

tail Chloroplast_Genes.fa
# to get only the last two lines:
tail -n 2 Chloroplast_Genes.fa

```
<!-- 
### `wget` and `curl`
```bash

```
-->
## Scripting, variables, loops, reading files

When we have a command that we want to call multiple times, for multiple files, we can use a **loop** to complete the same action repeatedly.

This is useful when we have a large amount of files.

Navigate to the `alexas_section/chloro` folder.
Each file in this folder represents a gene.

<!-- KF: I guess you are planning to add more stuff here too? -->

## Problem solving
<!-- FIXME complete this section-->

![](https://preview.redd.it/r67fvj6jycj21.jpg?auto=webp&s=555a489422ead2016d5592a2b70c8a4bdb6c7237)

When looking for help, you can take a few different approaches. 
Classic Google searches, in many cases, can be difficult to navigate when you are unfamiliar with a new programming language, and the vocabulary for finding your answer might escape you. 
Sometimes you can find a needle in the haystack by Googling "how to make this thing do another thing" because you lack terminology, but learning how to accurately describe the issue you are facing will go a long way in getting you closer to an answer.

The advice below will help you the most if you are flexible and broad with your search strategy.
This is to say that you should open at least the top three hits to a question or error message.
Consider the answers on the page and whether they seem to explain your issue in terms that you understand. 
Since there are many ways to solve a problem, you should find the easiest and simplest way to do it.
If your simple variable assignment error can be solved in one line, why do it in ten?

Consider if each approach makes sense to you. 
I try to avoid helpful tips that include installing packages or modules unless it's my last resort.

If none of the top 3-ish hits seem to solve my problem, I usually change the wording and try again.

One piece of advice is that you should always paste your error message into Google. 
You will find that many people have had the same issue. 

However, if the error message is over 2 lines, and wordy, consider trimming some of it.
If the error message includes your own directory structure, remove that unless you're trying to do something with the basic file system. 
Because every user has their own directory setup, you'll get more specific hits if you prioritize the error in question.

 <!-- fixme include example here -->

### Safety risks while looking for answers online

Please exercise caution when copying and pasting code _that you don't understand_ from online sources into your terminal.
As a beginner, you should prioritize code that makes sense within your current understanding, and build upon your current knowledge. 
You may not be working with complex databases from day 1, but that's _totally fine_.


This StackOverflow post is a gentle reminder that copying and pasting code (this particular example is in Python) from dubious sources can be a security risk:

[https://meta.stackoverflow.com/questions/407049/blindly-copy-pasting-code-is-bad-a-gentle-reminder](https://meta.stackoverflow.com/questions/407049/blindly-copy-pasting-code-is-bad-a-gentle-reminder)


## 🚩 Red flags: Code to avoid 🚩

`sudo` is a powerful way to run commands at an administrator level.
Unless you understand _why_ you are using `sudo`, _and_ there is no other way to accomplish the task, it's best to avoid using it. 

Your OS has some built in protections against running potentially damaging code, or altering files that are essential to keep your system working.

You will occasionally need `sudo` in order to install software or a package.
This is normal and you should 
Still exercise caution in these cases, and don't install software from places you don't trust (one way to check this is to make sure your website link matches one in a scientific publication before downloading or running code from it).

Do not under any circumstances run any iteration of this:
```bash
sudo rm -rf /*
```
Check out `man rm` to see why the flags `-r` and `-f` would be a bad idea to run together.

```console
     -f      Attempt to remove the files without prompting for confirmation, regardless of the file's permissions.  If the file does not exist, do not display a diagnostic message or modify the exit status to reflect an error.  The -f option overrides any previous -i options.
     -R      Attempt to remove the file hierarchy rooted in each file argument.  The -R option implies the -d option.  If the -i option is specified, the user is prompted for confirmation before each directory's contents are processed (as well as before the attempt is made to remove the directory).  If the user does not respond affirmatively, the file hierarchy rooted in that directory is skipped.

     -r      Equivalent to -R.

```

Since `/` is your root directory for many operating systems, this will erase all files with admin privileges.


You can call `./*` as a way to wildcard (`*`) expand all folders underneath your current working directory `.`

Editing or accessing all files in your current working directory `./*` is very different from editing or accessing all files in your `root` directory `/*`, so make sure to use caution when using `./*`.

Now you have the prerequisite information to understand the meme below:

![Star wars Anakin and Padmé meme format. Anakin is labeled "Junior dev". Padme is labeled "Senior Dev". Panel 1/4: Junior Dev: I finished running "rm -rf /" Panel 2/4: Senior Dev: You mean "rm -rf ./", right? Panel 3/4: Junior Dev: (nothing written, Anakin has a serious face) Panel 4/4: Senior Dev: You mean "rm -rf ./", right? ](https://i.redd.it/58qqxaljblc91.jpg)

<!-- https://en.wikipedia.org/wiki/Perl#Philosophy -->


Some versions of this meme will try to get beginners to remove the "radio frequency" or "french language" package from their system.
Now you know! 

![ Kinnaird McQuade / @kmcquade3 / Linux tips 1. Always remove the french language pack: sudo rm -fr ./*](https://i.imgur.com/IDfBUo4.jpg)

The above version assumes that you run it from root, and that `./*` will be the same as `/*`. 
A more destructive version of this tweet would say `/*`.

<!-- FIXME insert some links for simple coding vocab here -->

<!-- You will get the most helpful resources from ... -->


## Demonstration of the skills we put together
<!-- FIXME complete this section-->
In this example, you will use a line-separated `.txt` file to download some herbarium images.
Each line in this file will have a link to a photo of an herbarium specimen from the Field Museum, which you can access by clicking the link. 
Here's an example:
[https://fm-digital-assets.fieldmuseum.org/2243/650/V0533979F.jpg](https://fm-digital-assets.fieldmuseum.org/2243/650/V0533979F.jpg)

<!-- KF: I like all the memes! -->

You can always download these by clicking on the link, opening it in the browser, and then saving it to a folder of your choice. 

What if there was an easier way? And what if you want to download 10 of these images? What about 100?

This is where bash comes in handy, because clicking the link and manually saving images becomes tedious quickly, and we rarely work on scales of a few images.

Navigate to `botany-2025-shell/examplefiles/alexas_section/herbariumphotos/`. 
Check out the `multimedia.txt` file.

```bash
head -n 2 multimedia.txt
```
Looks like it's <kbd>Tab</kbd> separated, and the image links are in the fourth column.
We will have to use a bit of bash magic to get the links.
Let's try downloading one of them.
```bash
cd output_herbphotos/
wget http://fm-digital-assets.fieldmuseum.org/2243/650/V0533979F.jpg
```

Okay, now it's in our main folder.
If we download all of them like this, it's a bit of effort, and our main folder might get a bit messy.


>[!TIP]
>For information on how to select your own images for downloading, visit https://www.gbif.org/occurrence/search and select images for the species or genus of your choice. 
> You'll have to make an account to generate and download a custom `multimedia.txt` file.
>
>**Make sure you're familiar with Creative Commons licenses before using others' images**.


```bash
head -n 4 multimedia.txt | tail -n +2 |  awk '{print $4}'  | while read link; do echo $link; wget $link -P output_herbphotos;  done
```

Now if we have the file names:



## Summary and cheat sheet
In this lesson, we covered these commands:
| Command  | Short description of what it does |
| ------------- | ------------- |
| `ls`  | Content  |
| `man`  | Content  | 
| `cd`  | Content  | 
| `cat`  | Content  | 
|  `clear`  | Content  | 
| `history`  | Content  | 
| `echo`  | Content  | 
| `touch` | Content | 
| `mv` | Content | 
| `cp` | Content | 
| `nano` | Content | 
| `vim` | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 
| Content | Content | 