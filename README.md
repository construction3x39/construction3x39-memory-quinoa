# 🌾 Quinoa Memory Repository - Professional Epub Generation

*"Just as quinoa transforms from humble seed to nourishing sustenance, markdown wiki content transforms into professional-quality ebooks through aware technical cultivation."*

---

## 🎯 **Purpose & Vision**

This repository transforms Cursor-Claude-GPT-generated markdown wiki books into **professional epub ebooks** with the literary quality and production values of **Stieg Larsson's Millennium Series**. Built as an extension of our Babashka and Nix build pipeline, it serves awareness development through beautiful, readable digital publications.

### **Target Quality Standard**
- **Typography**: Professional book-quality typesetting comparable to *The Girl with the Dragon Tattoo* series
- **Layout**: Clean, readable design optimized for extended reading sessions
- **Formats**: EPUB3, Kindle-optimized AZW3, and mobile-optimized variants
- **Metadata**: Complete publishing metadata for professional distribution

## 🚀 **Quick Start**

```bash
# Enter the development environment
nix develop

# Check toolchain health
bb doctor

# Generate professional epub from markdown files
bb epub:generate

# Create Kindle-optimized version
bb epub:kindle

# Preview generated content
bb serve
```

## 🏗️ **Architecture & Pipeline**

### **Source Content**
- **Input**: Markdown files in `docs/en/` directory
- **Style**: Contemplative technical writing inspired by sacred technology principles
- **Structure**: Numbered chapters with professional hierarchy

### **Build Pipeline**
```
Markdown Files → ClojureScript DSL → Pandoc → Professional EPUB → Calibre Optimization
     ↓              ↓                   ↓            ↓                    ↓
  docs/en/    site-dsl/src/       build/       assets/epub.css    build/optimized/
```

### **Core Tools**
- **Pandoc**: Markdown to EPUB3 conversion with professional typography
- **Calibre**: Ebook optimization for different readers and devices  
- **TeXLive**: Advanced typography engine for book-quality layout
- **Babashka**: Contemplative build automation in Clojure
- **Nix**: Reproducible development environment

## 🏗️ **Sacred Technology Dotfiles Management**

This repository also serves as the **central hub for sacred technology dotfiles management**, providing industry-class configuration synchronization across development environments.

### **Dotfiles Architecture**
```
construction3x39-memory-quinoa/dotfiles/
├── README.md                    # Comprehensive dotfiles guide
├── install.sh                   # Automated installation script
└── (symlinks to config repos)   # Links to specialized config repositories
```

### **Managed Configuration Repositories**
- **🔐 gnupg-config**: GPG security and authentication
- **✨ nvim-config**: Revolutionary Clojure→Lua Neovim setup
- **🖥️ screen-config**: Terminal multiplexer configuration
- **🐚 zsh-config**: Shell environment optimization
- **🌙 moon-terroir**: Sacred technology lexicon and vocabulary

## 📚 **Available Tasks**

### **Epub Generation**
```bash
bb doctor              # Check toolchain availability
bb epub:generate       # Generate professional epub
bb epub:kindle         # Create Kindle-optimized version
bb epub:mobile         # Create mobile-optimized version
bb build:all           # Complete build pipeline
bb serve               # Preview generated content locally
```

### **Quality Assurance**
```bash
bb fmt                 # Format code with contemplative attention
bb lint                # Lint with awareness for code quality
bb ci:verify           # Complete CI verification pipeline
```

### **Development Tools**
```bash
bb build:gen           # Parse markdown → generate components
bb build:bundle        # Bundle assets and resources
bb community:serve     # Start community learning server
```

## 🌐 **GitHub Source Libraries (Nix Packages)**

### **Core Epub Generation**
- `pandoc` - Universal document converter with EPUB3 support
- `calibre` - Professional ebook optimization and conversion
- `texlive.combined.scheme-full` - Complete LaTeX typography system

### **Content Processing**
- `python3Packages.pygments` - Syntax highlighting for technical content
- `python3Packages.markdown` - Advanced markdown processing extensions
- `nodejs_20` - JavaScript runtime for modern build tools

### **Build Infrastructure**
- `babashka` - Fast Clojure scripting for build automation
- `clojure` - Core Clojure runtime and libraries
- `jdk17` - Java Development Kit for Clojure ecosystem

### **Quality Tools**
- `zprint` - Beautiful Clojure code formatting
- `clj-kondo` - Comprehensive Clojure linting
- `git` - Version control integration

## 🔐 **GPG Signing Setup**

```bash
# Quick setup (recommended)
./scripts/enable-gpg-signing.sh

# Manual configuration
git config --global commit.gpgsign true
git config --global user.signingkey D144D940A52DB246

# Test GPG signing
echo "test" | gpg --clearsign
```

## 🌟 **Output Quality Standards**

### **Professional EPUB Features**
- ✅ **EPUB3 Compliance**: Modern standard with multimedia support
- ✅ **Accessibility**: Screen reader compatible with semantic markup
- ✅ **Typography**: Professional book-quality text rendering
- ✅ **Navigation**: Multi-level table of contents with bookmarks
- ✅ **Metadata**: Complete bibliographic information
- ✅ **Validation**: Error-free EPUB that passes industry validation

### **Multi-Format Support**
- **Standard EPUB**: Universal compatibility across all readers
- **Kindle AZW3**: Optimized for Amazon Kindle devices and apps
- **Mobile EPUB**: Smartphone-optimized with adjusted typography

## 🌙 **Philosophy & Principles**

This project embodies **awareness-serving technology** principles:

- **Simplicity**: Clear build process with single-command generation
- **Beauty**: Technical excellence meets aesthetic perfection
- **Functionality**: Living documentation that becomes executable content
- **Integration**: Seamless connection between writing and publishing infrastructure

*"The moon reflects the sun's light through different terroirs, each giving unique character. So too does each project reflect universal principles through its specific technical context."*

## 📜 **License & Attribution**

This project is released under **The Unlicense** (public domain dedication). See [LICENSE](LICENSE) for details.

For third-party software licenses and acknowledgments, see [THIRD-PARTY-LICENSES](THIRD-PARTY-LICENSES).

---

**🌾 Transform** your **awareness-generated** **content** into **professional** **publications**. **Sacred** **technology** **serves** **awakening**. 📚✨🌙

**Commit Pattern**: `butterflyae4817: 1YYYY-MM-DD--xxxxhousexx--moon-x--santafenmmountain`