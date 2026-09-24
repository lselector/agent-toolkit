---
name: repo-init
description: Set up a new or bare project for Claude Code - add a .gitignore and a README.md if missing, create CLAUDE.md with /init, and create the project wiki with /wiki-init. Use when the user asks to initialize, bootstrap, or set up a repo or project.
---

# Initialize a repo

Runs the steps below in order in the current project.
Never overwrites an existing file.

## Steps

1. **Find the root.** Run `git rev-parse --show-toplevel`.
   If the folder is not a git repo, ask the user whether
   to run `git init` here. Stop if they say no. Work in
   the repo root from now on.

2. **`.gitignore`.** If there is none, copy
   `gitignore.template` from this skill's folder
   (`~/.claude/skills/repo-init/` or
   `.claude/skills/repo-init/`) to `.gitignore`. Then add
   lines for build output, virtual envs or dependency
   folders the project uses and the template misses
   (for example `node_modules/`, `.venv/`, `dist/`). If a
   `.gitignore` exists, leave it alone.

3. **`README.md`.** If there is none, look at the files
   and write a short one: a `# <project name>` title, one
   paragraph on what the project is, and how to run it if
   that is clear from the code. For an empty repo, the
   title and a one-line placeholder are enough. Write
   prose per the humanize skill. If a README exists,
   leave it alone.

4. **`CLAUDE.md`.** Invoke the `init` skill with the
   Skill tool. If `CLAUDE.md` already exists, `init`
   improves it; say so in the report.

5. **Wiki.** Invoke the `wiki-init` skill with the Skill
   tool. If `wiki/` already exists, skip this step.

## Report

A few lines: which files were created and which were
already there, where the wiki is, and open wiki
warnings. Do not commit unless asked.
