#!/bin/bash
# Install ppt-master skill Python dependencies in Claude Code cloud sessions.
set -euo pipefail
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0
REQ="$CLAUDE_PROJECT_DIR/.claude/skills/ppt-master/requirements.txt"
[ -f "$REQ" ] || exit 0
pip install -q --ignore-installed blinker -r "$REQ" >/dev/null 2>&1 || pip install -q -r "$REQ" >/dev/null 2>&1 || true
