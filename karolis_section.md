# Outline

- Terms:
  - Operating System (**OS**).
  - **Shell**: graphical vs. command-line.
  - Command-Line Interface (**CLI**).
  - **Terminal**.
  - **Bash**, **ZSH**, etc.
  - Why **Bash** and **ZSH**?
- Differences between **GNU Linux** and **BSD** (including **macOS**, and **Unix**) syntax.
- **GNU** flavored utilities on macOS (Homebrew): [coreutils](https://formulae.brew.sh/formula/coreutils)
- Windows uses Microsoft's **PowerShell**. Microsoft makes it available for Windows, Linux, and macOS.
  - DOS/Windows legacy CLI **COMMAND.COM**.
  - We are not going to talk about **PowerShell** or **COMMAND.COM**.
- Directory structure.
- Process life-cycle.
- Bash/ZSH configuration.
  - Files: .bashrc, .profile, etc.
  - Environmental variables

## Directory Structure

### Linux/macOS/BSD/UNIX vs. Windows

[XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest)

## Bash Configuration

### Files

When **Bash**/**ZSH** process starts, it will read user's configuration files in a specific order.

### Environmental variables

```bash
env
```
