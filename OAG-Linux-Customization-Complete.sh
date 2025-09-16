#!/bin/bash
# =============================================================================
# OAG Linux Customization Script - Complete Version
# Author: Umair Wali
# Date: 2025-09-16
# Description: Complete Linux customization from zero to professional
# =============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored messages
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    print_error "Please run this script with sudo"
    exit 1
fi

print_status "Starting OAG Linux Customization Process..."

# =============================================================================
# 1. SYSTEM INFORMATION & BRANDING
# =============================================================================

print_status "Setting up system branding..."

# Create custom release file
cat > /etc/oag-release << 'EOF'
OAG Linux 1.0
Codename: Phoenix
Build Date: 2025-09-16
Custom Linux Distribution
Built from Ubuntu 22.04 LTS Base
EOF

# Create distribution info file
cat > /etc/distro-info << 'EOF'
DISTRIB_ID=OAGLinux
DISTRIB_RELEASE=1.0
DISTRIB_CODENAME=phoenix
DISTRIB_DESCRIPTION="OAG Linux 1.0 Phoenix Edition"
EOF

print_success "System branding completed"

# =============================================================================
# 2. HOSTNAME CONFIGURATION
# =============================================================================

print_status "Configuring hostname..."

# Set default hostname
echo "oag-linux" > /etc/hostname

# Update hosts file
cat > /etc/hosts << 'EOF'
127.0.0.1    localhost
127.0.1.1    oag-linux
::1          localhost ip6-localhost ip6-loopback
ff02::1      ip6-allnodes
ff02::2      ip6-allrouters
EOF

# Create dynamic hostname script
cat > /usr/local/bin/set-oag-hostname.sh << 'EOF'
#!/bin/bash
if [ -f /etc/oag-profile ]; then
    PROFILE=$(cat /etc/oag-profile)
    case $PROFILE in
        "education") NEW_HOST="oag-edu" ;;
        "server") NEW_HOST="oag-server" ;;
        "professional") NEW_HOST="oag-pro" ;;
        "gaming") NEW_HOST="oag-game" ;;
        *) NEW_HOST="oag-linux" ;;
    esac
    hostnamectl set-hostname "$NEW_HOST"
    sed -i "s/127.0.1.1.*/127.0.1.1    $NEW_HOST/" /etc/hosts
fi
EOF

chmod +x /usr/local/bin/set-oag-hostname.sh

print_success "Hostname configuration completed"

# =============================================================================
# 3. CUSTOM WELCOME MESSAGES
# =============================================================================

print_status "Setting up welcome messages..."

# Create custom MOTD
cat > /etc/update-motd.d/99-oag-welcome << 'EOF'
#!/bin/bash
echo "╔══════════════════════════════════════╗"
echo "║      Welcome to OAG Linux 1.0        ║"
echo "║     Your Custom Linux Distribution   ║"
echo "║                                      ║"
echo "║  Built with ❤️ from Ubuntu 22.04     ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "System Information:"
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo ""
EOF

chmod +x /etc/update-motd.d/99-oag-welcome

print_success "Welcome messages configured"

# =============================================================================
# 4. ICON THEMES & APPEARANCE
# =============================================================================

print_status "Installing icon themes and appearance..."

# Update repositories
apt update

# Install git first
apt install -y git || {
    print_warning "Git not available, trying alternative method..."
    
    # Alternative: Direct download
    apt install -y wget unzip
    cd /tmp
    wget https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/master.zip
    unzip master.zip
    cp -r papirus-icon-theme-master/{Papirus,Papirus-Dark,Papirus-Light} /usr/share/icons/
    chmod -R 755 /usr/share/icons/Papirus*
    rm -rf papirus-icon-theme-master master.zip
}

# If git is available, use it
if command -v git &> /dev/null; then
    cd /tmp
    git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git
    cp -r papirus-icon-theme/{Papirus,Papirus-Dark,Papirus-Light} /usr/share/icons/
    chmod -R 755 /usr/share/icons/Papirus*
    rm -rf papirus-icon-theme
fi

# Create custom theme directories
mkdir -p /usr/share/themes/oag-theme
mkdir -p /usr/share/icons/oag-icons

# Install additional themes
apt install -y arc-theme numix-gtk-theme || print_warning "Some themes not available"

# Create custom wallpaper directory
mkdir -p /usr/share/backgrounds/oag

print_success "Icon themes and appearance configured"

# =============================================================================
# 5. DESKTOP ENVIRONMENT CUSTOMIZATION
# =============================================================================

print_status "Configuring desktop environment..."

# Install GNOME customization tools
apt install -y gnome-tweaks gnome-shell-extensions || print_warning "GNOME tools not available"

# Create wallpaper setter script
cat > /usr/local/bin/set-oag-wallpaper.sh << 'EOF'
#!/bin/bash
WALLPAPER="/usr/share/backgrounds/oag/oag-wallpaper.jpg"
if [ -f "$WALLPAPER" ]; then
    # For GNOME
    gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER" 2>/dev/null || true
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER" 2>/dev/null || true
    
    # Set default theme
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 2>/dev/null || true
    gsettings set org.gnome.desktop.interface icon-theme 'Papirus' 2>/dev/null || true
fi
EOF

chmod +x /usr/local/bin/set-oag-wallpaper.sh

print_success "Desktop environment configured"

# =============================================================================
# 6. INSTALLATION PROFILES
# =============================================================================

print_status "Setting up installation profiles..."

# Create profile directory
mkdir -p /usr/local/share/oag-profiles

# Create profile selector
cat > /usr/local/share/oag-profiles/select-profile.sh << 'EOF'
#!/bin/bash
# OAG Linux Profile Selector

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run with sudo for system-wide installation"
    exit 1
