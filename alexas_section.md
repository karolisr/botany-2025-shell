# botany-2025-shell, Alexa's section (needs to be edited)

## Welcome

This is where the table of contents will go.

## Computer and file basics
This section will cover some of the basics of interacting with your computer through the command line. 
### Navigation
The most common way to interact with your computer is through a GUI (Graphical User Interface). Actions like clicking and dragging a file, or renaming a file, or creating a folder, are done through menus and buttons that easily display what their functions are. Underneath the GUI, like a skeleton, the computer is told to perform a cascade of actions that result in the file being moved, or the folder name changing, for example. When we use the command line interface (CLI), we get closer to operating in the same language as the computer, without as much visual output, and we gain the power to interact with our computers through scripts and complex actions.

Since many of us are familiar with the basics of moving files around a desktop and creating folders, this is one of the first exercises that we can do using the CLI. 

Depending on your familiarity with your operating system and its file explorer, this might feel very familiar. One way to visualize what is going on is to open files in your file explorer at the same time as you edit them using the CLI. 

Ready? Now let's open your terminal window. You'll see some kind of a prompt. Note: my prompt is `»`. It'll appear when I copy and paste my output. You do not need to type this into your input since it just lets me know where I started typing. You can change yours if you'd like, but we can get to that later. 

### `ls` (list files)
Let's run this command first. Type this into the window:
```
ls
```

You'll see a list of the folders and files you have in your root directory!

```
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
We can list files from inside each of these folders, too. Try:
```
ls Desktop
```
To access a folder inside a folder, you can use a `/`. Pick a folder of your choice, or from another place if your desktop is folder-less.
```
ls Desktop/sra
```
Different options exist for using `ls`. When you add an option to a command, you will use `-`. The most basic options will have letters that may have something to do with the type of option. Sometimes, they might not make any sense. They will sometimes have a longer form, which will work the same. I am constantly using cheat sheets or taking my own notes on commands and their options, and Google is definitely your friend.

Here are some useful options for `ls`. Try them out!
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

Note also that the order of your letters don't matter. `ls -ltrah` is the same as `ls -latrh`. 

### `man` (manual)
One way to learn more about a command is by using the `man` command! You can scroll through the options available for a certain command. The options will range from interesting to entirely unhelpful.
```
man ls
```

Click `q` on your keyboard when you're ready to exit the manual page. 

### cd
### path
### `cat`
### wild cards
### clear, history
### terminal shortcuts
CTRL+U, E, A, up/down, CTRL+C
## Basic commands
### `echo`
### `cat`
### `touch`
### `nano` and `vim`
### `head` and `tail`
## How to Google a problem, thought process, How to google a problem, which stackoverflow answers are good
## Scripting, variables, loops, reading files


```
Computer and file basics, navigation (cd, ls, path, cat, *, .. , clear, shortcuts: CTRL+U/E/A, up/down, history)
Basic commands (echo, cat, touch, nano/vim, head, tail, -f, rm)
How to google a problem, which stackoverflow answers are good

```
