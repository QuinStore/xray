#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
z="\033[96m"
biru="\033[0;36m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
clear
# Getting
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/QuinStore/reseller/main/izin"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/andiowl"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282217067357"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    sleep 5
    reboot
  fi
}
checking_sc

#set bot notif
if [ ! -e /etc/active ]; then
    mkdir -p /etc/active
fi

if [ ! -e /etc/active/4-trojan ]; then
    sts="${RED}${Bold}OFF${NC}"
else
    sts="${Green}${Bold}ON${NC}"
fi

function statusbotofftrojan(){
    clear
    if [ $sts = "OFF" ]; then
        echo -e " ${RED} Status Bot Off, Please On Bot First${NC}"
    fi

    start_spinner " Please wait, Process...."
    sleep 2
    rm -rf /etc/active/4-trojan
    stop_spinner
    echo -e " ${Green} Sucess OFF Bot Notif SSH ${NC}"
}

function statusbotontrojan(){
    clear
    if [ $sts = "ON" ]; then
        echo -e " ${ORANGE} Status Bot Is ON${NC}"
    fi

    start_spinner " Please wait, Process...."
    sleep 2
    touch /etc/active/4-trojan
    stop_spinner
    echo -e " ${Green} Sucess ON Bot Notif SSH ${NC}"
}

ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
source /usr/local/sbin/changelimit
echo -e "\e[32mloading...\e[0m"
clear
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE           MENU TROJAN              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE}  [01].${NC}${biru} Create Account XRAY Trojan WS/GRPC${NC}"
echo -e "  ${ORANGE}  [02].${NC}${biru} Create Trial XRAY Trojan WS/GRPC${NC}"
echo -e "  ${ORANGE}  [03].${NC}${biru} Delete Account XRAY Trojan WS/GRPC${NC}"
echo -e "  ${ORANGE}  [04].${NC}${biru} Renew Trojan Account${NC}"
echo -e "  ${ORANGE}  [05].${NC}${biru} Check Trojan login Account${NC}"
echo -e "  ${ORANGE}  [06].${NC}${biru} Check Config Trojan  Account${NC}"
echo -e "  ${ORANGE}  [07].${NC}${biru} Restore Trojan Account${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE           LIMIT TROJAN              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE}  [08].${NC}${biru} Change Limit IP${NC}"
echo -e "  ${ORANGE}  [09].${NC}${biru} Change Limit Quota${NC}"
echo -e "  ${ORANGE}  [10].${NC}${biru} Reset Usage Quota Acount${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e " $PURPLE                Set Bot Notif           $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "   STATUS BOT NOTIF : [ $sts ]"
echo -e "  ${ORANGE} [11].${NC}${biru} On Bot Notif${NC}"
echo -e "  ${ORANGE} [12].${NC}${biru} Off Bot Notif${NC}"
echo -e ""
echo -e "  ${RED}  [00].${NC}${RED} Back to Menu${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "     ACCOUNT : ${ORANGE}[ ${trb} ]${NC}   Usage : ${ORANGE}[ ${ttoday} ]${NC} "
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
read -p "Select From Options [ 1 - 10 ] : " menu

if [ -z $menu ]; then
    menu
else
    case $menu in
    01 | 1)
        clear
        addtr
        ;;
    02 | 2)
        clear
        trialtr
        ;;
    03 | 3)
        clear
        deltr
        ;;
    04 | 4)
        clear
        renewtr
        ;;
    05 | 5)
        cektr
        ;;
    06 | 6)
        clear
        user-tr
        ;;
    07 | 7)
        clear
        restoretrojan
        ;;
    08 | 8)
        clear
        changeiplimittrojan
        ;;
    09 | 9)
        clear
        changelimitquotatrojan
        ;;
    10)
        clear
        resetquotatrojan
        ;;
    11)
        statusbotontrojan
        m-trojan
        ;;
    12)
        statusbotofftrojan
        m-trojan
        ;;
    00 | 0)
        clear
        menu
        ;;
    *)
        clear
        menu
        ;;
    esac
fi