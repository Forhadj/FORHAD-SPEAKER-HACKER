#!/data/data/com.termux/files/usr/bin/bash

# === Colors ===
green="\e[92m"
red="\e[91m"
blue="\e[94m"
end="\e[0m"

# === Banner ===
clear
echo -e "${green}
███████╗ ██████╗ ██████╗ ██╗  ██╗ █████╗ ██████╗ 
██╔════╝██╔═══██╗██╔══██╗██║ ██╔╝██╔══██╗██╔══██╗
███████╗██║   ██║██████╔╝█████╔╝ ███████║██████╔╝
╚════██║██║   ██║██╔═══╝ ██╔═██╗ ██╔══██║██╔═══╝ 
███████║╚██████╔╝██║     ██║  ██╗██║  ██║██║     
╚══════╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     
    🔊 FORHAD-SPEAKER-HACKER PRO 🔊
${end}"

# === Start pulseaudio if not running ===
pulseaudio --check 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${blue}[*] Starting pulseaudio...${end}"
    pulseaudio --start
fi

# === Tell user to turn on Bluetooth and connect speaker ===
echo -e "${blue}[*] Please make sure Bluetooth is ON and your speaker is connected!${end}"
sleep 2

# === Menu ===
echo -e "${blue}
[1] Play an .mp3 file
[2] Speak typed text (Text-to-Speech)
[0] Exit
${end}"
read -p "[+] Choose an option: " opt

if [ "$opt" == "1" ]; then
    read -p "[🎵] Enter the path to your .mp3 file: " mp3file
    if [ ! -f "$mp3file" ]; then
        echo -e "${red}[!] File not found!${end}"
        exit 1
    fi
    echo -e "${green}[✓] Playing on Bluetooth speaker...${end}"
    mpv "$mp3file"

elif [ "$opt" == "2" ]; then
    read -p "[🗣️] Enter text to speak: " text
    # Using espeak for TTS
    espeak "$text"
    echo -e "${green}[✓] Text spoken!${end}"

elif [ "$opt" == "0" ]; then
    echo -e "${blue}[*] Exiting...${end}"
    exit 0
else
    echo -e "${red}[!] Invalid option!${end}"
fi
