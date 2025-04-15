# Table of Contents <!-- omit in toc -->

 - [Learning Objectives](#learning-objectives)
   - [References](#references)
 - [Working with Packages](#working-with-packages)
 - [Connecting with Remote Hosts](#connecting-with-remote-hosts)
 - [Seting Up the Environment](#seting-up-the-environment)
 - [Asking for help with AI](#asking-for-help-with-ai)
 - [Git](#git)

## Learning Objectives
> We are dedicated to equity-focused teaching. We will do our best to make the material accessible and transparent to all participants, regardless of background or system type. Please feel free to let us know during the session that if some material is not accessible to you (commands/links not working, teaching too fast, etc.)
 - Participants will be able to understand in general how the shell operates
 - Participants will be able to execute all listed operations in the command line on their laptop
 - When encountering a new package and/or error in the future, participants will know how to get familiar with the software and how to find ways to resolve the error
   
### References
Shotts, W. (2019). *The Linux command line: a complete introduction.* No Starch Press.

Tool Development course material from Dr. Cristina Mitrea at the University of Michigan

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
<!-- Alexa's note: could include something here that is in the $PATH by default since some folks will not have raxml or hybpiper installed -->

### Getting a Command's Documentation
#### `help` - Get help from shell builtins (exclusive for linux?)
```console
fky:~$ help cd
```
<!-- Alexa's note: this didn't work for me on mac zsh 5.9 -->
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
<!-- AT: same as above, slight caveat in that some people will not have raxml so might be good to have a backup command here -->
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
<!-- AT: could be good to note here that you need to press Q to quit, otherwise some may get stuck in the manual -->
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
<!-- AT: Same as above, raxml might not be on everyones system so you could even do an `ls` alias - I have one aliasing `ll` to `ls -lah`. We can also walk them through using nano or vim to add the alias to their .rc file
  -->

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
<!-- AT note: will need to use CTRL+C to interrupt this -->
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

### `scp`
The OpenSSH package also includes programs that can make use of an SSH-encrypted tunnel to copy files across the network. `scp` (secure copy) is used much like the familiar cp program to copy files. The most notable difference is that the source or destination pathnames may be preceded with the name of a remote host, followed by a colon character.

> [!TIP]
> You cannot use `scp` when you are logged onto the remote server

Copying files from remote to local, local to remote, remote to remote, copy entire folder
```console
fky:~$ scp <username>@<server-ip>:/path_to_the_file_to_copy /path_of_the_local_folder_to_save
fky:~$ scp -r <username>@<server-ip>:/path_to_the_folder_to_copy /path_of_the_local_folder_to_save
fky:~$ scp -r <username>@<server-ip>:/path_to_the_folder_to_copy /path_of_the_local_folder_to_save
```
<!-- AT: I really like this section and I feel like it is very clear. -->
**Other commonly used options of `scp`**
| Option | Description |
|--------|-------------|
| `-r`   | Recursively copy directories and their contents. |
| `-C`   | Enable compression for faster transfers. |
| `-v`   | Enable verbose output to debug connection issues. |
| `-q`   | Suppress non-error output (quiet mode). |
| `-l`   | Limit bandwidth usage in Kbit/s (e.g., `-l 1000`). |
| `-p`   | Preserve file attributes such as timestamps and permissions. |
| `-B`   | Run in batch mode, preventing password prompts. |

### `rsync`
Similar to `scp`, `rsync` is a fast and versatile file-copying tool commonly used for synchronizing files and directories between local and remote systems. It minimizes data transfer by only copying differences between source and destination.

It is commonly used for backups, incremental file transfers, and efficient remote synchronization.

```console
fky:~$ rsync -avz file.txt <username>@<server-ip>:/path_to_the_file_to_copy
```
**Commonly used options of `rsync`**
| Option | Description |
|--------|-------------|
| `-a`   | Archive mode (preserves symbolic links, permissions, timestamps, etc.). |
| `-v`   | Verbose output (shows detailed progress). |
| `-z`   | Enable compression to speed up transfers. |
| `-r`   | Recursively copy directories (included in `-a`). |
| `-P`   | Show progress and resume interrupted transfers. |
| `--progress` | Display real-time transfer progress. |
| `-e "ssh"` | Use SSH for secure file transfers. |
| `--delete` | Delete files in the destination that no longer exist in the source. |
| `--exclude="pattern"` | Exclude files matching a pattern (e.g., `--exclude="*.log"`). |
| `--include="pattern"` | Include specific files in transfer despite exclusions. |
| `--dry-run` | Show what would happen without actually copying files. |
| `-n`   | Alias for `--dry-run`. |
| `-u`   | Skip files that are newer in the destination. |
| `--bwlimit=RATE` | Limit bandwidth usage (e.g., `--bwlimit=1000` for 1MB/s). |
| `--checksum` | Compare files using checksums instead of timestamps. |

### Compare `scp` and `rsync`

| Feature         | `rsync` | `scp` |
|---------------|--------|------|
| **Transfer Method** | Uses **delta transfer** (only transfers changed parts of files). | Transfers **entire files** every time. |
| **Speed Efficiency** | Faster for repeated transfers due to incremental copying. | Slower as it copies everything, even unchanged files. |
| **Preserving Metadata** | Preserves file attributes (`-a` for archive mode). | Partially preserves timestamps and permissions (`-p`). |
| **Resuming Transfers** | Can resume interrupted transfers (`-P` or `--partial`). | Cannot resume; must restart the transfer. |
| **Progress Display** | Can show detailed progress (`--progress`). | No built-in progress display. |
| **Exclusion Rules** | Allows excluding specific files or directories (`--exclude`). | No built-in exclusion support. |
| **Syncing Files** | Deletes destination files that don’t exist in the source (`--delete`). | Only copies; does not sync differences. |
| **Usage Scenario** | Best for **backups, syncing directories, and large file transfers**. | Best for **simple, one-time file transfers**. |

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
<!-- AT: I felt like this section is really concise and I like the tables! -->

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
`PATH` is a colon-separated list of directories that are searched when you enter the name of a executable program Folks frequently use `echo` to show what is in their `PATH`.
```console
fky:~$ echo $PATH
/home/fky/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/
```

What you should and should not do with `PATH`:
<!-- AT: should there be a section of what not to do with $PATH here? -->
✅Add Custom Directories to `PATH`
> If you have custom scripts or binaries, add their directory to PATH in your shell config (`~/.bashrc`, `~/.bash_profile`, or `~/.zshrc`)

```console
fky:~$ export PATH="$HOME/bin:$PATH"
```
This ensures you can run your scripts from anywhere without specifying the full path.

<!-- They might need a reminder here to reload their shell and then check their path with `which` and echo $PATH- could mention that here. I struggled with $PATH a lot as a beginner and I think a lot of issues could have been solved by just knowing how to reload my shell and check my path-->

### **Configuration**
When we log on to the system, the bash program starts and reads a series of configuration scripts called startup files, which define the default environment shared by all users. This is followed by more startup files in our home directory that define our personal environment. The exact sequence depends on the type of shell session being started. There are two kinds:
> **A login shell session**: This is one in which we are prompted for our username and password. This happens when we start a virtual console session (SSH or GUI terminal login), for example.

| **File**  | **Contents**|
| ------------- | ------------- |
| `/etc/profile`  |   A global configuration script that applies to all users.    |
| `~/.bash_profile`  | A user’s personal startup file. It can be used to extend or override settings in the global configuration script. |
|`~/.bash_login`| If ~/.bash_profile is not found, bash attempts to read this script. |
|`~/.profile`| If neither ~/.bash_profile nor ~/.bash_login is found, bash attempts to read this file. This is the default in Debian-based distributions, such as Ubuntu. |

> **A non-login shell session**: This typically occurs when we launch a terminal session in the GUI, i.e. opening a new terminal window.

| **File**  | **Contents**|
| ------------- | ------------- |
| `/etc/bash.bashrc`  |   A global configuration script that applies to all users.    |
| `~/.bashrc`  | A user’s personal startup file. It can be used to extend or override settings in the global configuration script. |

> [!TIP]
> In addition to reading the startup files listed above, non-login shells inherit the environment from their parent process, usually a login shell. Remember because most of the filenames listed start with a period (meaning that they are hidden), we will need to use the `-a` option when using `ls`.

**Common content in `.bash_profile` file**:
 - Setting Environment Variables
 - Aliasing Commands
 - Customizing the Shell Prompt (PS1) (example?)
 - Running Other Startup Scripts (`.bash_profile` often loads `.bashrc` for consistency)
 - Setting Up a Custom PATH
 - Running Background Processes on Login
 - Custom Functions

The changes we have made to our `.bashrc` will not take effect until we close our terminal session and start a new one because the `.bashrc` file is read only at the beginning of a session. However, we can force bash to reread the modified `.bashrc` file with the following command:
```console
fky:~$ source ~/.bashrc
```

### Conda Environment

#### Why `conda`?
Using `conda` in bioinformatics is highly beneficial because it simplifies package management, dependency resolution, and environment control, which are crucial in scientific computing. 
 - Conda provides a simple way to install and manage packages from channels like bioconda, which hosts thousands of bioinformatics tools.
 - Many bioinformatics tools require specific versions of dependencies. Conda allows you to create isolated environments, preventing conflicts between tools.

#### Anaconda vs Miniconda

| Feature           | Anaconda                          | Miniconda                         |
|------------------|--------------------------------|--------------------------------|
| **Size**        | Large (~500MB)                 | Small (~40MB)                  |
| **Includes**    | Conda, Python, and 100s of preinstalled packages (NumPy, Pandas, SciPy, etc.) | Only Conda and Python (minimal setup) |
| **Best for**    | Users who want a ready-to-use data science environment | Users who prefer a lightweight setup and install packages as needed |
| **Installation Time** | Longer due to preinstalled packages | Faster due to minimal installation |
| **Flexibility**  | Less flexible (comes with many packages by default) | More flexible (you choose which packages to install) |
| **Package Management** | Uses Conda package manager | Also uses Conda package manager |
| **System Resource Usage** | Higher (more packages and dependencies) | Lower (minimal setup) |
| **Default Channels** | Defaults to Anaconda’s official repository | Defaults to Anaconda’s repository but can use other sources |
| **Usage Scenario** | Ideal for beginners or those who want a fully-featured data science environment out-of-the-box | Ideal for experienced users who want a lightweight setup and control over installed packages |

#### Where to start with `conda`?
Conda is pretty straghtforward to [install](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) and has clear, easy-to-start [tutorials](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html) on their website.
<!-- AT: will we have them set up conda in the workshop if we have time? Or should we just make them aware of it?  -->
## Asking for help with AI
We encounter errors and problems while dealing with the command line **all the time**. Sometimes, it takes a long time to fish out useful information with *Google* or even it can turn out fruitless. In many cases, using an AI tool can solve your shell problem much faster.

### Comparing different AI tools for shell help

| Feature                  | ChatGPT                                                   | GitHub Copilot                                          | DeepSeek                                                  |
|---------------------------|----------------------------------------------------------|---------------------------------------------------------|----------------------------------------------------------|
| **Strengths**              | Excellent natural language understanding; detailed explanations; adaptable to various shell scenarios | Code completion; quick shell script generation; seamless integration with IDEs like VSCode | Efficient in generating code snippets and solving shell-related problems; handles technical queries well |
| **Weaknesses**             | Not directly integrated with IDEs or terminals           | Limited conversational ability; may generate incorrect shell commands without proper context | May lack conversational flexibility; limited third-party integrations |
| **Context Awareness**      | High (understands complex shell scenarios)               | Medium (best for code suggestions)                      | Medium (focused on technical code completion)            |
| **Integration**            | Web-based or API; third-party CLI available              | Integrated within IDEs                                  | Available via API or CLI                                 |
| **Pricing**                | Free/Paid (via OpenAI API)                               | Paid (GitHub Copilot Subscription)                      | Free/Paid (varies based on usage)                        |

For now, *ChatGPT* is still the most helpful AI chatbot for shell help in general, although *Copilot* is very useful for coding.

> [!TIP]
> This table was generated by ChatGPT!

### Common prompts for GenAI

[prompts.chat](https://prompts.chat/): designed to provide an enhanced UX when working with prompts. With just a few clicks, you can easily edit and copy the prompts on the site to fit your specific needs and preferences. On this website, you will find a variety of prompts that can be used with ChatGPT and other AI chat models.

[Guide to write a GenAI prompts](https://genai.umich.edu/resources/prompt-literacy)

[Copilot Chat Cookbook](https://docs.github.com/en/copilot/copilot-chat-cookbook)

**Some of the prompts that I used:**
 - "Compare chatgpt, copilot, and deepseek for shell debug questions in a markdown table"
 - "How to parallel this bash script in groups of 20? There are 300 things to loop through" (bash script attached)
 - "I ran <*this command*>. Why did I get <*this error message*>"

> [!TIP]
> GenAI often is more helpful when you give more context, e.g. uploading your bash scripts.

### How to navigate AI responses
Although GenAI tools are very helpful, it’s also sometimes wrong, and with great confidence. Be careful when using `sudo` commands and `rm`ing things. Other than those, it is often ok to try the instructions from AI and feed the results back to it when things are still not working.
<!-- AT: I don't often use AI for coding so I can't comment on a lot of this but it seems very informative! I would also add that chatgpt can be good alongside something like https://explainshell.com/ to enhance your shell learning -->
##  `Git`

### What is `Git`
The `git` command is the main command-line tool used to interact with Git, a version control system. It allows you to manage source code repositories, track changes, collaborate with others, and maintain project history.

GitHub is not the only website that hosts git repositories. Gitlab, Bitbucket, and SourceForge are some other ones.

The benefits of using version control softwares:
 - Optimized way to track changes
 - Working in a team
 - Backup
 - Reproducibility
 - Transparency (ownership, credit, blame)

### Defining terminologies
 - **_snapshot_** – the status and content of all files up to a moment in time
 - **_commit_** – create a snapshot of
   - Files changes
   - Link to previous commit
 - ***repository*** – files under version control software and collection of commits (can be local or remote, on a server)
 - ***clone*** – bring in a local copy of a remote repository and keep a link so the local repository and remote repositories can communicate
 - ***branch*** – a copy of a snapshot for independent development
 - ***master*** – the main branch of a project head – reference to the most recent commit
 - ***pull*** – bring the latest (commits), versions of the files tracked on the remote repository, to the local copy
 - ***push*** – update the remote repository with the local commits

### Common `Git` commands

| **Command**                 | **Description**                                           |
|------------------------------|----------------------------------------------------------|
| `git init`                   | Initialize a new Git repository in the current directory. |
| `git clone <repo>`           | Clone a repository from a URL.                           |
| `git add <file>`             | Stage a file for commit.                                 |
| `git commit -m "message"`    | Commit changes with a descriptive message.              |
| `git status`                 | Show the working tree status.                           |
| `git log`                    | View the commit history.                                |
| `git branch`                 | List all branches.                                      |
| `git branch <name>`          | Create a new branch.                                    |
| `git checkout <branch>`      | Switch to a specific branch.                            |
| `git merge <branch>`         | Merge a branch into the current branch.                 |
| `git pull`                   | Fetch and merge changes from a remote repository.      |
| `git push`                   | Push local changes to a remote repository.              |
| `git remote -v`              | List the remote repositories.                           |

<!-- AT: I think if we have 10 minutes and they already have a github account, we can have them set up a quick empty git repo. They could try to git pull the repo for this workshop too as an exercise. That might be a bit far-fetched but I think being able to understand the workflow of git clone / git pull / git add -A / git commit -m "msg" / git push is really important -->