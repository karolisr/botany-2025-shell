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
fky:~$ help cd
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
fky:~$ alias rx="raxml"
fky:~$ rx -h
This is RAxML version 8.2.12 released by Alexandros Stamatakis on May 2018.
...
fky:~$ unalias rx
fky:~$ type rx
rx not found
```
> [!TIP]
> To enable the same alias every time you reboot your system, save your `alias` command in your `.zrcsh` `.bashrc` or (sth in windows) files

## Connecting with Remote Hosts
> problem here: I can demo it but how to let them try?

### What is a remote host
Unix-like operating systems have had the capability to be administered remotely via a network. This allows users to access high performance computing without physically manipulating bulky computers. Thus, access remote hosts is an essential ability to have with regards to command line.

### Checking network connection and remote host ip
8.8.8.8 is the primary IP address for Google's public DNS server. It's common to use it to check network connection in the shell.
```console
fky:~$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: icmp_seq=0 ttl=115 time=26.479 ms
64 bytes from 8.8.8.8: icmp_seq=1 ttl=115 time=17.021 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=115 time=194.726 ms
...
```
You can also use `ping` to check if the ip of your server exist and that it is connected to the network.
```console
fky:~$ ping <server-ip>
PING <server-ip> (<server-ip>): 56 data bytes
64 bytes from <server-ip>: icmp_seq=0 ttl=55 time=21.033 ms
64 bytes from <server-ip>: icmp_seq=1 ttl=55 time=54.150 ms
64 bytes from <server-ip>: icmp_seq=2 ttl=55 time=23.168 ms
64 bytes from <server-ip>: icmp_seq=3 ttl=55 time=27.657 ms
...
```

### Connect to remote hosts with `ssh`
Secure Shell (SSH) is the standard command to use to connect to remote hosts. It will ask for a password for the remote host:
```console
fky:~$ ssh <username>@<server-ip>
<username>@<server-ip>'s password:
```
Example screen for a successful login
```console
fky:~$ ssh <username>@<server-ip>
<username>@<server-ip>'s password:
Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 6.5.0-44-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

Expanded Security Maintenance for Applications is not enabled.

221 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

8 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm

*** System restart required ***
Web console: https://ubuntu22:9090/ or https://35.2.24.103:9090/

Last login: Mon Feb 17 13:37:23 2025 from 35.2.220.14
username@ubuntu22:~$ 
```
Part of what happens when you establish a connection with a remote host via SSH is that an encrypted tunnel is created between the local and remote systems. Then you can use the shell on the remote host like using the terminal on your local laptop.

To disconnect from the remnote host
```console
username@ubuntu22:~$ exit
logout
Connection to <server-ip> closed.
```
### `rsync`

### `scp`
The OpenSSH package also includes programs that can make use of an SSH-encrypted tunnel to copy files across the network. `scp` (secure copy) is used much like the familiar cp program to copy files. The most notable difference is that the source or destination pathnames may be preceded with the name of a remote host, followed by a colon character.

> [!TIP]
> You cannot use `scp` when you are logged onto the remote server

Copying files from remote to local, local to remote, remote to remote, copy entire folder, other common scp options, are the `"` needed?
```console
fky:~$ scp <username>@<server-ip>:"/path_to_the_file_to_copy" /path_of_the_local_folder_to_save
fky:~$ scp -r <username>@<server-ip>:"/path_to_the_folder_to_copy" /path_of_the_local_folder_to_save
fky:~$ scp -r <username>@<server-ip>:"/path_to_the_folder_to_copy" /path_of_the_local_folder_to_save
```

### `screen`

### Downloading files from the web and FTP sites with `wget`
Single files, multiple files, and even entire sites can be downloaded with `wget`.
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
Example of using `wget`
```console
fky:~$ wget http://linuxcommand.org/index.php
--2025-02-18 20:50:52--  http://linuxcommand.org/index.php
Resolving linuxcommand.org (linuxcommand.org)... 216.105.38.11
Connecting to linuxcommand.org (linuxcommand.org)|216.105.38.11|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3929 (3.8K) [text/html]
Saving to: ‘index.php’

index.php           100%[=================>]   3.84K  --.-KB/s    in 0s      

2025-02-18 20:50:52 (35.0 MB/s) - ‘index.php’ saved [3929/3929]
```
Note that the URL of FTP sites starts with `ftp://`
```console
fky:~$ wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/026/745/355/GCF_026745355.1_EL10.2/
```

