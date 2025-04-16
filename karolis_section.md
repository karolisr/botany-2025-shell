# Table of Contents <!-- omit in toc -->

- [Terms](#terms)
- [Differences between **GNU Linux** and **BSD** (including **macOS**, and **Unix**) syntax](#differences-between-gnu-linux-and-bsd-including-macos-and-unix-syntax)
- [Windows](#windows)
- [Directory Structure](#directory-structure)
  - [Linux/macOS/BSD/UNIX vs. Windows](#linuxmacosbsdunix-vs-windows)
- [Bash/ZSH configuration](#bashzsh-configuration)
  - [Files](#files)
  - [Environmental variables](#environmental-variables)
- [Process Life-cycle and Job Control](#process-life-cycle-and-job-control)
  - [1. Process Life-cycle in Bash](#1-process-life-cycle-in-bash)
    - [What Happens When You Run a Command?](#what-happens-when-you-run-a-command)
  - [2. Foreground vs. Background Jobs](#2-foreground-vs-background-jobs)
    - [Foreground Jobs](#foreground-jobs)
    - [Background Jobs](#background-jobs)
  - [3. Key Commands for Process and Job Control](#3-key-commands-for-process-and-job-control)
    - [The `ps` Command](#the-ps-command)
    - [The `kill` Command](#the-kill-command)
    - [The `jobs` Command](#the-jobs-command)
    - [The `fg` Command](#the-fg-command)
    - [The `bg` Command](#the-bg-command)
  - [Open Files](#open-files)
  - [Foreground/Background Jobs](#foregroundbackground-jobs)
- [Standard Streams and Redirection](#standard-streams-and-redirection)
  - [1. Standard Streams](#1-standard-streams)
    - [Example](#example)
  - [2. Output Redirection (`>` and `>>`)](#2-output-redirection--and-)
    - [Overwriting a File with `>`](#overwriting-a-file-with-)
    - [Appending to a File with `>>`](#appending-to-a-file-with-)
  - [3. Error Redirection](#3-error-redirection)
    - [Redirecting Standard Error with `2>`](#redirecting-standard-error-with-2)
  - [4. Combined Output and Error Redirection](#4-combined-output-and-error-redirection)
    - [Using `2>&1`](#using-21)
    - [Using `&>`](#using-)
  - [5. Pipes (`|`)](#5-pipes-)

## Terms

- Operating System (**OS**).
- **Shell**: graphical vs. command-line.
- Command-Line Interface (**CLI**).
- **Terminal**.
- **Bash**, **ZSH**, etc.
- Why **Bash** and **ZSH**?

## Differences between **GNU Linux** and **BSD** (including **macOS**, and **Unix**) syntax

- **GNU** flavored utilities on macOS (Homebrew): [coreutils](https://formulae.brew.sh/formula/coreutils)

## Windows

- Windows uses Microsoft's **PowerShell**. Microsoft makes it available for Windows, Linux, and macOS.
  - DOS/Windows legacy CLI **COMMAND.COM**.
  - We are not going to talk about **PowerShell** or **COMMAND.COM**.

## Directory Structure

### Linux/macOS/BSD/UNIX vs. Windows

[XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest)
[](https://www.maizure.org/projects/decoded-gnu-coreutils)

<!-- KF: Not sure if you are going to expand this section -->

## Bash/ZSH configuration

### Files

When **Bash**/**ZSH** process starts, it will read user's configuration files in a specific order.

.bashrc, .profile, etc.

### Environmental variables

```console
$ env
```
<!-- KF: I feel like this secion can just be combined with my env section, if you do not plan introduce other subtopics -->

## Process Life-cycle and Job Control

### 1. Process Life-cycle in Bash

#### What Happens When You Run a Command?

1. **Creation:**
   When you enter a command, the shell **forks** a new process. This new process is a copy of the shell with its own execution flow.

2. **Execution:**
   The process executes the command. It may run in the **foreground** (directly interacting with your terminal) or in the **background** (running without blocking your terminal).

3. **Termination:**
   Once a process finishes its task, it terminates. If the parent (your shell) doesn't immediately collect its exit status, the process briefly becomes a "zombie" until it is reaped.

4. **Job States:**
   - **Running:** Actively executing.
   - **Stopped/Suspended:** Paused (often due to a signal like <kbd>⌃ Control</kbd> + <kbd>Z</kbd>).
   - **Background:** Running without occupying your terminal.

### 2. Foreground vs. Background Jobs

#### Foreground Jobs

- **Definition:**
  A job running in the foreground is active and interacts with your terminal. It takes input from your keyboard and prints output directly.

- **Example:**
  Running a command like:

  ```console
  $ ls -l
  ```

  This command runs in the foreground, showing you a directory listing immediately.

#### Background Jobs

- **Definition:**
  Background jobs run without taking over the terminal. You can continue using your terminal while they execute.

- **Starting a Background Job:**
  Append an ampersand (`&`) at the end of a command:

  ```console
  $ sleep 60 &
  ```

  This starts the `sleep` command in the background for 60 seconds.

- **Viewing Background Jobs:**
  Use the `jobs` command:

  ```console
  $ jobs
  ```

  This lists all jobs started in the current shell session, showing their job IDs and statuses (e.g., running, stopped).

- **Foregrounding a Job:**
  To bring a background job to the foreground, use the `fg` command followed by the job number:

  ```console
  $ fg %1
  ```

  This brings job number 1 to the foreground.

- **Backgrounding a Stopped Job:**
  If a job is stopped (for example, after pressing <kbd>⌃ Control</kbd> + <kbd>Z</kbd>), you can resume it in the background with:

  ```console
  $ bg %1
  ```

### 3. Key Commands for Process and Job Control

#### The `ps` Command

- **Purpose:**
  Displays a snapshot of current processes.

- **Example Usage:**

  ```console
  $ ps aux
  ```

  This command shows all processes running on the system with detailed information (user, PID, CPU usage, etc.).

#### The `kill` Command

- **Purpose:**
  Sends signals to processes, typically to terminate them.

- **Basic Usage:**
  - **Terminate a process (SIGTERM):**

    ```console
    $ kill 12345
    ```

    This sends the default SIGTERM signal to the process with PID `12345`.

  - **Force kill a process (SIGKILL):**

    ```console
    $ kill -9 12345
    ```

    This sends SIGKILL, which forcefully terminates the process.

- **Killing Jobs by Job ID:**
  You can also kill jobs using job IDs:

  ```console
  $ kill %1
  ```

  This sends a termination signal to job number 1 in your current shell.

#### The `jobs` Command

- **Purpose:**
  Lists current jobs managed by the shell, including background and stopped jobs.

- **Example:**

  ```console
  $ jobs
  [1]+  Running                 sleep 60 &
  [2]-  Stopped                 vim file.txt
  ```

#### The `fg` Command

- **Purpose:**
  Brings a background or suspended job to the foreground.

- **Example:**

  ```console
  $ fg %1
  ```

  This resumes job number 1 in the foreground so that it interacts with your terminal again.

#### The `bg` Command

- **Purpose:**
  Resumes a stopped (suspended) job in the background.

- **Example:**

  ```console
  $ bg %2
  ```

  This resumes job number 2 in the background.

---

```console
$ ps
    PID TTY          TIME CMD
1412900 pts/0    00:00:02 zsh
1418251 pts/0    00:00:00 top
1418273 pts/0    00:00:00 top
1418663 pts/0    00:00:00 ps
```

```console
$ top
$ htop
```

```console
$ kill 1418273
```

### Open Files

```console
$ lsof
```

### Foreground/Background Jobs

Start any program that may take a while.

```console
$ top
```

<kbd>⌃ Control</kbd> + <kbd>Z</kbd>

```console
[1]  + 1417625 suspended (signal)  top
```

```console
$ top
```

<kbd>⌃ Control</kbd> + <kbd>Z</kbd>

```console
[2]  + 1417753 suspended (signal)  top
```

```console
$ jobs
[1]  - suspended (signal)  top
[2]  + suspended (signal)  top
```

```console
$ fg %1
```

```console
$ bg
[2]  - 1417753 continued  top
[2]  + 1417753 suspended (signal)  top
```
<!-- KF: Looks great! Easy to follow and lots of details. -->

## Standard Streams and Redirection

- **Standard Streams:**
  - **stdin (0):** Input (usually keyboard)
  - **stdout (1):** Standard output (usually terminal)
  - **stderr (2):** Error messages (usually terminal)

- **Redirection Operators:**
  - `>` : Redirect stdout (overwrite file)
  - `>>` : Redirect stdout (append to file)
  - `2>` : Redirect stderr
  - `2>&1` : Redirect stderr to wherever stdout is going
  - `&>` : Redirect both stdout and stderr (Bash-specific)

- **Pipes (`|`):**
  - Connects the stdout of one command to the stdin of another.

### 1. Standard Streams

Every process in Unix/Linux has three default data streams:

- **Standard Input (stdin, file descriptor 0):**
  The default source of input for commands (usually the keyboard).

- **Standard Output (stdout, file descriptor 1):**
  The default destination for output from commands (usually the terminal).

- **Standard Error (stderr, file descriptor 2):**
  The default destination for error messages (usually the terminal).

#### Example

When you run:

```console
$ echo "Hello, World!"
```

- **`"Hello, World!"`** is sent to **stdout**.
- If there were any errors, they would be sent to **stderr**.

### 2. Output Redirection (`>` and `>>`)

#### Overwriting a File with `>`

The `>` operator redirects the stdout of a command to a file, overwriting its contents.

**Example:**

```console
$ echo "Hello, World!" > hello.txt
```

- This command writes `"Hello, World!"` to `hello.txt`.
- If `hello.txt` already exists, it will be overwritten.

#### Appending to a File with `>>`

The `>>` operator appends the stdout of a command to the end of a file.

**Example:**

```console
$ echo "Another line" >> hello.txt
```

- This command adds `"Another line"` to the end of `hello.txt` without deleting the existing content.

### 3. Error Redirection

#### Redirecting Standard Error with `2>`

The `2>` operator redirects the `stderr` of a command to a file.

**Example:**

```console
$ ls non_existing_file 2> error.log
```

- Since `non_existing_file` does not exist, an error message is produced and saved in `error.log`.

### 4. Combined Output and Error Redirection

Sometimes, you may want to redirect both `stdout` and `stderr` to the same file.

#### Using `2>&1`

The `2>&1` syntax redirects `stderr` (file descriptor 2) to where stdout (file descriptor 1) is currently pointing.

**Example:**

```console
$ ls somefile.txt > output.log 2>&1
```

- This command sends both the normal output and error messages to `output.log`.

#### Using `&>`

The `&>` operator is a shorthand to redirect both stdout and stderr to a file. (Note: `&>` is supported in Bash, but may not be available in all shells.)

**Example:**

```console
$ ls somefile.txt &> output.log
```

- This does the same as the previous example: both stdout and stderr go to `output.log`.

---

### 5. Pipes (`|`)

Pipes allow you to send the stdout of one command directly as the stdin of another command.

**Example:**

```console
$ ls -l | grep "\.txt"
```

- `ls -l` lists files in long format.
- The pipe (`|`) sends the output of `ls -l` to `grep "\.txt"`, which filters the list to show only files ending with `.txt`.

<!-- KF: This section looks great, too! -->