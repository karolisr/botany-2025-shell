# Asking for help with AI
We encounter errors and problems while dealing with the command line **all the time**. Sometimes, it takes a long time to fish out useful information with *Google* or even it can turn out fruitless. In many cases, using an AI tool can solve your shell problem much faster.

## Comparing different AI tools for shell help

| Feature               | ChatGPT                                                   | Gemini (Google)                                           | Claude (Anthropic)                                       |
|-----------------------|------------------------------------------------------------|------------------------------------------------------------|-----------------------------------------------------------|
| **Strengths**         | Accurate and in-depth answers to shell and coding questions; supports complex workflows; explains code clearly | Fast responses; good at answering basic command-line queries; integrates search-based context when needed | Handles multi-step shell and coding tasks well; provides safe and thoughtful code suggestions |
| **Weaknesses**        | Not natively integrated with terminals or editors; may require follow-up to refine commands | Can be vague or overly cautious with technical details; sometimes lacks depth for advanced shell scripting | May be overly verbose; less precise with niche command-line utilities |
| **Context Awareness** | High – understands nuanced shell usage, scripting logic, and command-line environments | Medium – understands common commands and flags but may miss context or intent | High – maintains context well in extended coding or shell discussions |
| **Integration**       | Web app, ChatGPT CLI, API access; some third-party terminal integrations | Web-based; integrated with Google apps (e.g., Search, Docs); not terminal-native | Web app and API access; limited native toolchain integration |
| **Pricing**           | Free / Paid (ChatGPT Plus or OpenAI API)                   | Free / Paid (via Google One for Gemini Advanced)           | Free / Paid (Claude Pro or API-based access)              |


For now, *ChatGPT* is still the most helpful general AI chatbot with the most features. *Claude* is known for it’s
coding prowess. *Gemini* has unmatched context.

> [!TIP]
> This table was generated by ChatGPT!

## Common prompts for GenAI

[prompts.chat](https://prompts.chat/): designed to provide an enhanced UX when working with prompts. With just a few clicks, you can easily edit and copy the prompts on the site to fit your specific needs and preferences. On this website, you will find a variety of prompts that can be used with ChatGPT and other AI chat models.

[Guide to write a GenAI prompts](https://genai.umich.edu/resources/prompt-literacy)

[Copilot Chat Cookbook](https://docs.github.com/en/copilot/copilot-chat-cookbook)

**Some of the prompts that I used:**
 - "Compare chatgpt, copilot, and deepseek for shell debug questions in a markdown table"
 - "How to parallel this bash script in groups of 20? There are 300 things to loop through" (bash script attached)
 - "I ran <*this command*>. Why did I get <*this error message*>"

> [!TIP]
> GenAI often is more helpful when you give more context, e.g. uploading your bash scripts.

## How to navigate AI responses
Although GenAI tools are very helpful, it’s also sometimes wrong, and with great confidence. Be careful when using `sudo` commands and `rm`ing things. Other than those, it is often ok to try the instructions from AI and feed the results back to it when things are still not working.

Chatgpt can be good alongside something like https://explainshell.com/ to enhance your shell learning.

#  `Git`

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