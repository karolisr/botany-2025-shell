# Bash & Command-Line Interface Workshop, Botany 2025

## Welcome

Welcome to the command-line interface (CLI) workshop! As the organizers (Alexa, Keyi, and Karolis), we are hoping to help you discover some fun and time-saving approaches to streamline your work and understand your computer a bit better. 
This workshop is geared towards total beginners — no experience is required. 

Our contact information is below:


- Alexa Tyszka (she/her), University of Illinois Chicago, atyszka2@uic.edu

- Keyi Feng (she/her), University of Michigan, fky@umich.edu

- Dr. Karolis Ramanauskas, University of Illinois Chicago, kraman2@uic.edu

## Course goals
![](https://blob.gifcities.org/gifcities/45UY5P3XCTNJLRO6I67GTSSBQ6YMFULP.gif)
- Participants will be able to understand in general how the shell operates
- Participants will be able to execute all listed operations in the course material in the command line on their laptop
- When encountering a new package and/or error in the future, participants will know how to get familiar with the software and how to find ways to resolve the error

## Course material

[Section 1:](https://github.com/karolisr/botany-2025-shell/blob/main/alexas_section.md)

- Why command line? & learning objectives - Alexa (5 min) 

- Navigation and file concepts (20 min) - Alexa

- Creating and editing folders and files (20 min)  - Alexa

- Helpful commands, introduction to programming structures (20 min)  - Alexa

Section 2

[Section 3:](https://github.com/karolisr/botany-2025-shell/blob/main/03.md)
- Working with commands/tools (20 min) - Keyi
- Setting Up the Environment (20 min) - Keyi
- Connecting with Remote Hosts (20 min) - Keyi



## First steps: Hello world!

If you're following along virtually, we request first that you attempt to open a terminal window.
From here, you'll be prepared for the class. 
Goal: open a terminal window and print a simple 'hello world'.


### Mac/Linux

Open "Terminal" in your applications folder.


### Windows

1. Please install `wsl` by running
```
wsl --install
```
and following the isntructions.

2. Restart your PC.

3. Open the WSL app (penguin icon!).

### Now that you've opened your terminal...

Try typing or copying and pasting these lines into the terminal window.

```bash
STR="Hello world!"
echo $STR
```

Quick explanation: 

This step sets the variable called `STR` to equal (`=`) the string of characters `Hello world!`. Then, we can `echo` the contents of this variable by using `$` to specify that we are calling a variable.


Bonus questions:
- What happens if you put other text into `STR`?
- What if you try setting a different variable like `NAME`?
- What happens if you forget to use `$`?

## First steps:
Download the first set of example files by running 
```
git clone https://github.com/karolisr/botany-2025-shell.git
```

## Useful Links and Tips

- [ShellCheck (editor plugin, or online)](https://www.shellcheck.net)
<!-- - [Keyboard shortcut code generator for Markdown (eg.: <kbd>⌘ Command</kbd> + <kbd>⌃ Control</kbd> + <kbd>⌥ Option</kbd> + <kbd>G</kbd>)](https://kbd.hsuan.xyz) -->
- [Cheat-sheet](https://devhints.io/bash)

- [Linux command line textbook](https://www.kea.nu/files/textbooks/humblesec/thelinuxcommandline.pdf)