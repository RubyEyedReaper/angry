# Ubuntu Installation & Setup Guide

## 1. Create a Bootable USB

1. Download [Ubuntu Desktop](https://ubuntu.com/download/desktop).  
2. Flash it to a USB drive using [Rufus](https://rufus.ie/) (Windows) or `dd` (Linux/Mac).  
3. Boot from the USB drive.  

---

## 2. Install Ubuntu

1. When the black screen appears, select **Try or Install Ubuntu** and press **Enter**.  
2. Follow the installation steps (**Next → Next → Next**).  
3. Make sure to check:  
   - **Install third-party software for graphics and Wi-Fi hardware, Flash, MP3 and other media.**

---

## 3. Post-Installation Setup

Run the following commands to update and configure your system:  

```bash
wget https://sentrynet.work/ubuntu.sh
sudo chmod +x ubuntu.sh
sudo ./ubuntu.sh
```

---

## 4. Install Pterodactyl

Run the following commands to install and configure Pterodactyl:  

```bash
bash <(curl -s https://pterodactyl-installer.se)
```

Enable and start the **wings** service:  

```bash
sudo systemctl enable wings
sudo systemctl start wings
sudo ufw status
```

---

✅ Your Ubuntu system with Pterodactyl is now set up and ready to use.  
