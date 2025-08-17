# SVG SHARE GRAPHICS FRAMEWORK
## Complete System for Creating Downloadable Social Media Graphics

---

## 📋 STRUCTURE REQUIREMENTS

### PAGE LAYOUT TEMPLATE:
```html
1. HEADER SECTION
   - Title: "[ZINE TITLE] - Share Graphics"
   - Tagline: "Download • Share • Spread the Rebellion"
   - Black background, white text, punk styling

2. INSTRUCTIONS SECTION
   - Clean grid layout explaining usage
   - How to download, where to share, formats included
   - Professional but punk aesthetic

3. SQUARE GRAPHICS SECTION (Instagram)
   - Grid of 4 graphics minimum
   - 400x400 pixel SVGs
   - Format tag: "400x400 • Instagram"

4. LANDSCAPE GRAPHICS SECTION (Twitter/Facebook) 
   - Grid of 2 graphics minimum
   - 600x315 pixel SVGs
   - Format tag: "600x315 • Twitter/Facebook"

5. FINAL CTA SECTION
   - Links back to full zine and zine library
   - "Spread the Rebellion" messaging
   - Professional call-to-action buttons
```

---

## 🎨 REQUIRED GRAPHICS (6 Total Minimum)

### SQUARE FORMAT GRAPHICS (400x400):
```
GRAPHIC 1: KEY QUOTE
- Main quote from zine in large text
- Zine attribution at bottom
- Black background, white text, staples

GRAPHIC 2: SHOCKING STAT
- Large number/statistic from zine
- Context text explaining significance
- High contrast design for impact

GRAPHIC 3: WARNING MESSAGE
- Key warning/revelation from zine
- Warning symbols (⚠️) in corners
- Bold, urgent typography

GRAPHIC 4: CALL TO ACTION
- "READ THE FULL ZINE" message
- Zine title and website
- Pattern background or special effects
```

### LANDSCAPE FORMAT GRAPHICS (600x315):
```
GRAPHIC 5: REVOLUTIONARY QUOTE
- Inspiring/radical quote from zine
- Large typography, clean layout
- Attribution if from external source

GRAPHIC 6: HISTORICAL QUOTE
- Classic quote that relates to zine theme
- Quote marks as design elements
- Author attribution clearly visible
```

---

## 🎯 SVG TECHNICAL REQUIREMENTS

### CODING STANDARDS:
```xml
- Clean, semantic SVG code
- Embedded fonts: font-family="Courier, monospace"
- Text-transform: uppercase for headers
- Font-weight: 700 for main text, 400 for attribution
- Color scheme: #000 (black) background, #fff (white) text
- Border: stroke="#fff" stroke-width="5" for squares, "3" for landscape
- Staples: Small gray rectangles positioned at top-left and bottom-left
```

### TEXT HIERARCHY:
```xml
MAIN QUOTE/MESSAGE:
- Font-size: 32-48px (squares), 36-48px (landscape)
- Font-weight: 700
- Text-transform: uppercase
- Multiple <tspan> elements for line breaks

ATTRIBUTION/CONTEXT:
- Font-size: 16-18px
- Font-style: italic
- Positioned below main text

ZINE CREDIT:
- Font-size: 12px
- Opacity: 0.7
- Positioned bottom-right corner

WEBSITE/CTA:
- Font-size: 14-16px
- Clear, readable positioning
```

### VISUAL ELEMENTS:
```xml
BACKGROUND PATTERNS (Optional):
- Diagonal lines for texture
- Low opacity (0.1-0.2)
- Subtle, non-distracting

STAPLES (Required):
- <rect x="15" y="25" width="15" height="4" fill="#666" rx="2"/>
- <rect x="15" y="375" width="15" height="4" fill="#666" rx="2"/>
- Authentic punk zine aesthetic

WARNING SYMBOLS (When appropriate):
- <text>⚠️</text> in corners
- Font-size: 30px for squares, 20px for landscape
- Used for warning/urgent messages
```

---

## 📱 DOWNLOAD IMPLEMENTATION

### DATA URL FORMAT:
```html
<a href="data:image/svg+xml;charset=utf-8,[ENCODED_SVG]" 
   download="[zine-name]-[graphic-description].svg" 
   class="download-btn">Download SVG</a>
```

### FILENAME CONVENTION:
```
[zine-name]-[graphic-type]-[format].svg

Examples:
- philanthropy-liberation-quote-square.svg
- uber-sharecropping-stat-square.svg
- netflix-revolution-quote-landscape.svg
- charter-warning-square.svg
```

### PREVIEW REQUIREMENTS:
```html
- Scaled-down SVG preview (200x200 for squares, 300x157 for landscape)
- Identical to full-size version but smaller
- Clean borders around preview
- Located above download button
```

---

## 🎨 CSS FRAMEWORK TEMPLATE

