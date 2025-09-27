#!/bin/bash
# 🔐 Enable GPG signing for professional epub development
# Quick activation script for construction3x39-memory-quinoa

echo "🔐 Enabling GPG signing for professional epub generation..."
echo "🌾 Sacred technology meets publishing excellence"

# Enable GPG signing globally
git config --global commit.gpgsign true

echo "✅ GPG signing enabled for all git commits"
echo ""

# Test GPG signing capability
echo "🧪 Testing GPG signing..."
if echo "Sacred technology epub test" | gpg --clearsign > /dev/null 2>&1; then
    echo "✅ GPG signing test successful!"
    echo "🎉 Ready for professional epub development with authenticated commits!"
else
    echo "⚠️  GPG signing test failed. This may be due to:"
    echo "   1. Cursor terminal limitations (use Terminal.app for signing)"
    echo "   2. GPG passphrase needs to be entered manually"
    echo "   3. GPG agent configuration needs refresh"
    echo ""
    echo "💡 Solutions:"
    echo "   ./scripts/setup-gpg.sh     # Complete GPG reconfiguration"
    echo "   echo 'test' | gpg --clearsign  # Manual passphrase entry"
    echo "   gpgconf --kill gpg-agent && gpgconf --launch gpg-agent  # Restart agent"
    echo ""
    echo "📚 GPG signing is enabled but may require manual passphrase entry"
fi

echo ""
echo "📊 Current Git Configuration:"
git config --list | grep -E "(user|gpg|sign)" | head -10
echo ""
echo "🌙 Professional epub development ready with GPG authentication!"