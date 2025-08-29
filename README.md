# 🌐 NetShifter — Make Your Network the Squad Captain 👑

Ever feel like macOS is drunk and picks the wrong internet connection as your “main character”?  
Same. That’s why we made **NetShifter**:  
A script that lets YOU decide who the squad captain is — Wi-Fi, LAN, or VPN. 🚀

---

## 🧑‍💻 Author
[created by @rianzessh](https://github.com/rahmatrians)

please fork this repo if you want to modify by urself

---

## ✨ Features
- Promote any network service to the **top of the lineup** 🔝  
- Squad lineup printed out (with emojis, duh) 🎭  
- Works with **Automator + Shortcut keys** 🎹  
- No more dragging stuff around like it’s 2009 🧓  

---

## ⚡ Quick Start

### 1. Clone & Install
```bash
git clone https://github.com/rahmatrians/netshifter.git
cd netshifter
chmod +x netshifter.sh
```

### 2. Run It (Manual Mode)
Pick your champ (example: Wi-Fi):

```bash
./netshifter.sh "Wi-Fi"
```

🎬 Example output:
```
🚀 NetShifter activated: promoting 'Wi-Fi' to squad captain 👑
✨ Fresh squad lineup locked in:
   1. Wi-Fi 🔥 (captain)
   2. USB 10/100 LAN
   3. Thunderbolt Bridge
   4. VPN
💯 Stay winning with Wi-Fi leading the squad.
```

⚠️ **Pro tip**:  
- If the service name has spaces → use quotes `"USB 10/100 LAN"`  
- If you mess up spelling → the script will roast you and list available services.  

---

### 3. Kill the Password Prompt 🔪
macOS loves asking “password plz” every time. We don’t. So run:

```bash
sudo visudo
```

Scroll to the bottom and add this line (replace `yourusername` with your Mac login):

```bash
yourusername ALL=(ALL) NOPASSWD: /usr/sbin/networksetup -ordernetworkservices *
```

Save → exit. Done.  
Now macOS won’t nag you like a clingy ex. 😌  

---

### 4. Automator + Keyboard Shortcut 🎹
Typing is mid. Let’s assign hotkeys.

1. Open **Automator.app**  
2. File → New → Quick Action  
3. Add **Run Shell Script** with:
   ```bash
   ~/netshifter.sh "Wi-Fi"
   ```
4. Add an Alert Notification:
   ```
   Wi-Fi just got crowned 👑
   ```
5. Save → name it `Wi-Fi Captain`  
6. Go to **System Settings → Keyboard → Shortcuts → Services**  
7. Assign a shortcut like `⌘ + ⌥ + W`  

Now → Smash the shortcut → Wi-Fi takes the throne instantly with a popup. 🎉  

---

## 🎮 Cheat Codes (Usage Guide)
👑 Crown Wi-Fi:
```bash
./netshifter.sh "Wi-Fi"
```

🕹️ LAN takes over:
```bash
./netshifter.sh "USB 10/100 LAN"
```

🥷 VPN mode:
```bash
./netshifter.sh "VPN"
```

Or just build multiple Automator shortcuts → switch squads like you’re playing Pokémon. ⚡  

---

## 🤳 Demo Vibes
*(Insert your GIF of terminal + popup here for max GitHub flex.)*  

---

## 💡 Pro Tips
- You can make one hotkey per service. Switching is then faster than your ping.  
- Works on macOS, doesn’t care if you’re on Starbucks Wi-Fi ☕ (but still, good luck gaming).  

---

## 🏆 Credits
Built out of pure rage against dragging service orders in System Preferences.  
If Apple ever sells this as “iNetCaptain Pro” for $29.99/month, remember: you saw it here first. 🫡  

---

## 📜 License
MIT License — free to use, fork, and meme.  
Just don’t resell it as “NetShifter Ultra 3000™”.  
