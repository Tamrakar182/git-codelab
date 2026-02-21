author: Manjul Tamrakar
summary: A comprehensive guide to Git and GitHub
id: git-github-fundamentals
categories: git,github
environments: Web

# Git and GitHub Fundamentals

## Introduction
Duration: 0:02:00

In this codelab, you will learn the basics of Git and GitHub. We will cover:
* Initializing a repository
* Staging and committing changes
* Pushing to GitHub
* Branching and Merging

### Prerequisites
* A GitHub account
* Git installed on your local machine

## Initializing a Repository
Duration: 0:05:00

First, let's create a new directory and initialize it as a Git repository.

```bash
mkdir my-git-project
cd my-git-project
git init
```

Now, create a file and add some content.

```bash
echo "# My Git Project" > README.md
```

## Staging and Committing
Duration: 0:05:00

To track changes, you need to stage them and then commit.

```bash
git add README.md
git commit -m "Initial commit"
```

## Pushing to GitHub
Duration: 0:10:00

1. Create a new repository on GitHub.
2. Link your local repository to the remote one.

```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

## Conclusion
Duration: 0:01:00

Congratulations! You've successfully set up a Git repository and pushed it to GitHub.
