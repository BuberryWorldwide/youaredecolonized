// Translation functionality for youaredecolonized
function googleTranslateElementInit() {
    new google.translate.TranslateElement({
        pageLanguage: 'en',
        includedLanguages: 'es,fr,de,pt,zh,ar,ru,it,ja,ko',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false
    }, 'google_translate_element');
}

// Add punk styling after widget loads
document.addEventListener('DOMContentLoaded', function() {
    // Wait for Google Translate widget to load
    setTimeout(function() {
        const widget = document.getElementById('google_translate_element');
        if (widget) {
            // Add punk styling
            widget.style.transform = 'rotate(' + (Math.random() > 0.5 ? '1' : '-1') + 'deg)';
        }
    }, 1000);
});
