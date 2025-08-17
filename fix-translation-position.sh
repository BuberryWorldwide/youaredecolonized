#!/bin/bash

echo "🎨 Adding better positioning for translation widget..."

# Add positioning CSS to common.css
cat >> assets/css/common.css << 'EOF'

/* Fix translation widget positioning */
#google_translate_element {
    position: fixed !important;
    top: 10px !important;
    right: 10px !important;
    z-index: 9999 !important;
    background: #000 !important;
    border: 2px solid #fff !important;
    padding: 5px !important;
    border-radius: 0 !important;
}

.goog-te-gadget {
    font-family: 'Courier Prime', monospace !important;
    font-size: 12px !important;
    color: #fff !important;
}

.goog-te-combo {
    background: #000 !important;
    color: #fff !important;
    border: 1px solid #fff !important;
    font-family: 'Courier Prime', monospace !important;
    padding: 3px !important;
}

/* Hide Google branding */
.goog-te-gadget .goog-te-combo {
    margin: 0 !important;
}

.goog-logo-link {
    display: none !important;
}

.goog-te-gadget span {
    display: none !important;
}

.goog-te-gadget > span > a {
    display: none !important;
}

EOF

echo "✅ Translation widget will now appear in top-right corner"
echo "🔄 Refresh your browser to see the change"
