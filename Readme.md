# 📖 OAG Linux - Custom Linux Distribution

<div align="center">

![OAG Linux](https://img.shields.io/badge/OAG-Linux%201.0-blue?style=for-the-badge&logo=linux)
[![Ubuntu](https://img.shields.io/badge/Based%20on-Ubuntu%2022.04%20LTS-orange?style=for-the-badge&logo=ubuntu)](https://ubuntu.com)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Build](https://img.shields.io/badge/Status-Ready%20to%20Build-success?style=for-the-badge)](https://github.com/yourusername/oag-linux)

</div>

---

## 🎯 Overview

**OAG Linux** is a custom Linux distribution built on Ubuntu 22.04 LTS, designed to provide a personalized Linux experience with multiple installation profiles and complete system customization.

---

## ✨ Features

### 🔧 Complete Customization

- Custom system branding and hostname  
- Personalized welcome messages  
- Multiple icon themes (Papirus, Numix, etc.)  
- Custom desktop environments  
- System-wide theming support  

### 📦 Installation Profiles

- **📚 Education**: Educational software and tools  
- **💼 Professional**: Office and development tools  
- **🖥️ Server**: Web server and database tools  
- **🎮 Gaming**: Games and entertainment software  
- **⚡ Minimal**: Basic system only  

### 🎨 Visual Customization

- Custom MOTD (Message of the Day)  
- Multiple icon themes  
- Custom wallpaper support  
- GNOME desktop environment customization  
- Dark/Light theme options  

---

## 🚀 Quick Start

### Prerequisites

- Ubuntu 22.04 LTS base ISO  
- Cubic (Custom Ubuntu ISO Creator)  
- Basic Linux knowledge  
- Sudo/root access  

### Installation Steps

1. **Download the customization script:**

   ```bash
   wget https://raw.githubusercontent.com/yourusername/oag-linux/main/oag-linux-customization-complete.sh
   
2. **Make it executable:**
   ```bash 
   chmod +x oag-linux-customization-complete.sh

3. **Run with sudo:**
   ```bash
   sudo ./oag-linux-customization-complete.sh
   
4. **Select your installation profile:**
   ```bash
   sudo /usr/local/share/oag-profiles/select-profile.sh

##📋 System Requirements
      | Component     | Minimum   | Recommended            |
      | ------------- | --------- | ---------------------- |
      | **RAM**       | 2 GB      | 4 GB+                  |
      | **Storage**   | 25 GB     | 50 GB+                 |
      | **Processor** | Dual-core | Quad-core+             |
      | **Graphics**  | Any       | Dedicated GPU (Gaming) |

##🏗️ Project Structure
   OAG-Linux/
├── iso/
│   └── ubuntu-22.04.5-desktop-amd64.iso
├── build/
│   └── [Cubic project files]
├── scripts/
│   ├── oag-linux-customization-complete.sh
│   └── install-oag-packages.sh
├── profiles/
│   ├── education/
│   ├── professional/
│   ├── server/
│   ├── gaming/
│   └── minimal/
├── themes/
│   ├── oag-theme/
│   └── oag-icons/
├── config/
│   ├── oag-release
│   ├── hostname
│   └── motd
└── docs/
    ├── README.md
    └── LICENSE

##🔧 Customization Options
**System Branding**

. Custom release information
. Distribution details
. System hostname
. Welcome messages

**Installation Profiles**
Each profile includes carefully selected software packages:

##📚 Education Profile
✅ LibreOffice Suite  
✅ GeoGebra (Mathematics)  
✅ GCompris (Educational games)  
✅ TuxPaint (Drawing)  
✅ Scratch (Programming)  
✅ Ardour (Audio editing)  
✅ Audacity (Audio recording)  
✅ Calibre (E-book management)  
