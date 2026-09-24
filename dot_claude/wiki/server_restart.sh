#!/bin/bash
# Restart the wiki web server (stop, then start).
#
# Usage:
#   ~/.claude/wiki/server_restart.sh [wiki_dir]
#   PORT=4748 ~/.claude/wiki/server_restart.sh

HERE="$(cd "$(dirname "$0")" && pwd)"
"$HERE/server_stop.sh"
"$HERE/server_start.sh" "$@"
