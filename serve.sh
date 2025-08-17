#!/bin/bash
# Simple development server

echo "🔥 Starting youaredecolonized development server..."
echo "Open http://localhost:8000 in your browser"
echo "Press Ctrl+C to stop"

# Try different Python versions
if command -v python3 &> /dev/null; then
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    python -m SimpleHTTPServer 8000
else
    echo "❌ Python not found. Install Python or use another web server."
    echo "Alternative: npx http-server . -p 8000"
fi
