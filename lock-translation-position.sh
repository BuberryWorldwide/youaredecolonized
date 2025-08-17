#!/bin/bash

echo "🔒 Locking translation widget position..."

# Update translate.js to force position after Google loads
cat > assets/js/translate.js << 'EOF'
// Translation functionality for youaredecolonized
function googleTranslateElementInit() {
    new google.translate.TranslateElement({
        pageLanguage: 'en',
        includedLanguages: 'es,fr,de,pt,zh,ar,ru,it,ja,ko',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false
    }, 'google_translate_element');
    
    // Force position after Google's widget loads
    setTimeout(lockTranslatePosition, 1000);
    setTimeout(lockTranslatePosition, 2000);
    setTimeout(lockTranslatePosition, 3000);
}

function lockTranslatePosition() {
    const widget = document.getElementById('google_translate_element');
    if (widget) {
        // Force the positioning with !important via JavaScript
        widget.style.setProperty('position', 'fixed', 'important');
        widget.style.setProperty('top', '60px', 'important');
        widget.style.setProperty('right', '15px', 'important');
        widget.style.setProperty('z-index', '999999', 'important');
        widget.style.setProperty('background', '#000', 'important');
        widget.style.setProperty('border', '2px solid #fff', 'important');
        widget.style.setProperty('padding', '8px', 'important');
        widget.style.setProperty('box-shadow', '4px 4px 0px #333', 'important');
        
        // Also lock any child elements that Google might be moving
        const gadget = widget.querySelector('.goog-te-gadget');
        if (gadget) {
            gadget.style.setProperty('margin', '0', 'important');
            gadget.style.setProperty('position', 'static', 'important');
        }
    }
}

// Add punk styling and lock position after widget loads
document.addEventListener('DOMContentLoaded', function() {
    // Keep trying to lock position until it works
    const lockInterval = setInterval(() => {
        const widget = document.getElementById('google_translate_element');
        if (widget && widget.querySelector('.goog-te-gadget')) {
            lockTranslatePosition();
            // Stop trying after widget is stable
            setTimeout(() => clearInterval(lockInterval), 5000);
        }
    }, 500);
});

// Re-lock position on window resize
window.addEventListener('resize', lockTranslatePosition);
EOF

echo "✅ Updated translate.js to lock position"
echo "📤 Commit and push:"
echo "   git add assets/js/translate.js"
echo "   git commit -m 'Lock translation widget position against Google's repositioning'"
echo "   git push"
