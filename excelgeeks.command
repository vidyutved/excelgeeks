#!/bin/bash

# =============================================
#   StudyHub — macOS Double-Click Launcher
#   Save this as Start_StudyHub.command
#   Then: chmod +x Start_StudyHub.command
# =============================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT=8765

clear
echo ""
echo "  ============================================="
echo "     📚 StudyHub — macOS Launcher"
echo "  ============================================="
echo ""

# ----------- Check Python -----------
PYTHON=""
for cmd in python3 python3.12 python3.11 python3.10 python; do
    if command -v $cmd &>/dev/null; then
        VER=$($cmd --version 2>&1 | grep -oE '[0-9]+\.[0-9]+' | head -1 | cut -d. -f1)
        if [ "$VER" -ge 3 ] 2>/dev/null; then
            PYTHON=$cmd
            break
        fi
    fi
done

if [ -z "$PYTHON" ]; then
    echo "  ❌ Python 3 not found."
    echo ""
    echo "  Install it via Homebrew:  brew install python3"
    echo "  Or download from:         https://www.python.org"
    echo ""
    # macOS dialog
    osascript -e 'display dialog "Python 3 is required to run StudyHub.\n\nInstall it from https://www.python.org or via Homebrew:\n  brew install python3" buttons {"OK"} default button "OK" with icon caution with title "StudyHub"'
    exit 1
fi

echo "  ✅ Using $($PYTHON --version 2>&1)"
echo ""

# ----------- Kill previous instance if running -----------
EXISTING=$(lsof -ti tcp:$PORT 2>/dev/null)
if [ -n "$EXISTING" ]; then
    echo "  ♻️  Stopping previous instance on port $PORT..."
    kill $EXISTING 2>/dev/null
    sleep 0.8
fi

# ----------- Open browser -----------
(sleep 1.5 && open "http://localhost:$PORT") &

echo "  🚀 Launching StudyHub at http://localhost:$PORT"
echo "  🔒 Close this window or press Ctrl+C to stop."
echo ""

cd "$SCRIPT_DIR"
$PYTHON server.py

echo ""
echo "  👋 StudyHub stopped."
read -p "  Press Enter to close..."
