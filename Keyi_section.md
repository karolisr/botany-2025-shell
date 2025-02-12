# Keyi's section
> note that need to make sure have all commands in different system types

## Learning Objectives
> We are dedicated to equity-focused teaching. We will do our best to make the material accessible and transparent to all participants, regardless of background or system type. Please feel free to let us know during the session that if some material is not accessible to you (commands/links not working, teaching too fast, etc.)
 - Participants will be able to understand in general how the shell operates
 - Participants will be able to execute all listed operations in the command line on their laptop
 - When encountering a new package and/or error in the future, participants will know how to get familiar with the software and how to find ways to resolve the error
   
### References
Shotts, W. (2019). *The Linux command line: a complete introduction.* No Starch Press.

## Working with Packages

### Identifying Commands
> do all of these with 2 different commands to see a variety of usage
#### `type` - Display a command's type
```console
fky:~$ type ls
ls is an alias for ls -G
fky:~$ type cd
cd is a shell builtin
```
#### `which` - Display an Executable's Location
```console
fky:~$ which raxml
/usr/local/bin/raxml
fky:~$ which hybpiper
hybpiper not found
```
### Getting a Command's Documentation
#### `help` - Get help from shell builtins (exclusive for linux?)
```console
>>> help cd
```
#### `--help` - Display usage information
```console
fky:~$ raxml -h

This is RAxML version 8.2.12 released by Alexandros Stamatakis on May 2018.

With greatly appreciated code contributions by:
Andre Aberer      (HITS)
Simon Berger      (HITS)
Alexey Kozlov     (HITS)
Kassian Kobert    (HITS)
David Dao         (KIT and HITS)
Sarah Lutteropp   (KIT and HITS)
Nick Pattengale   (Sandia)
Wayne Pfeiffer    (SDSC)
Akifumi S. Tanabe (NRIFS)
Charlie Taylor    (UF)
......
```
Other varieties of the `-h` command
```bash
<package-command> --help
<package-command> -help
<package-command> -h
```
#### `man` - Display a program's manual page
```console
fky:~$ man cd
BUILTIN(1)                 General Commands Manual                BUILTIN(1)

NAME
     builtin, !, %, ., :, @, [, {, }, alias, alloc, bg, bind, bindkey,
     break, breaksw, builtins, case, cd, chdir, command, complete, continue,
     default, dirs, do, done, echo, echotc, elif, else, end, endif, endsw,
     esac, eval, exec, exit, export, false, fc, fg, filetest, fi, for,
     foreach, getopts, glob, goto, hash, hashstat, history, hup, if, jobid,
     jobs, kill, limit, local, log, login, logout, ls-F, nice, nohup,
     notify, onintr, popd, printenv, printf, pushd, pwd, read, readonly,
     rehash, repeat, return, sched, set, setenv, settc, setty, setvar,
     shift, source, stop, suspend, switch, telltc, test, then, time, times,
     trap, true, type, ulimit, umask, unalias, uncomplete, unhash, unlimit,
     unset, unsetenv, until, wait, where, which, while – shell built-in
     commands
......
fky:~$ man mkdir
MKDIR(1)                   General Commands Manual                  MKDIR(1)

NAME
     mkdir – make directories

SYNOPSIS
     mkdir [-pv] [-m mode] directory_name ...

DESCRIPTION
     The mkdir utility creates the directories named as operands, in the
     order specified, using mode “rwxrwxrwx” (0777) as modified by the
     current umask(2).
......
```
#### `apropos` - Display appropriate commands
```console
fky:~$ apropos partition
clmdist(1), clm dist(1)  - compute the distance between two or more partitions (clusterings). The distance that is computed can be any of split/join distance, variance of information, or Mirkin metric. clmdist is not in actual fact a program. This manual page documents the behaviour and options of the clm program when invoked in mode dist. The options -h, --apropos, --version, -set, --nop are accessible in all clm modes. They are described in the clm manual page
fdisk(8)                 - DOS partition maintenance program
gpt(8)                   - GUID partition table maintenance utility
pdisk(8)                 - Apple partition table editor
fdisk(8)                 - DOS partition maintenance program
gpt(8)                   - GUID partition table maintenance utility
pdisk(8)                 - Apple partition table editor
(END)
```
#### `whatis` - Display one-line manual page descriptions
```console
fky:~$ whatis cd
cd(n)                    - Change working directory
fky:~$ whatis mkdir
mkdir(1)                 - make directories
```
### Other helpful commands for package usage
#### `--version` - Display the installed version of the package
```console
fky:~$ raxml -v
This is RAxML version 8.2.12 released by Alexandros Stamatakis on May 2018.
......
fky:~$ java --version
java 15.0.2 2021-01-19
Java(TM) SE Runtime Environment (build 15.0.2+7-27)
Java HotSpot(TM) 64-Bit Server VM (build 15.0.2+7-27, mixed mode, sharing)
```
#### `alias` - Rename the package command in your system
```console
fky:~$ type rx
rx not found
>>> alias rx="raxml"
fky:~$ rx -h
This is RAxML version 8.2.12 released by Alexandros Stamatakis on May 2018.
...
fky:~$ unalias rx
fky:~$ type rx
rx not found
```
> [!TIP]
> To enable the same alias every time you reboot your system, save your `alias` command in your `.zrcsh` `.bashrc` or (sth in windows) files

## Connecting with Servers

### What is a server

### How to log in
```console
ssh <username>@<server-ip>
```

### `wget`
What does `wget` do 
```console
fky:~$ wget --help
GNU Wget 1.25.0, a non-interactive network retriever.
Usage: wget [OPTION]... [URL]...

Mandatory arguments to long options are mandatory for short options too.

Startup:
  -V,  --version                   display the version of Wget and exit
  -h,  --help                      print this help
  -b,  --background                go to background after startup
  -e,  --execute=COMMAND           execute a `.wgetrc'-style command

Logging and input file:
  -o,  --output-file=FILE          log messages to FILE
  -a,  --append-output=FILE        append messages to FILE
  -d,  --debug                     print lots of debugging information
...
```

### `rsync`

### `scp`

## Seting up the environment

### `PATH`
 - What is `PATH`
 - what you should and should not do with path

### configuration

### conda environment
 - Anaconda vs miniconda
 - Why is conda useful
 - what can you do with conda

## Asking for help with AI

### List of AT and compare

### Common prompts for AT

### How to navigate AT responses

##  `Git`

### What is `Git`

### `Git` repositories

### Common `Git` commands
