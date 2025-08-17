#!/bin/bash

echo "💪 Implementing aggressive translation widget fix..."

# Step 1: Update all HTML files to use a wrapper container
echo "📝 Updating HTML files to use wrapper container..."

# Function to update HTML files
update_html_file() {
    local file="$1"
    echo "Updating: $file"
    
    # Remove existing translate div
    sed -i '/<div id="google_translate_element"><\/div>/d' "$file"
    
    # Add wrapper container after body opening tag
    sed -i '/<body[^>]*>/a\    <div id="translate_wrapper">\n        <div id="google_translate_element"></div>\n    </div>' "$file"
}

# Update all HTML files
for file in *.html; do
    if [ -f "$file" ]; then
        update_html_file "$file"
    fi
done

# Update zine HTML files
find zines -name "*.html" -type f | while read file; do
    update_html_file "$file"
done

# Step 2: Create bulletproof CSS
cat >> assets/css/common.css << 'EOF'

/* BULLETPROOF TRANSLATION WIDGET */
#translate_wrapper {
    position: fixed !important;
    top: 60px !important;
    right: 15px !important;
    z-index: 2147483647 !important; /* Maximum z-index */
    pointer-events: auto !important;
    width: auto !important;
    height: auto !important;
    overflow: visible !important;
    transform: none !important;
}

#google_translate_element {
    position: static !important;
    top: auto !important;
    right: auto !important;
    left: auto !important;
    bottom: auto !important;
    margin: 0 !important;
    padding: 8px !important;
    background: #000 !important;
    border: 2px solid #fff !important;
    box-shadow: 4px 4px 0px #333 !important;
    transform: none !important;
    width: auto !important;
    height: auto !important;
}

#google_translate_element * {
    transform: none !important;
}

.goog-te-gadget {
    font-family: 'Courier Prime', monospace !important;
    font-size: 12px !important;
    color: #fff !important;
    margin: 0 !important;
    padding: 0 !important;
    background: transparent !important;
}

.goog-te-combo {
    background: #000 !important;
    color: #fff !important;
    border: 1px solid #fff !important;
    font-family: 'Courier Prime', monospace !important;
    padding: 4px !important;
    margin: 0 !important;
}

/* Hide Google branding */
.goog-te-gadget .goog-logo-link,
.goog-te-gadget span[style],
.goog-te-gadget > span > a {
    display: none !important;
}

/* Mobile adjustments */
@media (max-width: 768px) {
    #translate_wrapper {
        top: 80px !important;
        right: 10px !important;
    }
    
    #google_translate_element {
        padding: 6px !important;
    }
    
    .goog-te-combo {
        font-size: 11px !important;
        padding: 3px !important;
    }
}

EOF

# Step 3: Update JavaScript to be more aggressive
cat > assets/js/translate.js << 'EOF'
// BULLETPROOF Translation functionality for youaredecolonized
function googleTranslateElementInit() {
    new google.translate.TranslateElement({
        pageLanguage: 'en',
        includedLanguages: 'es,fr,de,pt,zh,ar,ru,it,ja,ko',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false
    }, 'google_translate_element');
    
    // Aggressive position locking
    setTimeout(lockTranslatePosition, 100);
    setTimeout(lockTranslatePosition, 500);
    setTimeout(lockTranslatePosition, 1000);
    setTimeout(lockTranslatePosition, 2000);
    setTimeout(lockTranslatePosition, 3000);
}

function lockTranslatePosition() {
    const wrapper = document.getElementById('translate_wrapper');
    const widget = document.getElementById('google_translate_element');
    
    if (wrapper && widget) {
        // Lock wrapper position
        wrapper.style.setProperty('position', 'fixed', 'important');
        wrapper.style.setProperty('top', '60px', 'important');
        wrapper.style.setProperty('right', '15px', 'important');
        wrapper.style.setProperty('z-index', '2147483647', 'important');
        wrapper.style.setProperty('transform', 'none', 'important');
        
        // Keep widget inside wrapper
        widget.style.setProperty('position', 'static', 'important');
        widget.style.setProperty('transform', 'none', 'important');
        widget.style.setProperty('top', 'auto', 'important');
        widget.style.setProperty('right', 'auto', 'important');
        widget.style.setProperty('left', 'auto', 'important');
        widget.style.setProperty('bottom', 'auto', 'important');
        
        // Lock all child elements
        const allElements = widget.querySelectorAll('*');
        allElements.forEach(el => {
            el.style.setProperty('transform', 'none', 'important');
        });
    }
}

// Continuous monitoring
document.addEventListener('DOMContentLoaded', function() {
    const observer = new MutationObserver(lockTranslatePosition);
    const wrapper = document.getElementById('translate_wrapper');
    
    if (wrapper) {
        observer.observe(wrapper, {
            attributes: true,
            childList: true,
            subtree: true,
            attributeFilter: ['style', 'class']
        });
    }
    
    // Also monitor with interval
    setInterval(lockTranslatePosition, 1000);
});

// Re-lock on resize
window.addEventListener('resize', lockTranslatePosition);
EOF

echo "✅ Applied bulletproof translation widget fix"
echo "📤 Commit and push:"
echo "   git add ."
echo "   git commit -m 'Bulletproof translation widget positioning'"
echo "   git push"
