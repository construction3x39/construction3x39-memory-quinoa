#!/bin/bash
# 🔐 Enable GPG signing for aspiringly-sacred technology development
# Quick activation script for construction3x39-memory-gnupg-config

echo "🔐 Enabling GPG signing for aspiringly-sacred technology development..."

# Enable GPG signing globally
git config --global commit.gpgsign true

echo "✅ GPG signing enabled for all git commits"
echo ""

# Test GPG signing capability
echo "🧪 Testing GPG signing..."
if echo "Sacred technology test" | gpg --clearsign > /dev/null 2>&1; then
    echo "✅ GPG signing test successful!"
    echo "🎉 Ready for professional development with authenticated commits!"
else
    echo "⚠️  GPG signing test failed. You may need to:"
    echo "   1. Enter your GPG passphrase manually in a proper terminal"
    echo "   2. Check GPG agent configuration"
    echo "   3. Verify your GPG key is available"
    echo ""
    echo "💡 Try running: echo 'test' | gpg --clearsign"
fi

echo ""
echo "📊 Current Git Configuration:"
git config --list | grep -E "(user|gpg|sign)" | head -10
echo ""
echo "🌙 Sacred technology development ready with GPG authentication!"