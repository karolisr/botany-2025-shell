# botany-2025-shell, Alexa's section

## Welcome and Learning Objectives

We are dedicated to equity-focused teaching. We will do our best to make the material accessible and transparent to all participants, regardless of background or system type. Please feel free to let us know during the session that if some material is not accessible to you (commands/links not working, teaching too fast, etc.)

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

### `cd` (change directory)
Thus far, we have been listing files starting from the same directory. In order to actually move around the system, we need to use a different command. 
<!-- %fixme not sure how this will work, will we have them git pull the directory first?  -->

Locate the directory with the course files. It's titled `botany-2025-shell`. 

Now run
```
ls -lah
cd examplefiles
ls -lah
```

> [!TIP]
> When using the terminal, you can press [UP]/[DOWN] on your keyboard to access previous commands. Another handy shortcut is using [TAB] to complete file paths. When I type `cd`, I also usually hit `[TAB]` to see the folders that I can move into. When you're presented with multiple folders after pressing `[TAB]`, you can use the [UP]/[DOWN] arrows to select a folder. 

### Terminal shortcuts save time!
<!-- CTRL+U, E, A, up/down, CTRL+C -->

If you accidentally use `cd examplefiles` instead of `cd examplefiles/`, you will usually end up in the right place. But please note that the trailing `/` indicates that this is a directory. `[TAB]` autocomplete should always include the trailing `/`. By using the `[TAB]` autocomplete shortcut, you can avoid some typo-induced frustration. 

At this point you may have also noticed that you cannot use the cursor to select a spot to edit your input, so it might be frustrating to `[DEL]` all the way back to where you want to edit. You are essentially working on a screen where there is one "insertion point" which you control using the keyboard rather than the mouse. I'm including a few time-saving terminal keyboard shortcuts here that I use all the time.

<!-- | First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | -->

| Shortcut  | Action |
| ------------- | ------------- |
| [Ctrl]+[U]  | Delete line in terminal  |
| [Ctrl]+[C]  | Cancel command (this is your emergency 'stop' lever!) |
| [Ctrl]+[R]  | **R**everse search/browse past commands |
| [Ctrl]+[L]  | c**L**ear the screen  |
| [Ctrl]+[A]  | Move the insertion point to the st**A**rt of the line |
| [Ctrl]+[E]  | Move the insertion point to the **E**nd of the line  |
| [Ctrl]+[W]  | Delete content to the beginning of the last **W**ord  |
<!-- | [Ctrl]+[C]  | Content Cell  | -->

<!--%fixme source: https://gist.github.com/bradtraversy/cc180de0edee05075a6139e42d5f28ce -->

### file paths (`.`, `..`, `/`)

Let's see what's in the folder `examplefiles/alexas_section`
```
cd alexas_section/
ls -lah
```
> [!TIP]
> Notice how the sorting of folders proceeds differently than we would sort them - it is technically alphabetical, but not sequential.

To enter one of these folders, we can use:

```
cd 11/
ls -lah
```

Now that we are here, how can we get back to the main folder? When calling `ls -lah`, you should see a screen like this:
```
ls -lah
total 0
drwxr-xr-x   3 alexa  staff    96B Feb  6 10:23 .
drwxr-xr-x  16 alexa  staff   512B Feb  6 10:23 ..
-rw-r--r--   1 alexa  staff     0B Feb  6 10:23 11.txt
```
The `.` and `..` represent the current directory and the parent directory, respectively. These are file paths we can call with `cd` and `ls` just like we used folders. 


<!-- | First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | -->

| Relative path | Call | Explanation |
| ------------- | ------------- | ------------- |
| `.`  | `ls .` / `cd .` |Calls current directory, so `cd` and `ls` just show you or take you to the current directory. Note that this is different from `cd` as a standalone call, which will take you back to your home/root directory.|
| `..`  | `ls ..` / `cd ..` ||
|`~`| `ls ~/(filepath)` / `cd ~/(filepath)`| `~` is your **root directory**, which means that this is a method for getting an absolute path. Since your root directory should retain the same file structure, you can call full file paths from the root directory without worrying about your currrent location. |
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

The difference between absolute and relative file paths will matter more later, when you want to be sure of the locations of your files. To maintain consistency in my scripts, I try to use **absolute paths** so I can remember where exactly I ran an analysis. For simple, quick movement around the filesystem, **relative paths** work great. For now, let's use relative paths and I will try to keep things consistent. Locate your github folder, and if you ever get lost, you can always `cd` back to the main github folder using an absolute path. 

I can call 
```
cd ~/Documents/GitHub/botany-2025-shell/
```
from any location on my computer's file system, and I will return to the main directory for this course. In this way, an absolute path can be an escape lever for you if you get lost. 

> [!TIP]
> You can also call `pwd` to display a full path for any location you find yourself in. 

### `cat`
### wild cards `*`
### clear, history

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
