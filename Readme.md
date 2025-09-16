\# 📖 OAG Linux - Custom Linux Distribution



<div align="center">

&nbsp; 

!\[OAG Linux](https://img.shields.io/badge/OAG-Linux%201.0-blue?style=for-the-badge\&logo=linux)

\[!\[Ubuntu](https://img.shields.io/badge/Based%20on-Ubuntu%2022.04%20LTS-orange?style=for-the-badge\&logo=ubuntu)](https://ubuntu.com)

\[!\[License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

\[!\[Build](https://img.shields.io/badge/Status-Ready%20to%20Build-success?style=for-the-badge)](https://github.com/yourusername/oag-linux)



</div>



\## 🎯 Overview



\*\*OAG Linux\*\* is a custom Linux distribution built from Ubuntu 22.04 LTS base, designed to provide a personalized Linux experience with multiple installation profiles and complete system customization.



\## ✨ Features



\### 🔧 \*\*Complete Customization\*\*

\- Custom system branding and hostname

\- Personalized welcome messages

\- Multiple icon themes (Papirus, Numix, etc.)

\- Custom desktop environments

\- System-wide theming support



\### 📦 \*\*Installation Profiles\*\*

\- \*\*📚 Education\*\*: Educational software and tools

\- \*\*💼 Professional\*\*: Office and development tools  

\- \*\*🖥️ Server\*\*: Web server and database tools

\- \*\*🎮 Gaming\*\*: Games and entertainment software

\- \*\*⚡ Minimal\*\*: Basic system only



\### 🎨 \*\*Visual Customization\*\*

\- Custom MOTD (Message of the Day)

\- Multiple icon themes

\- Custom wallpaper support

\- GNOME desktop environment customization

\- Dark/Light theme options



\## 🚀 Quick Start



\### Prerequisites

\- Ubuntu 22.04 LTS base ISO

\- Cubic (Custom Ubuntu ISO Creator)

\- Basic Linux knowledge

\- Sudo/root access



\### Installation Steps



1\. \*\*Download the customization script:\*\*

&nbsp;  ```bash

&nbsp;  wget https://raw.githubusercontent.com/yourusername/oag-linux/main/oag-linux-customization-complete.sh

&nbsp;  ```



2\. \*\*Make it executable:\*\*

&nbsp;  ```bash

&nbsp;  chmod +x oag-linux-customization-complete.sh

&nbsp;  ```



3\. \*\*Run with sudo:\*\*

&nbsp;  ```bash

&nbsp;  sudo ./oag-linux-customization-complete.sh

&nbsp;  ```



4\. \*\*Select your installation profile:\*\*

&nbsp;  ```bash

&nbsp;  sudo /usr/local/share/oag-profiles/select-profile.sh

&nbsp;  ```



\## 📋 System Requirements



| Component | Minimum | Recommended |

|-----------|---------|-------------|

| \*\*RAM\*\* | 2 GB | 4 GB+ |

| \*\*Storage\*\* | 25 GB | 50 GB+ |

| \*\*Processor\*\* | Dual-core | Quad-core+ |

| \*\*Graphics\*\* | Any | Dedicated GPU (for Gaming profile) |



\## 🏗️ Project Structure



```

OAG-Linux/

├── 📁 iso/

│   └── ubuntu-22.04.5-desktop-amd64.iso

├── 📁 build/

│   └── \[Cubic project files]

├── 📁 scripts/

│   ├── oag-linux-customization-complete.sh

│   └── install-oag-packages.sh

├── 📁 profiles/

│   ├── education/

│   ├── professional/

│   ├── server/

│   ├── gaming/

│   └── minimal/

├── 📁 themes/

│   ├── oag-theme/

│   └── oag-icons/

├── 📁 config/

│   ├── oag-release

│   ├── hostname

│   └── motd

└── 📁 docs/

&nbsp;   ├── README.md

&nbsp;   └── LICENSE

```



\## 🔧 Customization Options



\### System Branding

\- Custom release information

\- Distribution details

\- System hostname

\- Welcome messages



\### Installation Profiles

Each profile includes carefully selected software packages:



\#### 📚 Education Profile

```

✅ LibreOffice Suite

✅ GeoGebra (Mathematics)

✅ GCompris (Educational games)

✅ TuxPaint (Drawing)

✅ Scratch (Programming)

✅ Ardour (Audio editing)

✅ Audacity (Audio recording)

✅ Calibre (E-book management)

```



\#### 💼 Professional Profile

```

✅ LibreOffice Suite

✅ Thunderbird (Email)

✅ Firefox \& Chromium

✅ VS Code (Editor)

✅ Git (Version control)

✅ GIMP (Image editing)

✅ Inkscape (Vector graphics)

✅ VLC (Media player)

✅ OBS Studio (Screen recording)

```



\#### 🖥️ Server Profile

```

✅ Apache2 (Web server)

✅ MySQL (Database)

✅ PHP (Server scripting)

✅ Nginx (Web server)

✅ Docker (Containerization)

✅ OpenSSH (Remote access)

✅ BIND9 (DNS server)

✅ vsftpd (FTP server)

```



\#### 🎮 Gaming Profile

```

✅ Steam (Gaming platform)

✅ PlayOnLinux (Windows games)

✅ Lutris (Game manager)

✅ Wine (Windows compatibility)

✅ DOSBox (DOS emulation)

✅ Minecraft Launcher

✅ Discord (Communication)

```



\## 🛠️ Building Custom ISO



\### Using Cubic (Recommended)



1\. \*\*Install Cubic:\*\*

&nbsp;  ```bash

&nbsp;  sudo add-apt-repository ppa:cubic-wizard/release

&nbsp;  sudo apt update

&nbsp;  sudo apt install cubic

&nbsp;  ```



2\. \*\*Launch Cubic:\*\*

&nbsp;  ```bash

&nbsp;  cubic

&nbsp;  ```



3\. \*\*Follow the wizard:\*\*

&nbsp;  - Select project directory

&nbsp;  - Choose base Ubuntu ISO

&nbsp;  - Fill project information

&nbsp;  - Select packages

&nbsp;  - Generate ISO



\### Manual Build Process



1\. \*\*Prepare environment:\*\*

&nbsp;  ```bash

&nbsp;  mkdir -p ~/OAG-Linux/{iso,build,scripts}

&nbsp;  cd ~/OAG-Linux

&nbsp;  ```



2\. \*\*Download Ubuntu ISO:\*\*

&nbsp;  ```bash

&nbsp;  wget https://releases.ubuntu.com/22.04/ubuntu-22.04.5-desktop-amd64.iso

&nbsp;  ```



3\. \*\*Run customization:\*\*

&nbsp;  ```bash

&nbsp;  sudo ./oag-linux-customization-complete.sh

&nbsp;  ```



\## 🔍 Testing



\### Virtual Testing

```bash

\# Install VirtualBox

sudo apt install virtualbox



\# Create new virtual machine

\# Select OAG-Linux ISO as boot media

\# Test all profiles

```



\### Hardware Testing

```bash

\# Create bootable USB

\# Use Rufus (Windows) or dd (Linux)

\# Boot from USB and test

```



\## 📊 Performance



| Profile | Boot Time | RAM Usage | Disk Usage |

|---------|-----------|-----------|------------|

| Minimal | ~30s | ~500MB | ~8GB |

| Education | ~35s | ~800MB | ~12GB |

| Professional | ~40s | ~1GB | ~15GB |

| Server | ~35s | ~600MB | ~10GB |

| Gaming | ~45s | ~1.2GB | ~20GB+ |



\## 🤝 Contributing



We welcome contributions! Please see our \[Contributing Guide](CONTRIBUTING.md) for details.



\### Ways to Contribute

\- 🐛 Report bugs

\- 💡 Suggest new features

\- 📝 Improve documentation

\- 🔧 Submit pull requests

\- 🎨 Create new themes



\## 📄 License



This project is licensed under the MIT License - see the \[LICENSE](LICENSE) file for details.



\## 🙏 Acknowledgments



\- \*\*Ubuntu Team\*\* - For the excellent base system

\- \*\*Papirus Development Team\*\* - For beautiful icon themes

\- \*\*Cubic Team\*\* - For the amazing ISO creation tool

\- \*\*Open Source Community\*\* - For all the wonderful software



\## 📞 Support



\### 📧 Email

\- support@oag-linux.com



\### 💬 Community

\- \[Discord Server](https://discord.gg/oag-linux)

\- \[Reddit Community](https://reddit.com/r/oaglinux)



\### 📚 Documentation

\- \[Wiki](https://github.com/yourusername/oag-linux/wiki)

\- \[FAQ](https://github.com/yourusername/oag-linux/wiki/FAQ)

\- \[Troubleshooting](https://github.com/yourusername/oag-linux/wiki/Troubleshooting)



\## 🔗 Quick Links



| Resource | Link |

|----------|------|

| \*\*Main Script\*\* | \[oag-linux-customization-complete.sh](oag-linux-customization-complete.sh) |

| \*\*Releases\*\* | \[Releases Page](https://github.com/yourusername/oag-linux/releases) |

| \*\*Issues\*\* | \[Issue Tracker](https://github.com/yourusername/oag-linux/issues) |

| \*\*Discussions\*\* | \[Discussions](https://github.com/yourusername/oag-linux/discussions) |

| \*\*Wiki\*\* | \[Documentation](https://github.com/yourusername/oag-linux/wiki) |



---



<div align="center">

&nbsp; 

⭐ \*\*If you like this project, please give it a star!\*\*



💝 \*\*Built with love by the OAG Linux Team\*\*



</div>