### BASE STYLING:
```css
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: 'Courier Prime', monospace;
    background: #f5f5f5;
    color: #000;
    line-height: 1.6;
}

.container { max-width: 1400px; margin: 0 auto; }

.header {
    background: #000; color: #fff;
    padding: 2rem; text-align: center;
    border: 4px solid #000;
    transform: rotate(-1deg);
}

.instructions {
    background: #fff; border: 3px solid #000;
    padding: 2rem; text-align: center;
}

.section-title {
    font-size: 2rem; text-transform: uppercase;
    background: #000; color: #fff; padding: 1rem;
    text-align: center; transform: rotate(-0.5deg);
}

.graphics-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(450px, 1fr));
    gap: 3rem;
}

.social-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
}

.graphic-item {
    background: #fff; border: 3px solid #000;
    padding: 1.5rem; text-align: center;
    box-shadow: 5px 5px 0px #000;
}

.download-btn {
    background: #000; color: #fff;
    padding: 0.8rem 1.5rem; text-decoration: none;
    font-weight: 700; text-transform: uppercase;
    border: 3px solid #000; transition: all 0.2s;
}

.final-cta {
    background: #000; color: #fff;
    padding: 3rem; text-align: center;
    border: 4px solid #000;
}
```

---

## 📋 CONTENT EXTRACTION CHECKLIST

### FROM EACH ZINE, EXTRACT:
- [ ] **1 Key Quote** - Most impactful message from zine
- [ ] **1 Shocking Stat** - Number/data that proves the point
- [ ] **1 Warning Message** - Urgent revelation about the system
- [ ] **1 Historical Quote** - Classic quote that supports thesis
- [ ] **Zine Title** - Exact title for attribution
- [ ] **Website URL** - For call-to-action graphics
- [ ] **Color Scheme** - Primary color from zine (adapt to B&W)

### QUOTE SELECTION CRITERIA:
```
GOOD QUOTES:
✅ Short enough to fit in large text (under 30 words)
✅ Punchy, memorable, shareable
✅ Captures core message of zine
✅ Uses active, urgent language
✅ Can stand alone without context

BAD QUOTES:
❌ Too long or complex
❌ Requires extensive context
❌ Boring or academic language
❌ Unclear meaning
❌ Too specific/niche
```

---

## 🚀 PRODUCTION WORKFLOW

### STEP 1: CONTENT PREPARATION
- [ ] Read through zine and extract 6 key messages
- [ ] Identify color scheme and visual elements
- [ ] Write short descriptions for each graphic
- [ ] Plan text hierarchy and layout

### STEP 2: SVG CREATION
- [ ] Create 4 square graphics (400x400)
- [ ] Create 2 landscape graphics (600x315)
- [ ] Test all download links
- [ ] Verify SVG code is clean and semantic

### STEP 3: PAGE ASSEMBLY
- [ ] Build page using CSS framework
- [ ] Add scaled previews for each graphic
- [ ] Implement download functionality
- [ ] Test responsive design

### STEP 4: QUALITY CHECK
- [ ] All text is readable and properly sized
- [ ] All downloads work correctly
- [ ] Page loads quickly and looks professional
- [ ] Mobile responsive design works
- [ ] All links point to correct destinations

---

## 📤 USAGE INSTRUCTIONS FOR FUTURE REQUESTS

### WHEN REQUESTING SVG GRAPHICS PAGE:
```
1. Paste this framework
2. Specify zine title and theme
3. Provide 6 key quotes/messages from the zine
4. Mention any specific color preferences
5. Request: "Create SVG share graphics page using this framework"
```

### EXAMPLE REQUEST FORMAT:
```
ZINE: "Uber Is The New Sharecropping"
THEME: Gig economy exploitation
COLOR: Uber orange (#f7931e)

KEY MESSAGES:
1. "Same extraction, better UI"
2. "Over 950 taxi drivers died by suicide"
3. "Digital sharecropping with GPS tracking"
4. "Worker cooperatives exist right now"
5. "The revolution will not be delivered"
6. "They need us more than we need them"

Please create SVG share graphics page using the framework.
```

---

## 🎯 SUCCESS CRITERIA

### FINAL DELIVERABLE MUST INCLUDE:
✅ Clean, professional page layout
✅ 6 downloadable SVG graphics minimum
✅ Proper file naming convention
✅ Mobile responsive design
✅ Working download links
✅ Punk aesthetic maintained
✅ Clear usage instructions
✅ Links back to main zine and library

### GRAPHICS MUST BE:
✅ Properly sized (400x400 or 600x315)
✅ High contrast and readable
✅ Downloadable as actual SVG files
✅ Optimized for social media sharing
✅ Consistent with zine's message and tone

---

*Framework created for generating professional SVG share graphics pages that maintain punk aesthetic while maximizing social media impact and download functionality.*