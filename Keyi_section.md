# Keyi's section
> note that need to make sure have all commands in different system types

## Learning Objectives
> We are dedicated to equity-focused teaching. We will do our best to make the material accessible and transparent to all participants, regardless of background or system type. Please feel free to let us know during the session that if some material is not accessible to you (commands/links not working, teaching too fast, etc.)
 - Participants will be able to understand in general how the shell operates
 - Participants will be able to execute all listed operations in the command line on their laptop
 - When encountering a new package and/or error in the future, participants will know how to get familiar with the software and how to find ways to resolve the error

## Working with Packages

### How to access the package manual in the command line
> do all of these with 2 different commands to see a variety of usage
Try running only the package command first
```
<package-command>
```

```
<package-command> --help
<package-command> -help
<package-command> -h
man <package-command>
```
### Other helpful commands for package usage
```
# The installed version of the package
<package-command> --version
<package-command> -v

# Rename the package command in your system
alias raxml="raxml-ng"
```

## Connecting with Servers

### What is a server

### How to log in
```
ssh <username>@<server-ip>
```

### `wget`
What does `wget` do 
```
>>> wget --help
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
