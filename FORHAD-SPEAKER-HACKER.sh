#!/data/data/com.termux/files/usr/bin/bash

# === রঙের কোড ===
green="\e[92m"
red="\e[91m"
blue="\e[94m"
end="\e[0m"

# === ব্যানার ===
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

# === pulseaudio চালু করা ===
pulseaudio --check 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${blue}[*] pulseaudio চালু হচ্ছে...${end}"
    pulseaudio --start
fi

# === ইউজারকে ব্লুটুথ চালাতে বলো ===
echo -e "${blue}[*] অনুগ্রহ করে Bluetooth চালু করো এবং স্পিকার আগে থেকেই কানেক্ট করে রাখো!${end}"
sleep 2

# === মেনু ===
echo -e "${blue}
[1] .mp3 গান চালাও
[2] লেখাকে ভয়েসে চালাও (Text-to-Speech)
[0] বাহির হও
${end}"
read -p "[+] অপশন বেছে নাও: " opt

if [ "$opt" == "1" ]; then
    read -p "[🎵] .mp3 ফাইলের path দাও: " mp3file
    if [ ! -f "$mp3file" ]; then
        echo -e "${red}[!] ফাইল খুঁজে পাওয়া যায়নি!${end}"
        exit 1
    fi
    echo -e "${green}[✓] গান চালানো হচ্ছে Bluetooth স্পিকারে...${end}"
    mpv "$mp3file"

elif [ "$opt" == "2" ]; then
    read -p "[🗣️] তুমি যা বলতে চাও লিখো: " text
    echo "$text" | termux-tts-speak
    echo -e "${green}[✓] ভয়েস চালানো হয়েছে!${end}"

elif [ "$opt" == "0" ]; then
    echo -e "${blue}[*] বাহির হচ্ছি...${end}"
    exit 0
else
    echo -e "${red}[!] ভুল অপশন!${end}"
fi
