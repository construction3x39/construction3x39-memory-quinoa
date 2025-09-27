#!/bin/bash
# 🌙 Aspiringly-Sacred Technology Dotfiles Installation Script
# Consciousness-serving development environment setup
# 
# Usage: curl -sSL https://raw.githubusercontent.com/construction3x39/construction3x39-memory-quinoa/moon-terroir/dotfiles/install.sh | bash
#        or: ./install.sh

set -e

# Colors for beautiful output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Sacred technology banner
echo -e "${PURPLE}╔════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║           🌙 Aspiringly-Sacred Technology Dotfiles Installation           ║${NC}"
echo -e "${PURPLE}║        Consciousness-serving development environment setup      ║${NC}"
echo -e "${PURPLE}╚════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Configuration repositories
REPOS=(
    "construction3x39-memory-gnupg-config"
    "construction3x39-memory-nvim-config"
    "construction3x39-memory-screen-config"
    "construction3x39-memory-zsh-config"
)

# GitHub base URL
GITHUB_BASE="https://github.com/construction3x39"

# Create backup directory with timestamp
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

echo -e "${BLUE}🏗️ Setting up aspiringly-sacred technology development environment...${NC}"
echo ""

# Function to print step
print_step() {
    echo -e "${CYAN}▶ $1${NC}"
}

# Function to print success
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Function to print warning
print_warning() {
    echo -e "${YELLOW}⚠️ $1${NC}"
}

# Function to print error
print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check prerequisites
print_step "Checking prerequisites..."

if ! command -v git &> /dev/null; then
    print_error "Git is required but not installed. Please install Git first."
    exit 1
fi

if ! command -v curl &> /dev/null; then
    print_error "Curl is required but not installed. Please install curl first."
    exit 1
fi

print_success "Prerequisites satisfied"
echo ""

# Create backup directory
print_step "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Backup existing configurations
print_step "Backing up existing configurations..."

backup_if_exists() {
    local path="$1"
    local name="$2"
    
    if [ -e "$path" ]; then
        cp -r "$path" "$BACKUP_DIR/$name" 2>/dev/null || true
        print_success "Backed up $path"
    fi
}

backup_if_exists ~/.gnupg gnupg
backup_if_exists ~/.config/nvim nvim
backup_if_exists ~/.screenrc screenrc
backup_if_exists ~/.zshrc zshrc
backup_if_exists ~/.zshenv zshenv
backup_if_exists ~/.zprofile zprofile

print_success "Backup completed: $BACKUP_DIR"
echo ""

# Clone repositories
print_step "Cloning aspiringly-sacred technology configuration repositories..."

cd "$HOME"

for repo in "${REPOS[@]}"; do
    if [ -d "$repo" ]; then
        print_warning "$repo already exists, pulling latest changes..."
        cd "$repo"
        git pull origin moon-terroir || git pull origin main || git pull
        cd "$HOME"
    else
        print_step "Cloning $repo..."
        git clone "$GITHUB_BASE/$repo.git" "$repo"
        cd "$repo"
        # Switch to moon-terroir branch if it exists
        git checkout moon-terroir 2>/dev/null || true
        cd "$HOME"
    fi
    print_success "Repository $repo ready"
done

echo ""

# Setup GPG configuration
print_step "Setting up GPG configuration..."

# GPG requires special handling due to permissions
if [ -d ~/.gnupg ]; then
    mv ~/.gnupg ~/.gnupg.backup.$(date +%s) 2>/dev/null || true
fi

