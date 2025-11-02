#!/bin/bash

# Script to render the Charybdis keymap
# This parses the ZMK keymap and generates an SVG visualization

set -e  # Exit on error

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🎨 Rendering Charybdis keymap..."

# Parse the ZMK keymap file
echo "📝 Parsing keymap from config/charybdis.keymap..."
keymap -c "$SCRIPT_DIR/config.yaml" parse -z "$PROJECT_ROOT/config/charybdis.keymap" \
    -b "$SCRIPT_DIR/charybdis.yaml" > "$SCRIPT_DIR/charybdis_parsed.yaml"

# Draw the SVG using the physical layout JSON
echo "🖼️  Drawing SVG with physical layout..."
keymap -c "$SCRIPT_DIR/config.yaml" draw "$SCRIPT_DIR/charybdis_parsed.yaml" \
    -j "$PROJECT_ROOT/config/charybdis.json" > "$SCRIPT_DIR/charybdis.svg"

echo "✅ Done! Output saved to keymap-drawer/charybdis.svg"

