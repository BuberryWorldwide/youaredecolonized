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
