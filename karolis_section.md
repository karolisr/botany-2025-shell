# Table of Contents <!-- omit in toc -->

- [Terms](#terms)
- [Differences between **GNU Linux** and **BSD** (including **macOS**, and **Unix**) syntax](#differences-between-gnu-linux-and-bsd-including-macos-and-unix-syntax)
- [Windows](#windows)
- [Directory Structure](#directory-structure)
  - [Linux/macOS/BSD/UNIX vs. Windows](#linuxmacosbsdunix-vs-windows)
- [Process life-cycle](#process-life-cycle)
  - [Open Files](#open-files)
  - [Foreground/Background Jobs](#foregroundbackground-jobs)
- [Bash/ZSH configuration](#bashzsh-configuration)
  - [Files](#files)
  - [Environmental variables](#environmental-variables)

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

## Process life-cycle

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

## Bash/ZSH configuration

### Files

When **Bash**/**ZSH** process starts, it will read user's configuration files in a specific order.

.bashrc, .profile, etc.

### Environmental variables

```console
$ env
```
