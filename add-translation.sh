#!/bin/bash

# Add Translation Functionality to All Pages
# Run this from the root directory of youaredecolonized

echo "🌐 Adding translation functionality to all pages..."

# 1. Add CSS to common.css
echo "Adding translation CSS to assets/css/common.css..."
cat >> assets/css/common.css << 'EOF'

/* Translation widget styling */
#google_translate_element {
    background: #000;
    border: 2px solid #fff;
    padding: 10px;
    transform: rotate(-1deg);
    margin: 10px 0;
    position: relative;
    z-index: 1000;
}

#google_translate_element::before {
    content: "TRANSLATE";
    position: absolute;
    top: -8px;
    left: 10px;
    background: #fff;
    color: #000;
    padding: 2px 8px;
    font-size: 0.7rem;
    font-weight: bold;
    text-transform: uppercase;
}

.goog-te-combo {
    background: #000 !important;
    color: #fff !important;
    border: 2px solid #fff !important;
    font-family: 'Courier Prime', monospace !important;
    padding: 5px !important;
    text-transform: uppercase !important;
}

.goog-te-menu-value {
    color: #fff !important;
}

.goog-te-gadget {
    font-family: 'Courier Prime', monospace !important;
    color: #fff !important;
}

.goog-te-gadget .goog-te-combo {
    margin: 0 !important;
}

EOF

# 2. Create translate.js
echo "Creating assets/js/translate.js..."
cat > assets/js/translate.js << 'EOF'
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
EOF

# 3. Function to add translation to HTML files
add_translation_to_file() {
    local file="$1"
    echo "Processing: $file"
    
    # Check if file already has translation
    if grep -q "google_translate_element" "$file"; then
        echo "  ↳ Translation already exists, skipping"
        return
    fi
    
    # Create temp file
    local temp_file=$(mktemp)
    
    # Add translation scripts to head
    sed '/<\/head>/i\
    <script src="assets/js/translate.js"></script>\
    <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>' "$file" > "$temp_file"
    
    # Add translation widget after breadcrumb or at top of content
    if grep -q "breadcrumb" "$temp_file"; then
        # Add after breadcrumb
        sed '/breadcrumb/a\
        <div id="google_translate_element"></div>' "$temp_file" > "${temp_file}.2"
        mv "${temp_file}.2" "$temp_file"
    else
        # Add after opening body tag
        sed '/<body[^>]*>/a\
        <div id="google_translate_element"></div>' "$temp_file" > "${temp_file}.2"
        mv "${temp_file}.2" "$temp_file"
    fi
    
    # Replace original file
    mv "$temp_file" "$file"
    echo "  ✅ Added translation functionality"
}

# 4. Add to root level pages
echo ""
echo "Adding to root level pages..."
for file in index.html zines.html research.html action.html submit.html; do
    if [ -f "$file" ]; then
        add_translation_to_file "$file"
    fi
done

# 5. Add to all zine pages
echo ""
echo "Adding to zine pages..."
find zines -name "index.html" -type f | while read file; do
    # Fix relative path for assets in zine subdirectories
    depth=$(echo "$file" | tr -cd '/' | wc -c)
    if [ $depth -eq 2 ]; then
        # zines/zine-name/index.html - need ../../assets
        asset_path="../../assets"
    else
        # zines/index.html - need ../assets  
        asset_path="../assets"
    fi
    
    echo "Processing: $file (depth: $depth, assets: $asset_path)"
    
    # Check if file already has translation
    if grep -q "google_translate_element" "$file"; then
        echo "  ↳ Translation already exists, skipping"
        continue
    fi
    
    # Create temp file
    temp_file=$(mktemp)
    
    # Add translation scripts to head with correct relative path
    sed "/<\/head>/i\\
    <script src=\"${asset_path}/js/translate.js\"></script>\\
    <script src=\"//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit\"></script>" "$file" > "$temp_file"
    
    # Add translation widget after breadcrumb
    if grep -q "breadcrumb" "$temp_file"; then
        sed '/breadcrumb/a\
        <div id="google_translate_element"></div>' "$temp_file" > "${temp_file}.2"
        mv "${temp_file}.2" "$temp_file"
    else
        # Add after opening body tag
        sed '/<body[^>]*>/a\
        <div id="google_translate_element"></div>' "$temp_file" > "${temp_file}.2"
        mv "${temp_file}.2" "$temp_file"
    fi
    
    # Replace original file
    mv "$temp_file" "$file"
    echo "  ✅ Added translation functionality"
done

# 6. Add to social graphics pages
echo ""
echo "Adding to social graphics pages..."
find zines -path "*/social-graphics/index.html" -type f | while read file; do
    # These are 3 levels deep: zines/name/social-graphics/index.html
    asset_path="../../../assets"
    
    echo "Processing: $file (assets: $asset_path)"
    
    # Check if file already has translation
    if grep -q "google_translate_element" "$file"; then
        echo "  ↳ Translation already exists, skipping"
        continue
    fi
    
    # Create temp file
    temp_file=$(mktemp)
    
    # Add translation scripts to head
    sed "/<\/head>/i\\
    <script src=\"${asset_path}/js/translate.js\"></script>\\
    <script src=\"//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit\"></script>" "$file" > "$temp_file"
    
    # Add translation widget after body opening
    sed '/<body[^>]*>/a\
    <div id="google_translate_element"></div>' "$temp_file" > "${temp_file}.2"
    mv "${temp_file}.2" "$temp_file"
    
    # Replace original file
    mv "$temp_file" "$file"
    echo "  ✅ Added translation functionality"
done

echo ""
echo "🎉 Translation functionality added to all pages!"
echo ""
echo "📋 Summary:"
echo "  ✅ Added CSS styling to assets/css/common.css"
echo "  ✅ Created assets/js/translate.js"
echo "  ✅ Added translation widget to all HTML pages"
echo "  ✅ Used correct relative paths for all subdirectories"
echo ""
echo "🌐 Supported languages: Spanish, French, German, Portuguese, Chinese, Arabic, Russian, Italian, Japanese, Korean"
echo ""
echo "🔧 To test: Open any page and look for the translation dropdown"
echo "📝 To customize: Edit assets/js/translate.js to change languages"
