# Bash & Command-Line Interface Workshop, Botany 2025

## Welcome

Text

## First steps

How to open a terminal application; hello world.

### Windows

Windows screenshot

### Mac

Mac screenshot

### Linux

Linux screenshot here

### Now that you've opened your terminal...

Try typing or copying and pasting these lines into the terminal window.

```bash
STR="Hello world!"
echo $STR
```

This step sets the variable called `STR` to equal (`=`) the string of characters `Hello world!`. Then, we can `echo` the contents of this variable by using `$` to specify that we are calling a variable.
* What happens if you put other text into `STR`?
* Try setting a different variable like `NAME`?
* What happens if you forget to use `$`?

Drafting: (from google drive)

# Ideas for things to talk about

### Alexa:

- Computer and file basics, navigation:
  - `cd`, `ls`, `..`, `clear`
  - shortcuts: CTRL+U/E/A, up/down, history
- Basic commands: `echo`, `cat`, `touch`, `nano`, `head`, `tail`, `tail -f`, `rm`, `cp`
- How to google a problem, which stackoverflow answers are good
- Scripting, variables, loops, reading files.


### Keyi:

- Working with commands: help, version, `man`, `alias`, etc.
- Remote connections: `ssh`, `wget`, `curl`, `rsync`, `scp`
- Setup: path, configuration, Conda environment
- ChatGPT, debugging
- Git

### Karolis:

- Standard streams:
  - input (0, stdin)
  - output (1, stdout)
  - error (2, stderr)
- Redirection of streams: `2>&1`, `&>`, `>`, `>>`, pipes (`|`)
- Output and text manipulation: `sort`, `grep`, `sed`, `wc`, etc.
- Setup:
  - environmental variables
  - bash configuration files: .bashrc, .profile, etc.
- Running processes (and manipulation): `ps`, `kill`, `top`, `htop`, `btop`, etc.
  - Background/foreground: `CTRL+Z`, `bg`, `fg`
- Wildcards, "globbing" patterns: `*`, `?`, `{}`, `[]`, `[!]`
- `screen`

# Useful Links and Tips

[Use ShellCheck (editor plugin, or online)](https://www.shellcheck.net)
