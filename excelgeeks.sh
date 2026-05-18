#!/bin/bash

# =============================================
#   StudyHub Launcher — Mac & Linux
# =============================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT=8765

echo ""
echo "  ============================================="
echo "     📚 StudyHub — Your Study Companion"
echo "  ============================================="
echo ""

# ----------- Check Python -----------
PYTHON=""
if command -v python3 &>/dev/null; then
    PYTHON="python3"
elif command -v python &>/dev/null; then
    PY_VER=$(python --version 2>&1 | grep -o '[0-9]\+' | head -1)
    if [ "$PY_VER" -ge 3 ]; then
        PYTHON="python"
    fi
fi

if [ -z "$PYTHON" ]; then
    echo "  ❌ Python 3 is not installed on this system."
    echo ""
    echo "  Please install it:"
    echo "  • Mac:   brew install python3   OR  https://www.python.org"
    echo "  • Linux: sudo apt install python3   (Ubuntu/Debian)"
    echo "           sudo dnf install python3   (Fedora)"
    echo ""
    read -p "  Press Enter to exit..."
    exit 1
fi

echo "  ✅ Python found: $($PYTHON --version 2>&1)"
echo ""

# ----------- Kill any existing instance on our port -----------
EXISTING=$(lsof -ti tcp:$PORT 2>/dev/null)
if [ -n "$EXISTING" ]; then
    echo "  ♻️  Restarting existing StudyHub instance..."
    kill $EXISTING 2>/dev/null
    sleep 0.8
fi

# ----------- Open browser after short delay -----------
open_browser() {
    sleep 1.5
    URL="http://localhost:$PORT"
    if command -v xdg-open &>/dev/null; then
        xdg-open "$URL"          # Linux
    elif command -v open &>/dev/null; then
        open "$URL"              # macOS
    elif command -v gnome-open &>/dev/null; then
        gnome-open "$URL"        # older GNOME
    else
        echo "  🌐 Please open your browser and go to: $URL"
    fi
}

open_browser &

# ----------- Start server -----------
echo "  🚀 Starting StudyHub at http://localhost:$PORT"
echo "  🔒 Ctrl+C to stop the server and lock the app."
echo ""

cd "$SCRIPT_DIR"
$PYTHON server.py

echo ""
echo "  StudyHub stopped. See you next time! 👋"
echo ""
