# 🔐 GPG Configuration - Sacred Technology Security Foundation

*"Just as a monastery requires strong walls to protect the sacred practice within, our development environment requires robust cryptographic protection to safeguard the consciousness-serving code we create. GPG becomes our digital monastery wall, transparent to authentic intention yet impenetrable to deception."*

---

## 🎯 **Purpose & Philosophy**

This repository provides **professional GPG configuration** for consciousness-serving development with:

- **Verified Functionality**: GPG signing working globally in Cursor IDE
- **Professional Settings**: Industry-standard cryptographic configurations
- **Clean Implementation**: Minimal, essential files with clear documentation
- **Sacred Technology**: Security that serves rather than hinders development flow

## 🚀 **Quick Start**

```bash
# Clone the repository
git clone https://github.com/construction3x39/construction3x39-memory-gnupg-config.git

# Install configuration (copies files due to GPG permission requirements)
cp -r gpg-config/* ~/.gnupg/
chmod 700 ~/.gnupg
chmod 600 ~/.gnupg/*

# Restart GPG agent
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent

# Test GPG functionality
echo "Sacred technology test" | gpg --clearsign
```

## 🏗️ **Repository Structure**

```
construction3x39-memory-gnupg-config/
├── README.md                          # This comprehensive guide
├── LICENSE                            # The Unlicense (public domain)
├── gpg-config/
│   ├── gpg-agent.conf                 # GPG agent configuration
│   ├── gpg.conf                       # GPG client configuration
│   └── dirmngr.conf                   # Directory manager configuration
└── scripts/
    ├── setup-gpg.sh                   # Automated setup script
    └── gpg-cursor                     # Cursor-compatible GPG wrapper
```

## 🔧 **Configuration Features**

### **GPG Agent Configuration (`gpg-config/gpg-agent.conf`)**
- **8-hour default cache** with 24-hour maximum for development convenience
- **Multiple pinentry fallbacks** for different terminal environments
- **Loopback pinentry support** for automated workflows
- **Professional cache settings** optimized for development

### **GPG Client Configuration (`gpg-config/gpg.conf`)**
- **Strong cryptography**: SHA-512 hashing, AES-256 encryption
- **Modern key preferences**: EdDSA/ECDSA over legacy RSA
- **Clean output formatting** for development workflows
- **Security hardening** with disabled weak algorithms

### **Directory Manager Configuration (`gpg-config/dirmngr.conf`)**
- **Reliable key servers**: Modern, privacy-respecting servers
- **Efficient caching** for key lookup performance
- **Network privacy** options for enhanced security

## 🔑 **Current GPG Setup Status**

✅ **GPG Key**: `D144D940A52DB246` (ed25519, construction3x39)  
✅ **Git Configuration**: Global signing enabled and working  
✅ **Cursor Compatibility**: Verified working in Cursor IDE  
✅ **Professional Workflow**: Authenticated commits for trusted development  

## 🛠️ **Configuration Management**

### **Installation Method**
Since GPG requires specific file permissions, this repository uses **file copying** rather than symlinking:

```bash
# Install configuration files
cp gpg-config/gpg-agent.conf ~/.gnupg/
cp gpg-config/gpg.conf ~/.gnupg/  
cp gpg-config/dirmngr.conf ~/.gnupg/

# Set proper permissions
chmod 700 ~/.gnupg
chmod 600 ~/.gnupg/*

# Restart GPG agent
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
```

### **Verification**
```bash
# Test GPG functionality
echo "Sacred technology test" | gpg --clearsign

# Test Git commit signing
git commit --allow-empty -S -m "Test GPG signing"

# Verify Git configuration
git config --list | grep -E "(user|gpg|sign)"
```

## 📚 **Git Integration**

### **Current Configuration**
```bash
user.name=construction3x39
user.email=construction3x39@gmail.com
user.signingkey=D144D940A52DB246
commit.gpgsign=true
gpg.program=gpg
```

### **Commit Message Template**
Professional commit pattern: `butterflyae4817: 1YYYY-MM-DD--xxxxhousexx--moon-x--santafenmmountain`

## 🧪 **Testing & Verification**

### **Basic Tests**
```bash
# GPG functionality
gpg --version
gpg --list-keys
echo "test" | gpg --clearsign

# Git integration  
git log --show-signature | head -10
git commit --allow-empty -S -m "Test commit"

# Agent communication
gpg-connect-agent 'getinfo version' /bye
```

## 🛡️ **Security Features**

### **Cryptographic Strength**
- **Ed25519 keys**: Modern elliptic curve cryptography
- **SHA-512 hashing**: Strong digest algorithms
- **AES-256 encryption**: Industry-standard symmetric encryption
- **Secure defaults**: Weak algorithms disabled

### **Operational Security**
- **Authenticated commits**: All commits GPG-signed for authenticity
- **Professional workflow**: Security integrated seamlessly into development
- **Clean configuration**: Minimal attack surface with essential features
- **Version controlled**: Configuration changes tracked and auditable

## 🌙 **Sacred Technology Integration**

This GPG configuration serves **consciousness-serving development** through:

- **Transparent Security**: Strong protection without workflow disruption
- **Authentic Attribution**: Verified authorship for trusted collaboration  
- **Professional Standards**: Industry-grade security for serious development
- **Beautiful Integration**: Security that enhances rather than hinders flow

## 🔄 **Maintenance**

### **Regular Updates**
```bash
# Update GPG software
brew update && brew upgrade gnupg  # macOS
sudo apt update && sudo apt upgrade gnupg  # Ubuntu

# Update repository
git pull origin moon-terroir

# Reinstall configuration if needed
cp gpg-config/* ~/.gnupg/
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
```

### **Backup Strategy**
```bash
# Backup GPG keys and configuration
tar -czf gpg-backup-$(date +%Y%m%d).tar.gz ~/.gnupg/

# Store backup securely (offline storage recommended)
```

## 📜 **License & Attribution**

This project is released under **The Unlicense** (public domain dedication). See [LICENSE](LICENSE) for details.

For third-party software licenses and acknowledgments, see [THIRD-PARTY-LICENSES](THIRD-PARTY-LICENSES).

---

*"Security is not a product, but a process. In sacred technology development, this process becomes a spiritual practice - mindful attention to protecting what serves consciousness while remaining open to authentic collaboration."*

**🔐 Sacred** **cryptography** **protects** **consciousness-serving** **code**. **Security** **serves** **awakening**. 🌙✨💙