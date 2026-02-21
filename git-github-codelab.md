summary: A high-energy guide to Git collaboration for hackathon teams.
id: git-github-fundamentals
categories: git, github
environments: Web
status: Published
feedback link: https://github.com/Tamrakar182/git-codelab
authors: Manjul Tamrakar

# Git and GitHub Fundamentals: Hackathon Survival Guide

## Introduction
Duration: 0:02:00

In a hackathon, speed is everything, but uncoordinated speed leads to broken demos. This codelab skips the academic theory and focuses on the "Multiplayer Mode" of coding—getting your team collaborating in a shared repository without blowing up the codebase.

### What you'll learn
* How to initialize and track your code "The Pragmatic Way."
* Working in Parallel Universes (Branching) to avoid breaking the main app.
* How to win the "Boss Fight" (Merge Conflicts).
* Multitasking with GitHub Pull Requests.

### Prerequisites
* A GitHub account.
* Git installed on your local machine.


## The "Save Button" on Steroids
Duration: 0:10:00

The problem: Emailing `.zip` files of your code at 2 AM is a nightmare. Git solves this by treating your project like a vault.

### The Three Stages
1.  **Working Directory:** Your laptop (The messy desk).
2.  **Staging Area:** The loading dock (Preparing the shipment).
3.  **Repository:** The Vault (The permanent record).

### The Core Loop (Live Demo)
Open your terminal and run these commands to start tracking your project:

```bash
mkdir my-hackathon-project
cd my-hackathon-project
# Start the engine
git init 

# Check status constantly!
git status 

# The pragmatic hackathon hack: stage everything
git add . 

# Seal the vault with a descriptive note
git commit -m "feat: added login button"

```

### The "Undo" Button

Did you make a mistake before committing? Wipe it away:

```bash
git restore <file>

```

---

### Frequently Asked Questions

* [When should I commit?](https://www.google.com/search?q=https://stackoverflow.com/questions/2343834/how-often-should-i-commit-changes-to-git)

## Parallel Universes: Branching

Duration: 0:15:00

**The Golden Rule:** Never, ever code directly on `main` during a hackathon. If `main` is broken, your demo is broken.

### Creating a Branch

1 Feature = 1 Branch. When you start the login page, move to a new universe:

```bash
# Create and switch to a new branch
git checkout -b feature/login

```

### The Boss Fight: Merge Conflicts

Conflicts are normal, not an error! They happen when two people edit the same line. Git will show markers like this:

```text
<<<<<<< HEAD
<button>Blue Login</button>
=======
<button>Red Login</button>
>>>>>>> feature/login

```

**How to fix it:**

1. Decide which version to keep.
2. Delete the `<<<<`, `====`, and `>>>>` markers.
3. `git add .` and `git commit` to finish the merge.

## GitHub: Multiplayer Mode

Duration: 0:13:00

Git is local (your laptop); GitHub is the cloud.

### Connecting the Dots

1. Create a repository on GitHub.
2. Link your local code to the cloud:

```bash
git remote add origin [https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git)
git branch -M main
git push -u origin main

```

### Stay in Sync

Always pull the latest code from your team before you start working:

```bash
git pull origin main

```

### Pull Requests (PRs)

Instead of pushing directly, open a PR on GitHub. This allows a teammate to quickly review your code and hit "Merge" to bring it into the main timeline.

## Conclusion

Duration: 0:05:00

Congratulations! You've mastered the Git flow necessary to survive a 48-hour hackathon.

### Emergency Exit Commands

If things get messy, use these:

| Command | Purpose |
| --- | --- |
| `git stash` | Temporarily hide messy work to pull new changes |
| `git log --oneline` | See a quick history of what happened |
| `git checkout main` | Get back to the safety of the main branch |

### What we've covered

* Initializing and committing code.
* Branching for team safety.
* Resolving Merge Conflicts.
* Syncing with GitHub.

Negative
: **Warning:** Avoid using `git push --force` during a hackathon unless you want to delete your teammate's hard work!

Positive
: **Tip:** Run `git status` every time you are about to run a command. It is your best friend.
