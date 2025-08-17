#!/bin/bash

echo "🔧 Fixing translation widget for Vercel deployment..."

# Replace the translation CSS in common.css
cat > /tmp/new_translate_css << 'EOF'

/* Fix translation widget positioning for Vercel */
#google_translate_element {
    position: fixed !important;
    top: 60px !important;
    right: 15px !important;
    z-index: 999999 !important;
    background: #000 !important;
    border: 2px solid #fff !important;
    padding: 8px !important;
    border-radius: 0 !important;
    box-shadow: 4px 4px 0px #333 !important;
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
    padding: 4px !important;
    margin: 0 !important;
}

/* Hide Google branding completely */
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

/* Mobile adjustments */
@media (max-width: 768px) {
    #google_translate_element {
        top: 80px !important;
        right: 10px !important;
        padding: 6px !important;
    }
    
    .goog-te-combo {
        font-size: 11px !important;
        padding: 3px !important;
    }
}

EOF

# Remove old translation CSS and add new
sed -i '/\/\* .*translation.*/,/^$/d' assets/css/common.css
cat /tmp/new_translate_css >> assets/css/common.css

echo "✅ Updated translation widget CSS"
echo "📤 Commit and push to update Vercel deployment:"
echo "   git add assets/css/common.css"
echo "   git commit -m 'Fix translation widget positioning for Vercel'"
echo "   git push"
