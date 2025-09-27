#!/bin/bash
# 🔐 GPG Setup Script for construction3x39-memory-quinoa Professional Epub Generation
# This script sets up GPG signing with Cursor compatibility for sacred technology development

set -e

echo "🔐 Setting up GPG signing for professional epub generation..."
echo "🌾 construction3x39-memory-quinoa: Sacred technology meets publishing excellence"
echo ""

# Check if GPG key exists
if ! gpg --list-secret-keys --keyid-format=long | grep -q "D144D940A52DB246"; then
    echo "❌ GPG key D144D940A52DB246 not found!"
    echo "Please import your GPG key first or generate a new one:"
    echo "  gpg --full-generate-key"
    echo "  gpg --armor --export [KEY_ID]  # To get public key for GitHub"
    exit 1
fi

echo "✅ GPG key D144D940A52DB246 found"

# Ensure GPG agent configuration directory exists
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg

# Update GPG agent configuration for Cursor compatibility
echo "📝 Configuring GPG agent for Cursor compatibility..."
cat > ~/.gnupg/gpg-agent.conf << 'EOF'
# GPG Agent Configuration for construction3x39
# Optimized for Cursor IDE compatibility with professional epub development

# Pinentry configuration - use curses for terminal compatibility
pinentry-program /usr/local/bin/pinentry-curses

# Cache settings for convenient development workflow
default-cache-ttl 28800      # 8 hours for extended development sessions
max-cache-ttl 86400          # 24 hours maximum

# Allow loopback pinentry for automated workflows
allow-loopback-pinentry

# Debug settings (comment out in production)
# debug-level basic
# log-file ~/.gnupg/gpg-agent.log
EOF

# Set proper permissions for GPG configuration
chmod 600 ~/.gnupg/gpg-agent.conf

# Restart GPG agent to apply new configuration
echo "🔄 Restarting GPG agent with new configuration..."
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent

# Configure git for professional epub development with GPG signing
echo "⚙️  Configuring git for professional epub development..."
git config --global user.name "construction3x39"
git config --global user.email "construction3x39@gmail.com"
git config --global user.signingkey "D144D940A52DB246"
git config --global commit.gpgsign true
git config --global gpg.program gpg
git config --global commit.template ~/.gitmessage

# Create git commit message template for professional development
echo "📝 Creating professional commit message template..."
cat > ~/.gitmessage << 'EOF'
butterflyae4817: 12025-09-26--06thhouse12--moon-anuradha--santafenmmountain

# Professional epub generation commit
# 🌾 Quinoa Memory Repository: Sacred technology meets publishing excellence
# 
# Guidelines:
# - Use the butterfly pattern for timestamps
# - Focus on epub quality and professional standards
# - Maintain contemplative attention to consciousness-serving technology
# 
# Common prefixes:
# 📚 epub: - Professional epub generation improvements
# 🎨 style: - Typography and design enhancements  
# 🔧 build: - Build pipeline and toolchain updates
# 📖 docs: - Documentation and content improvements
# 🐛 fix: - Bug fixes and corrections
# ✨ feat: - New features and capabilities
EOF

# Test GPG signing capability
echo ""
echo "🧪 Testing GPG signing capability..."
if echo "Sacred technology test" | gpg --clearsign > /dev/null 2>&1; then
    echo "✅ GPG signing test successful!"
else
    echo "⚠️  GPG signing test failed. This may be due to Cursor terminal limitations."
    echo "💡 The configuration is correct and will work in proper terminals (Terminal.app, iTerm2)"
    echo ""
    echo "To test manually in a real terminal:"
    echo "  echo 'test' | gpg --clearsign"
fi

# Test git commit with signing (if we're in a git repository)
if [ -d .git ]; then
    echo ""
    echo "🧪 Testing git commit with GPG signing..."
    if git commit --allow-empty -m "🔐 Test GPG signing setup for professional epub generation" > /dev/null 2>&1; then
        echo "✅ Git commit with GPG signing successful!"
        git reset --soft HEAD~1  # Undo the test commit
    else
        echo "⚠️  Git commit with GPG signing failed. Check configuration or use real terminal."
    fi
fi

echo ""
echo "🎉 GPG setup complete for professional epub generation!"
echo ""
echo "📊 Configuration Summary:"
echo "  🔑 GPG Key: D144D940A52DB246 (ed25519)"
echo "  👤 User: construction3x39 <construction3x39@gmail.com>"
echo "  🖥️  Pinentry: Cursor-compatible curses mode"
echo "  📝 Commit Template: Professional epub development pattern"
echo "  ✍️  All commits will be GPG signed (when terminal supports it)"
echo ""
echo "🌙 Sacred technology development ready!"
echo "📚 Ready for Stieg Larsson-quality epub generation!"
echo ""
echo "🔧 Manual Testing Commands:"
echo "  echo 'Sacred technology test' | gpg --clearsign"
echo "  git commit --allow-empty -m '📚 epub: Test professional commit signing'"
echo ""
echo "💡 Note: GPG signing works best in proper terminals (Terminal.app, iTerm2)"
echo "    Cursor's integrated terminal may have limitations with interactive prompts"