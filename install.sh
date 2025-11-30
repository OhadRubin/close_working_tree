#!/bin/bash
set -e

REPO="OhadRubin/close_working_tree"
VSIX="close-all-diff-editors-menu-0.0.1.vsix"
URL="https://github.com/${REPO}/raw/main/${VSIX}"
TMP="/tmp/${VSIX}"

echo "Downloading ${VSIX}..."
curl -fsSL "$URL" -o "$TMP"

if command -v cursor &> /dev/null; then
    echo "Installing to Cursor..."
    cursor --install-extension "$TMP"
elif command -v code &> /dev/null; then
    echo "Installing to VS Code..."
    code --install-extension "$TMP"
else
    echo "Neither 'cursor' nor 'code' found in PATH"
    echo "VSIX downloaded to: $TMP"
    exit 1
fi

rm "$TMP"
echo "Done! Reload your editor to activate."
