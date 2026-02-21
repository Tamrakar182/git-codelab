summary: A practical, hands-on guide to Git and GitHub for hackathon teams
id: git-github-hackathon-codelab
categories: git, github, version-control
environments: Web
status: Published
feedback link: https://github.com/Tamrakar182/git-codelab/issues
authors: Manjul Tamrakar

# Git & GitHub: The Hackathon Survival Kit

## Welcome & Why This Matters
Duration: 0:03:00

You have 48 hours. Your teammate just overwrote your login page with their payment form. The demo is in 20 minutes. Sound familiar?

This codelab is not about Git theory, it's about **not destroying your project at 3 AM**. By the end of this session, your team will be able to work in parallel, avoid stepping on each other's toes, and ship a working demo with confidence.

### What you'll learn

* How Git tracks your code like a time machine.
* How to use branches so your team never breaks the main app.
* How to handle merge conflicts without panic.
* How to use GitHub to sync code across your whole team.
* A professional Pull Request workflow that scales.

### Prerequisites

* A [GitHub](https://github.com) account (free).
* Git installed on your machine — check with `git --version` in your terminal.
* A terminal / command prompt you're comfortable typing in.

> **Not installed?** Download Git from [https://git-scm.com/downloads](https://git-scm.com/downloads). It takes 2 minutes.

---

## How Git Thinks About Your Code
Duration: 0:08:00

Before we touch the terminal, let's build the right mental model. Git is not a backup tool, it's a **time machine with collaboration superpowers**.

### The Three Zones

Every file you work on lives in one of three places at any given moment:

**1. Working Directory**: Your actual files on disk. This is your messy desk. You can edit freely here.

**2. Staging Area (Index)**: A holding area where you decide *which changes* to include in your next snapshot. Think of it as packing a box before shipping.

**3. Repository (.git folder)**: The permanent, tamper-proof vault of all your snapshots (called *commits*). Once something is committed, it's safe.

![Git Workflow](/assets/git-workflow-diagram.jpg)

### The Commit: Your Project's Checkpoint

A **commit** is a snapshot of your project at a specific moment. It records:
- What changed (which lines were added or removed).
- When it happened.
- Who made the change.
- A message describing *why* you made it.

Good commit messages tell a story. Compare:

| ❌ Bad | ✅ Good |
|--------|---------|
| `fix` | `fix: correct login redirect after auth` |
| `stuff` | `feat: add dark mode toggle to settings` |
| `aaa` | `chore: remove unused imports in utils.py` |

Use the prefix convention: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`.

---

## Your First Repository
Duration: 0:10:00

Let's get hands-on. Open your terminal and follow along.

### Step 1: Initialize a Local Repo

```bash
# Create a new project folder
mkdir hackathon-demo
cd hackathon-demo

# Tell Git to start tracking this folder
git init

# You should see:
# Initialized empty Git repository in .../hackathon-demo/.git/
```

### Step 2: Create a File and Make Your First Commit

```bash
# Create a simple file
echo "# My Hackathon Project" > README.md

# Check what Git sees
git status

# Stage the file
git add README.md

# Commit with a meaningful message
git commit -m "docs: initial commit with README"
```

### Step 3: The Status Check Habit

Run `git status` constantly. Make it a reflex. It tells you:
- Which files have been modified.
- Which files are staged and ready to commit.
- Which files Git doesn't know about yet (untracked).

```bash
git status
```

### Configuring Your Identity (One-time Setup)

If this is your first time using Git on this machine, set your name and email:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

This information gets stamped on every commit you make, so your teammates know who did what.

### The Core Workflow Loop

Every feature, every bug fix, every change follows this loop:

```bash
# 1. Make your code changes
# 2. Stage what you want to save
git add .                        # Stage everything
git add src/login.py             # Or stage specific files

# 3. Commit with a clear message
git commit -m "feat: add user login validation"

# 4. Repeat
```

> **Hackathon Tip:** Commit early and often. Small commits are easy to undo. A single giant commit at the end is a disaster waiting to happen.

---

## Branching: Your Team's Superpower
Duration: 0:15:00

This is the most important section of this codelab. **Branching is what makes team collaboration possible.**

### The Golden Rule

> **Never commit directly to `main` during a hackathon.**

`main` is your demo branch. It should always be in a working, presentable state. All active development happens on separate branches.

### How Branches Work

A branch is just a lightweight pointer to a specific commit. Creating one is instant and costs almost nothing.

```
main:           A --- B --- C
                             \
feature/login:               D --- E
```

Your teammate works on `feature/login` while you work on `feature/dashboard`. Neither of you affects `main` until you're ready to merge.

### Creating and Switching Branches

```bash
# See all branches (the * marks your current branch)
git branch

# Create a new branch and switch to it immediately
git checkout -b feature/login-page

# Alternative (modern Git syntax)
git switch -c feature/login-page
```

### Name Your Branches Well

Use a consistent naming pattern so your team knows what's going on:

| Branch name | Purpose |
|---|---|
| `feature/user-auth` | New feature |
| `fix/broken-nav-link` | Bug fix |
| `chore/cleanup-css` | Cleanup / refactoring |

### The Branch Workflow in Practice

```bash
# 1. Start from an up-to-date main
git checkout main
git pull origin main

# 2. Create your feature branch
git checkout -b feature/payment-form

# 3. Do your work and commit
git add .
git commit -m "feat: add Stripe payment form UI"

# 4. When done, push your branch to GitHub
git push origin feature/payment-form

# 5. Open a Pull Request on GitHub (see next section)
```

### Switching Between Branches

```bash
# Save your work first (always commit or stash before switching)
git checkout main          # Switch back to main
git checkout feature/login # Switch to another branch
```

> **Warning:** If you have uncommitted changes when switching branches, Git will either carry them over or block you. Always commit or stash before switching.

---

## Merge Conflicts: The Boss Fight
Duration: 0:12:00

Merge conflicts are not a sign that something went wrong — they're a natural part of collaboration. Git is simply telling you: *"Two people edited the same lines. I need a human to decide which version to keep."*

### When Do Conflicts Happen?

You and your teammate both edited `index.html`, line 42. One of you changed the button to blue, the other changed it to red. Git can't pick a winner automatically.

### What a Conflict Looks Like

When you try to merge and there's a conflict, Git marks the file like this:

```text
<<<<<<< HEAD
<button class="btn-blue">Login</button>
=======
<button class="btn-red">Login</button>
>>>>>>> feature/login
```

- Everything between `<<<<<<< HEAD` and `=======` is **your version**.
- Everything between `=======` and `>>>>>>>` is the **incoming version**.

### How to Resolve It

**Step 1:** Open the conflicted file in your editor.

**Step 2:** Decide what the final version should look like. For example:

```html
<button class="btn-primary">Login</button>
```

**Step 3:** Delete all the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`).

**Step 4:** Stage and commit the resolved file:

```bash
git add index.html
git commit -m "fix: resolve merge conflict on login button style"
```

### Prevention is Better Than Cure

- **Pull often.** Run `git pull origin main` before you start working each time.
- **Keep branches short-lived.** Merge feature branches back within a few hours if possible.
- **Communicate.** Tell your teammate before you edit a shared file.

> **Hackathon Tip:** Assign clear ownership of files. "You own the backend routes, I own the frontend components." This dramatically reduces conflicts.

---

## GitHub: Taking It to the Cloud
Duration: 0:12:00

Git is local (lives on your machine). **GitHub** is the shared cloud where your whole team syncs.

### Creating Your Team's Repository

One person on your team should:

1. Go to [github.com](https://github.com) and click **"New repository"**.
2. Name it (e.g., `hackathon-2025`).
3. Set it to **Private** (unless you want it public).
4. **Do not** initialize with a README (you already have one locally).
5. Click **Create repository**.

### Connecting Local to Remote

After creating the repo on GitHub, connect your local project:

```bash
# Add GitHub as the "origin" remote
git remote add origin https://github.com/YOUR_USERNAME/hackathon-2025.git

# Rename your branch to main (if it's called master)
git branch -M main

# Push your code and set the upstream tracker
git push -u origin main
```

From now on, a simple `git push` will send your changes to GitHub.

### Inviting Your Team

1. Go to your repository on GitHub.
2. Click **Settings → Collaborators**.
3. Click **Add people** and enter your teammates' GitHub usernames.
4. They'll receive an email invitation to join.

### The Daily Sync Ritual

At the start of every work session, pull the latest changes:

```bash
git pull origin main
```

This brings any changes your teammates pushed while you were sleeping (or eating) down to your machine.

### Cloning the Repo (for teammates)

Teammates who didn't create the repo should clone it:

```bash
git clone https://github.com/YOUR_USERNAME/hackathon-2025.git
cd hackathon-2025
```

This downloads the entire repository including all history.

---

## Pull Requests: Code Review at Hackathon Speed
Duration: 0:10:00

A **Pull Request (PR)** is how you propose merging your feature branch into `main`. Even at a hackathon, PRs are worth it — they give your teammate 60 seconds to catch a bug before it hits the demo.

### Opening a Pull Request

After pushing your branch:

```bash
git push origin feature/payment-form
```

1. Go to your repo on GitHub.
2. You'll see a banner: **"feature/payment-form had recent pushes."** Click **Compare & pull request**.
3. Write a short description of what you built.
4. Assign a teammate as reviewer.
5. Click **Create pull request**.

### Reviewing a PR

Your teammate opens the PR, looks at the **Files changed** tab, and either:
- **Approves** it and clicks **Merge pull request**, or
- **Requests changes** by leaving a comment.

At a hackathon, aim for reviews under 5 minutes. The goal is a quick sanity check, not a dissertation.

### After Merging

Once the PR is merged into `main`, delete the feature branch (GitHub offers a button for this), and update your local main:

```bash
git checkout main
git pull origin main
```

### Quick PR Checklist

Before opening a PR, ask yourself:
- Does the code run without errors?
- Did I remove any debug `console.log()` or `print()` statements?
- Is the PR focused on one feature or fix?
- Is the PR title clear?

---

## Emergency Commands
Duration: 0:05:00

When things go sideways at 4 AM, stay calm and use these:

### Stashing: Temporarily Hide Your Work

Need to pull new changes but your work isn't ready to commit yet?

```bash
# Hide your current changes
git stash

# Pull the latest from main
git pull origin main

# Get your hidden changes back
git stash pop
```

### Viewing History

```bash
# See a compact log of recent commits
git log --oneline

# See what changed in the last commit
git show HEAD
```

### Undoing Things

```bash
# Undo changes to a file (before staging)
git restore index.html

# Unstage a file (keep the changes, just remove from staging)
git restore --staged index.html

# Undo your last commit but keep the changes
git reset --soft HEAD~1
```

### Quick Reference Table

| Command | What it does |
|---|---|
| `git status` | See what's changed (use constantly) |
| `git log --oneline` | See recent commit history |
| `git stash` | Hide uncommitted changes temporarily |
| `git stash pop` | Restore hidden changes |
| `git checkout main` | Return to the main branch |
| `git pull origin main` | Get latest changes from GitHub |
| `git restore <file>` | Discard changes to a file |
| `git branch` | List all branches |

> **Warning:** Avoid `git push --force` unless you fully understand what it does. It can erase your teammates' work permanently.

---

## Team Workflow Playbook
Duration: 0:05:00

Here's the complete workflow your team should follow from the moment the hackathon starts:

### Setup (Do Once, Together)

```bash
# Person A: creates the repo on GitHub and pushes initial code
git init
git add .
git commit -m "chore: project setup"
git remote add origin https://github.com/team/repo.git
git push -u origin main

# Persons B, C, D: clone the repo
git clone https://github.com/team/repo.git
```

### Every Feature (Repeat Throughout the Hackathon)

```bash
# 1. Start fresh from main
git checkout main
git pull origin main

# 2. Create your feature branch
git checkout -b feature/your-feature-name

# 3. Build and commit as you go
git add .
git commit -m "feat: describe what you built"

# 4. Push and open a PR
git push origin feature/your-feature-name
# → Open PR on GitHub → teammate reviews → merge

# 5. Clean up and sync
git checkout main
git pull origin main
```

### Divide and Conquer

At the start of the hackathon, split your codebase by ownership:

| Person | Owns |
|---|---|
| Frontend Dev | `src/components/`, `src/pages/` |
| Backend Dev | `api/`, `models/`, `routes/` |
| Full Stack | `config/`, shared utilities |

This reduces the chance of merge conflicts dramatically.

---

## Conclusion
Duration: 0:02:00

You now have everything you need to collaborate like a professional engineering team, even at 48-hour hackathon speed.

### What we've covered

* Git's three zones: Working Directory, Staging Area, and Repository.
* Making meaningful commits with clear messages.
* Branching to keep `main` safe and stable at all times.
* Resolving merge conflicts with confidence.
* Connecting your local repo to GitHub and syncing as a team.
* Using Pull Requests for fast, lightweight code review.
* Emergency commands to recover from any situation.

### The Three Rules to Remember

1. **Commit often.** Small checkpoints save you from big disasters.
2. **Branch always.** Every feature, every fix must be its own branch.
3. **Pull before you push.** Always sync before you start working.

Now go build something great. Good luck!