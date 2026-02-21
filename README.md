# Git and GitHub Codelabs

This repository contains codelab sources for Git and GitHub, hosted on GitHub Pages.

## Local Development

To develop and preview your codelabs locally:

### 1. Install Go
Ensure you have [Go](https://golang.org/dl/) installed on your machine.

### 2. Install claat
The Codelabs Action Tool (`claat`) is used to convert Markdown to HTML.
```bash
go install github.com/googlecodelabs/tools/claat@latest
```
*Note: Make sure your `GOPATH/bin` is in your system's `PATH`.*

### 3. Generate the Codelab
Run the following command to export your markdown file to HTML:
```bash
claat export git-github-codelab.md
```
This will create a directory (e.g., `git-github-fundamentals`) containing the static site.

### 4. Preview
You can use `claat` to serve the files locally:
```bash
claat serve
```
Then navigate to `http://localhost:9090` in your browser.

## Adding a New Codelab
1. Create a new `.md` file with the required metadata.
2. Push your changes to the `main` branch.
3. The GitHub Action will automatically build and deploy the new codelab.

## Hosting
The codelab is hosted at the root of your GitHub Pages site.
URL: `https://<YOUR_USERNAME>.github.io/<REPO_NAME>/`
