#!/bin/bash

echo "🔧 Fixing zines.html translation widget..."

# Check if zines.html has the translate div
if ! grep -q "google_translate_element" zines.html; then
    echo "Adding missing translate div to zines.html..."
    # Add translate div after opening body tag
    sed -i '/<body[^>]*>/a\    <div id="google_translate_element"></div>' zines.html
fi

# Add inline CSS fix to zines.html specifically
cat > /tmp/zines_translate_fix << 'EOF'
<style>
/* Translation widget fix for zines page */
#google_translate_element {
    position: fixed !important;
    top: 60px !important;
    right: 15px !important;
    z-index: 999999 !important;
    background: #000 !important;
    border: 2px solid #fff !important;
    padding: 8px !important;
    box-shadow: 4px 4px 0px #333 !important;
}

.goog-te-combo {
    background: #000 !important;
    color: #fff !important;
    border: 1px solid #fff !important;
    font-family: 'Courier Prime', monospace !important;
    padding: 4px !important;
    margin: 0 !important;
}

.goog-te-gadget {
    font-family: 'Courier Prime', monospace !important;
    color: #fff !important;
}
</style>
EOF

# Add the CSS fix before </head> if not already there
if ! grep -q "Translation widget fix for zines page" zines.html; then
    sed -i '/<\/head>/i\'"$(cat /tmp/zines_translate_fix)" zines.html
fi

echo "✅ Fixed zines.html translation widget"
echo "📤 Commit and push:"
echo "   git add zines.html"
echo "   git commit -m 'Fix translation widget on zines page'"
echo "   git push"
