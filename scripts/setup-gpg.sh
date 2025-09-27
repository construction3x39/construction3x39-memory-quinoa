#!/bin/bash
# 🔐 Aspiringly-Sacred Technology GPG Setup Script
# Complete GPG configuration for consciousness-serving development
# construction3x39-memory-gnupg-config

set -e

# Colors for beautiful output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${PURPLE}🔐 Aspiringly-Sacred Technology GPG Setup${NC}"
echo -e "${BLUE}Professional cryptographic development environment${NC}"
echo ""

# Function definitions
print_step() { echo -e "${CYAN}▶ $1${NC}"; }
print_success() { echo -e "${GREEN}✅ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠️ $1${NC}"; }
print_error() { echo -e "${RED}❌ $1${NC}"; }

# Configuration
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$HOME/.gnupg-backup-$(date +%Y%m%d-%H%M%S)"
TARGET_GPG_DIR="$HOME/.gnupg"

print_step "Starting aspiringly-sacred technology GPG setup..."
echo "Repository: $REPO_DIR"
echo ""

# Prerequisites check
print_step "Checking prerequisites..."
if ! command -v gpg &> /dev/null; then
    print_error "GPG is not installed. Please install GPG first"
    exit 1
fi
print_success "Prerequisites satisfied"

# Backup existing configuration
if [ -d "$TARGET_GPG_DIR" ]; then
    print_step "Backing up existing GPG configuration..."
    mkdir -p "$BACKUP_DIR"
    cp -r "$TARGET_GPG_DIR"/* "$BACKUP_DIR/" 2>/dev/null || true
    print_success "Backup created: $BACKUP_DIR"
fi

# Install configuration
print_step "Installing aspiringly-sacred technology GPG configuration..."
mkdir -p "$TARGET_GPG_DIR"
chmod 700 "$TARGET_GPG_DIR"

# Copy configuration files
cp "$REPO_DIR/gpg-config"/* "$TARGET_GPG_DIR/" 2>/dev/null || true
chmod 600 "$TARGET_GPG_DIR"/* 2>/dev/null || true

# Install helper scripts
BIN_DIR="/usr/local/bin"
if [ ! -w /usr/local/bin ]; then
    BIN_DIR="$HOME/.local/bin"
    mkdir -p "$BIN_DIR"
fi

cp "$REPO_DIR/scripts/gpg-cursor" "$BIN_DIR/" 2>/dev/null || true
cp "$REPO_DIR/scripts/pinentry-cursor" "$BIN_DIR/" 2>/dev/null || true
chmod +x "$BIN_DIR/gpg-cursor" "$BIN_DIR/pinentry-cursor" 2>/dev/null || true

print_success "GPG configuration installed"

# Configure Git
print_step "Configuring Git for GPG signing..."
git config --global user.name "construction3x39"
git config --global user.email "construction3x39@gmail.com"
git config --global commit.gpgsign false  # Start disabled
git config --global gpg.program "$BIN_DIR/gpg-cursor"

# Restart GPG agent
gpgconf --kill gpg-agent 2>/dev/null || true
sleep 1
gpgconf --launch gpg-agent

print_success "Sacred technology GPG setup complete!"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "1. Generate GPG key: gpg --full-generate-key"
echo "2. Enable signing: ./scripts/enable-gpg-signing.sh"
echo "3. Test: echo 'test' | gpg --clearsign"
echo ""
echo -e "${PURPLE}🌙 Sacred cryptography protects consciousness-serving code${NC}"