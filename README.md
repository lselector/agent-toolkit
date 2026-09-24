# agent-toolkit

Rules, skills and scripts for Claude Code. Everything
lives in `dot_claude/`, which mirrors a `~/.claude/`
folder. Copy it to `~/.claude/` to use it on all
projects, or into `<repo>/.claude/` for one project.
Install steps and caveats are in
[dot_claude/README.md](dot_claude/README.md).

```text
dot_claude/
├── CLAUDE.md   # imports every rule below
├── rules/      # instructions loaded every session
├── skills/     # slash commands
└── wiki/       # project wiki tools and web server
```

## Rules

| File | What it asks for |
|---|---|
| `simplicity.md` | The simplest design that fully works. Fewer moving parts, no YAGNI. |
| `modularity.md` | Self-contained modules, ports and adapters, one-way dependencies. |
| `no_frankenstein.md` | Fit changes into the existing design, reuse code, delete leftovers. |
| `python_formatting_rules.md` | File docstrings, separator lines, 65-char lines, 35-line functions, 800-line files. |
| `web_development.md` | Vanilla JavaScript only, all styles in one `styles.css`. |
| `skill_naming_hyphens.md` | Skill names use hyphens, not underscores. |
| `update_docs.md` | Keep `README.md` current with every change. |
| `update_wiki.md` | Read, create and update the project wiki in `wiki/`. |
| `writing_prose.md` | Write prose by the `humanize` skill from the first draft. |
| `keep_terse.md` | Short chat replies; minimal code. |
| `communication_style.md` | Encouraging, supportive tone. |

## Skills

| Command | What it does |
|---|---|
| `/repo-init` | Sets up a project: `.gitignore`, `README.md`, `CLAUDE.md` (via `/init`) and the wiki. |
| `/lean-change` | Adds a feature without bloat, then tidies the diff. |
| `/architecture-review` | Reviews the whole codebase and writes ranked refactoring advice to `docs/`. |
| `/design-doc` | Writes and refines an architecture design document, with PDF output. |
| `/humanize` | Writes or rewrites English and Russian prose so it does not read as AI-made. |
| `/wiki-init` | Creates a project wiki and seeds its first pages. |
| `/wiki-update` | Files new knowledge into the wiki, fixes links, rebuilds the index. |
| `/wiki-serve` | Starts the wiki web UI on http://localhost:4747. |
| `/wiki-stop` | Stops the wiki web UI. |

## Scripts

The `dot_claude/wiki/` folder holds the tools the wiki
rule and skills call. They must sit in `~/.claude/wiki/`.
Details are in [dot_claude/wiki/README.md](dot_claude/wiki/README.md).

- `wiki_tools.py`: command line for `init`, `find`,
  `grep`, `read`, `backlinks`, `index`, `log`, `check`.
- `wiki_pages.py`, `wiki_edit.py`: read and write sides
  of the page model. Standard library only.
- `wiki_server.py`, `styles.css`: read-only
  Wikipedia-style web UI. Needs `pip install flask markdown`.
- `server_start.sh`, `server_stop.sh`,
  `server_restart.sh`: run the web UI in the background.
- `test_wiki.py`: unit tests.
- `conventions.md`: the wiki page format.

## Quick install

```bash
mkdir -p ~/.claude
cp -R dot_claude/rules dot_claude/skills dot_claude/wiki ~/.claude/
cp dot_claude/CLAUDE.md ~/.claude/
```