## Seting Up the Environment

### The Environment
> The shell maintains a body of information during our shell session called the _**environment**_. Programs use the data stored in the environment to determine facts about the system’s configuration. While most programs use configuration files to store program settings, some programs also look for values stored in the environment to adjust their behavior. Knowing this, we can use the environment to customize our shell experience.

The shell stores two basic types of data in the environment; though, with bash, the types are largely indistinguishable. They are _**environment variables**_ and _**shell variables**_. Shell variables are bits of data placed there by bash, and environment variables are everything else. 

#### Viewing shell and enviroment variables with `printenv`, `set`, and `echo`
`printenv` will only display environment variables, while `set` will display both shell and environment variables. You can see that `printenv` and `set` output different list of variables below.
```console
fky:~$ printenv
__CFBundleIdentifier=com.apple.Terminal
TMPDIR=/var/folders/44/wzzp9dzs31v_2wbx_96mn2qr0000gn/T/
XPC_FLAGS=0x0
LaunchInstanceID=905F4111-B673-4A34-90D1-35BFDD64568B
TERM=xterm-256color
DISPLAY=/private/tmp/com.apple.launchd.OhmBGOCU7J/org.xquartz:0
SECURITYSESSIONID=186a2
SSH_AUTH_SOCK=/private/tmp/com.apple.launchd.Wp8d9kc6P1/Listeners
XPC_SERVICE_NAME=0
USER=fky
...
```
```console
fky:~$ set
'!'=674
'#'=0
'$'=638
'*'=(  )
-=569JNRXZghiklms
0=-zsh
'?'=0
@=(  )
ARGC=0
BG
CDPATH=''
COLUMNS=90
CONDA_DEFAULT_ENV=base
...
```
The `printenv` command can also list the value of a specific variable, but you cannot use the `set` command the same way.
```console
fky:~$ printenv USER
fky
```
It is also possible to view the contents of a variable using the echo command.
```console
fky:~$ echo $USER
fky
```
Folks frequently use `echo` to show what is in their `PATH`.
```console
fky:~$ echo $PATH
/home/fky/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/
```
> [!TIP]
> Aliases cannot be shown by `set` or `printenv`, but you can display the list of aliases by entering the `alias` command without arguments.
```console
fky:~$ alias
-='cd -'
...=../..
....=../../..
.....=../../../..
......=../../../../..
1='cd -1'
...
```
#### Other useful variables to know about:
| Variable  | Contents|
| ------------- | ------------- |
| `DISPLAY`  |   The name of your display if you are running a graphical environment. Usually this is :0, meaning the first display generated by the X server.    |
| `EDITOR`  | The name of the program to be used for text editing. |
|`SHELL`| The name of your shell program. |
|`HOME`| The pathname of your home directory. |
|`LANG`| Defines the character set and collation order of your language. |
|`OLDPWD`| The previous working directory. |
|`PAGER`| The name of the program to be used for paging output. This is often set to /usr/bin/less. |
|`PATH`| A colon-separated list of directories that are searched when you enter the name of a executable program. |
|`PS1`| Stands for “prompt string 1.“ This defines the contents of the shell prompt. As we will later see, this can be extensively customized. |
|`PWD`| The current working directory. |
|`TERM`| The name of your terminal type. Unix-like systems support many terminal protocols; this variable sets the protocol to be used with your terminal emulator. |
|`TZ`| Specifies your time zone. Most Unix-like systems maintain the computer’s internal clock in Coordinated Universal Time (UTC) and then display the local time by applying an offset specified by this variable. |
|`USER`| Your username. |

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

```console
fky:~$ 
```