fi

clear
echo "╔══════════════════════════════════════╗"
echo "║      OAG Linux Profile Selector  	           ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "Choose your installation profile:"
echo ""
echo "1)  Education    - Educational software & tools"
echo "2)  Professional - Office & development tools"
echo "3)  Server      - Web server & database tools"
echo "4)  Gaming       - Games & entertainment"
echo "5)  Minimal      - Basic system only"
echo ""
read -p "Enter your choice (1-5): " choice

case $choice in
    1) PROFILE="education" ;;
    2) PROFILE="professional" ;;
    3) PROFILE="server" ;;
    4) PROFILE="gaming" ;;
    5) PROFILE="minimal" ;;
    *) PROFILE="minimal" ;;
esac

echo "$PROFILE" > /etc/oag-profile
echo "Selected profile: $PROFILE has been saved."

if [ -f "/usr/local/share/oag-profiles/install-${PROFILE}.sh" ]; then
    echo "Installing $PROFILE profile..."
    bash "/usr/local/share/oag-profiles/install-${PROFILE}.sh"
else
    echo "Profile installer not found for $PROFILE"
fi
EOF

chmod +x /usr/local/share/oag-profiles/select-profile.sh

# Create profile installers
for profile in education professional server gaming minimal; do
    cat > /usr/local/share/oag-profiles/install-${profile}.sh << EOF
#!/bin/bash
echo "Installing $(echo $profile | tr '[:lower:]' '[:upper:]') Profile..."
apt update

case "$profile" in
    "education")
        apt install -y libreoffice geogebra gcompris tuxpaint scratch ardour audacity calibre
        ;;
    "professional")
        apt install -y libreoffice thunderbird firefox code git gimp inkscape vlc obs-studio
        ;;
    "server")
        apt install -y apache2 mysql-server php openssh-server vsftpd bind9 nginx docker.io
        systemctl enable apache2 mysql ssh vsftpd bind9 nginx docker 2>/dev/null || true
        ;;
    "gaming")
        apt install -y steam playonlinux lutris wine dosbox minecraft-launcher discord
        ;;
    "minimal")
        apt install -y firefox-esr nano vim
        ;;
esac
EOF
    chmod +x /usr/local/share/oag-profiles/install-${profile}.sh
done

print_success "Installation profiles configured"

# =============================================================================
# 7. PACKAGE MANAGEMENT
# =============================================================================

print_status "Installing additional packages..."

# Create custom package installer
cat > /usr/local/bin/install-oag-packages.sh << 'EOF'
#!/bin/bash
apt update

# System utilities
apt install -y htop neofetch screen tmux curl wget build-essential

# Development tools
apt install -y gcc g++ make clang llvm

# Multimedia codecs
apt install -y ubuntu-restricted-extras

# Additional fonts
apt install -y fonts-powerline fonts-firacode

# Network tools
apt install -y net-tools nmap

# Archive tools
apt install -y p7zip-full p7zip-rar unrar

# Additional useful packages
apt install -y synaptic gparted
EOF

chmod +x /usr/local/bin/install-oag-packages.sh

# Run the package installer
/usr/local/bin/install-oag-packages.sh

print_success "Additional packages installed"

# =============================================================================
# 8. SYSTEM SERVICES
# =============================================================================

print_status "Configuring system services..."

# Enable essential services
systemctl enable ssh || true
systemctl enable NetworkManager || true
systemctl enable gdm3 || true

print_success "System services configured"

# =============================================================================
# 9. FINAL TOUCHES
# =============================================================================

print_status "Applying final touches..."

# Create desktop shortcut for profile selector
cat > /usr/share/applications/oag-profile-selector.desktop << 'EOF'
[Desktop Entry]
Name=OAG Profile Selector
Comment=Select your installation profile
Exec=/usr/local/share/oag-profiles/select-profile.sh
Icon=preferences-system
Terminal=true
Type=Application
Categories=System;
EOF

# Create welcome script for first boot
cat > /usr/local/bin/oag-first-run.sh << 'EOF'
#!/bin/bash
if [ ! -f /etc/oag-first-run-done ]; then
    echo "Welcome to OAG Linux!"
    echo "Running first-time setup..."
    
    # Set hostname based on profile
    /usr/local/bin/set-oag-hostname.sh
    
    # Set wallpaper if available
    /usr/local/bin/set-oag-wallpaper.sh
    
    # Mark as done
    touch /etc/oag-first-run-done
    
    echo "First-time setup complete!"
fi
EOF

chmod +x /usr/local/bin/oag-first-run.sh

# Add to startup (for GNOME)
mkdir -p /etc/skel/.config/autostart
cat > /etc/skel/.config/autostart/oag-first-run.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=OAG First Run Setup
Exec=/usr/local/bin/oag-first-run.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF

print_success "Final touches applied"

# =============================================================================
# 10. COMPLETION MESSAGE
# =============================================================================

echo ""
echo "╔══════════════════════════════════════╗"
echo "║    OAG Linux Customization Complete! ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "1. Run '/usr/local/share/oag-profiles/select-profile.sh' to select installation profile"
echo "2. Use 'gnome-tweaks' to customize appearance"
echo "3. Add your custom wallpaper to /usr/share/backgrounds/oag/"
echo "4. Test all features before creating final ISO"
echo ""
echo "Files created:"
echo "- /etc/oag-release (system info)"
echo "- /etc/update-motd.d/99-oag-welcome (welcome message)"
echo "- /usr/local/share/oag-profiles/ (profile system)"
echo "- /usr/local/bin/set-oag-hostname.sh (hostname setter)"
echo "- /usr/local/bin/set-oag-wallpaper.sh (wallpaper setter)"
echo ""
print_success "Customization process completed successfully!"

# End of script