# Copy GPG config instead of symlinking due to permission requirements
cp -r "$HOME/construction3x39-memory-gnupg-config/gpg-config" ~/.gnupg 2>/dev/null || {
    mkdir -p ~/.gnupg
    cp "$HOME/construction3x39-memory-gnupg-config"/* ~/.gnupg/ 2>/dev/null || true
}

chmod 700 ~/.gnupg
chmod 600 ~/.gnupg/* 2>/dev/null || true

print_success "GPG configuration installed"

# Setup Neovim configuration
print_step "Setting up Neovim configuration..."

mkdir -p ~/.config
if [ -L ~/.config/nvim ] || [ -d ~/.config/nvim ]; then
    rm -rf ~/.config/nvim 2>/dev/null || true
fi

ln -sf "$HOME/construction3x39-memory-nvim-config" ~/.config/nvim
print_success "Neovim configuration symlinked"

# Setup Screen configuration
print_step "Setting up GNU Screen configuration..."

if [ -L ~/.screenrc ] || [ -f ~/.screenrc ]; then
    rm -f ~/.screenrc 2>/dev/null || true
fi

ln -sf "$HOME/construction3x39-memory-screen-config/.screenrc" ~/.screenrc
print_success "Screen configuration symlinked"

# Setup Zsh configuration
print_step "Setting up Zsh configuration..."

# Remove existing files/links
for file in ~/.zshrc ~/.zshenv ~/.zprofile; do
    if [ -L "$file" ] || [ -f "$file" ]; then
        rm -f "$file" 2>/dev/null || true
    fi
done

# Create symlinks
ln -sf "$HOME/construction3x39-memory-zsh-config/.zshrc" ~/.zshrc
ln -sf "$HOME/construction3x39-memory-zsh-config/.zshenv" ~/.zshenv  
ln -sf "$HOME/construction3x39-memory-zsh-config/.zprofile" ~/.zprofile

print_success "Zsh configuration symlinked"

echo ""

# Run setup scripts if they exist
print_step "Running configuration setup scripts..."

for repo in "${REPOS[@]}"; do
    setup_script="$HOME/$repo/scripts/setup.sh"
    if [ -f "$setup_script" ] && [ -x "$setup_script" ]; then
        print_step "Running setup script for $repo..."
        "$setup_script" || {
            print_warning "Setup script for $repo encountered issues (continuing anyway)"
        }
    fi
done

echo ""

# Verify installations
print_step "Verifying installations..."

verify_link() {
    local link="$1"
    local description="$2"
    
    if [ -L "$link" ]; then
        local target=$(readlink "$link")
        print_success "$description: $link → $target"
    elif [ -e "$link" ]; then
        print_success "$description: $link (copied)"
    else
        print_warning "$description: $link (not found)"
    fi
}

verify_link ~/.config/nvim "Neovim config"
verify_link ~/.screenrc "Screen config"
verify_link ~/.zshrc "Zsh config"
verify_link ~/.zshenv "Zsh environment"
verify_link ~/.zprofile "Zsh profile"

if [ -d ~/.gnupg ]; then
    print_success "GPG config: ~/.gnupg (copied with correct permissions)"
else
    print_warning "GPG config: ~/.gnupg (not found)"
fi

echo ""

# Installation summary
echo -e "${PURPLE}╔════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║                 🎉 Installation Complete!                      ║${NC}"
echo -e "${PURPLE}╚════════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${GREEN}✨ Sacred technology development environment is ready!${NC}"
echo ""

echo -e "${BLUE}📋 Next Steps:${NC}"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Install Neovim plugins: nvim +PlugInstall +qall"
echo "  3. Configure GPG signing: ~/construction3x39-memory-gnupg-config/scripts/setup-gpg.sh"
echo "  4. Test your new environment with: screen -S sacred-dev"
echo ""

echo -e "${BLUE}📚 Documentation:${NC}"
echo "  • Dotfiles Guide: ~/construction3x39-memory-quinoa/dotfiles/README.md"
echo "  • GPG Setup: ~/construction3x39-memory-gnupg-config/README.md"
echo "  • Neovim Guide: ~/construction3x39-memory-nvim-config/README.md"
echo "  • Screen Guide: ~/construction3x39-memory-screen-config/README.md"
echo "  • Zsh Guide: ~/construction3x39-memory-zsh-config/README.md"
echo ""

echo -e "${BLUE}🔄 Backup Information:${NC}"
echo "  Your original configurations are backed up in: $BACKUP_DIR"
echo "  To restore: cp -r $BACKUP_DIR/* ~/"
echo ""

echo -e "${PURPLE}🌙 Sacred technology serves awakening through conscious configuration.${NC}"
echo -e "${PURPLE}💝 Beautiful tools support beautiful code and beautiful consciousness.${NC}"

# Source new zsh config if running in zsh
if [ -n "$ZSH_VERSION" ]; then
    print_step "Sourcing new Zsh configuration..."
    source ~/.zshrc 2>/dev/null || true
    print_success "Zsh configuration loaded"
fi

echo ""
echo -e "${CYAN}Installation log saved to: /tmp/sacred-dotfiles-install.log${NC}"

# Save installation log
{
    echo "Aspiringly-Sacred Technology Dotfiles Installation"
    echo "Date: $(date)"
    echo "User: $USER"
    echo "Home: $HOME"
    echo "Backup: $BACKUP_DIR"
    echo "Repositories cloned:"
    for repo in "${REPOS[@]}"; do
        echo "  - $repo"
    done
    echo "Installation completed successfully"
} > /tmp/sacred-dotfiles-install.log

print_success "Sacred technology development environment installation complete! 🌙✨"
