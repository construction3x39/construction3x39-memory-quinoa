# 🔐 GPG Setup Quick Reference

## Current Status
- ✅ GPG Key: `D144D940A52DB246` (ed25519)
- ✅ Git Configuration: Ready
- ✅ Pinentry Script: Cursor-compatible
- ⚠️ GPG Signing: Disabled (pinentry issues in terminal)
- 🔧 Solution: Manual activation script provided

## Quick Setup

### Option 1: Quick Enable (Recommended)
```bash
./scripts/enable-gpg-signing.sh
```

### Option 2: Manual Setup
```bash
# Enable GPG signing
git config --global commit.gpgsign true

# Verify configuration
git config --list | grep -E "(user|gpg|sign)"
```

### Option 3: Full Setup (if needed)
```bash
./scripts/setup-gpg.sh
```

## Test GPG Signing
```bash
# Test GPG directly
echo "test" | gpg --clearsign

# Test git commit with signing
git commit --allow-empty -m "Test GPG signing"
```

## Troubleshooting

### If GPG signing fails with "Operation cancelled":
This is a common pinentry issue. Try these solutions:

1. **Restart GPG agent:**
   ```bash
   gpgconf --kill gpg-agent
   gpgconf --launch gpg-agent
   ```

2. **Test with different pinentry modes:**
   ```bash
   # Try TTY mode
   echo "test" | gpg --clearsign --pinentry-mode tty
   
   # Try loopback mode
   echo "test" | gpg --clearsign --pinentry-mode loopback
   ```

3. **Check GPG agent status:**
   ```bash
   gpg-connect-agent 'keyinfo --list' /bye
   ```

4. **Manual passphrase entry:**
   - Run `gpg --clearsign` in Terminal.app (not Cursor)
   - Enter your passphrase when prompted
   - This will cache the passphrase for future use

### If pinentry fails in Cursor:
- The custom pinentry script automatically falls back to tty mode
- For GUI password entry, run commands in Terminal.app instead of Cursor
- Consider using `gpg-agent` with GUI pinentry for better Cursor compatibility

## Configuration Files
- **GPG Agent**: `~/.gnupg/gpg-agent.conf` (symlinked from config repo)
- **Custom Pinentry**: `/Users/xx/construction3x39-memory-gnupg-config/pinentry-cursor`
- **Git Config**: Global settings for user, email, and signing key

## Current Git Configuration
```
user.name=construction3x39
user.email=construction3x39@gmail.com
user.signingkey=D144D940A52DB246
commit.gpgsign=false  # Set to true to enable
gpg.program=gpg
```
