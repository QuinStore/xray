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
red='\e[1;31m'
green='\e[0;32m'
z="\033[96m"
NC='\033[0m'
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
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
Suffix="\033[0m"
grenbo="\e[92;1m"
biru='\033[0;36m'


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
    echo -e "${z}────────────────────────────────────────────${NC}"
    echo -e "${REDBG}          EXPIRED AUTOSCRIPT          ${NC}"
    echo -e "${z}────────────────────────────────────────────${NC}"
    echo -e ""
    echo -e " ${RED}IP Address access is not allowed${Suffix}"
    echo -e ""
    echo -e " Price For 1 Month"
    echo -e ""
    echo -e "   1 IP Address :    3 USD"
    echo -e "   5 IP Address :   13 USD"
    echo -e "  10 IP Address :   25 USD"
    echo -e ""
    echo -e " Price For 1 Year"
    echo -e ""
    echo -e "   1 IP Address :    6 USD"
    echo -e "   5 IP Address :   25 USD"
    echo -e "  10 IP Address :   50 USD"
    echo -e ""
    echo -e " Purchases in USD can use Paypal or Binance Crypto"
    echo -e ""
    echo -e " If you live in Indonesia"
    echo -e ""
    echo -e "   1 IP Address : 15K"
    echo -e ""
    echo -e " ${blue}Instagram : @_andi64                   ${NC}"
    echo -e " ${blue}Whatsapp  : +6282217067357             ${NC}"
    echo -e " ${blue}Telegram  : @andiowl                   ${NC}"
    echo -e " ${blue}Channel   : @sdctunel                  ${NC}"
    exit 0
    echo -e "${z}────────────────────────────────────────────${NC}"
    sleep 5
    reboot
  fi
}
checking_sc
source /usr/local/sbin/changelimit

#set bot notif
if [ ! -e /etc/active ]; then
    mkdir -p /etc/active
fi

if [ ! -e /etc/active/2-vmess ]; then
    sts="${RED}${Bold}OFF${NC}"
else
    sts="${Green}${Bold}ON${NC}"
fi

function statusbotoffvmess(){
    clear
    if [ $sts = "OFF" ]; then
        echo -e " ${RED} Status Bot Off, Please On Bot First${NC}"
    fi

    start_spinner " Please wait, Process...."
    sleep 2
    rm -rf /etc/active/2-vmess
    stop_spinner
    echo -e " ${Green} Sucess OFF Bot Notif SSH ${NC}"
}

function statusbotonvmess(){
    clear
    if [ $sts = "ON" ]; then
        echo -e " ${ORANGE} Status Bot Is ON${NC}"
    fi

    start_spinner " Please wait, Process...."
    sleep 2
    touch /etc/active/2-vmess
    stop_spinner
    echo -e " ${Green} Sucess ON Bot Notif SSH ${NC}"
}

vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"

echo -e "\e[32mloading...\e[0m"
clear
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE           MENU VMESS              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE} [01].${NC}${biru} Creating Vmess Account WS/GRPC${NC}"
echo -e "  ${ORANGE} [02].${NC}${biru} Creating Trial Vmess Account WS/GRPC${NC}"
echo -e "  ${ORANGE} [03].${NC}${biru} Delete Vmess Account WS/GRPC${NC}"
echo -e "  ${ORANGE} [04].${NC}${biru} Renew Vmess Account${NC}"
echo -e "  ${ORANGE} [05].${NC}${biru} Check Vmess login Account${NC}"
echo -e "  ${ORANGE} [06].${NC}${biru} Check Config Vmess Account${NC}"
echo -e "  ${ORANGE} [07].${NC}${biru} Restore Vmess Account${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE           LIMIT VMESS              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE} [08].${NC}${biru} Change Limit IP${NC}"
echo -e "  ${ORANGE} [09].${NC}${biru} Change Limit Quota${NC}"
echo -e "  ${ORANGE} [10].${NC}${biru} Reset Usage Quota Acount${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e " $PURPLE                Set Bot Notif           $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "   STATUS BOT NOTIF : [ $sts ]"
echo -e "  ${ORANGE} [11].${NC}${biru} On Bot Notif${NC}"
echo -e "  ${ORANGE} [12].${NC}${biru} Off Bot Notif${NC}"
echo -e ""
echo -e "  ${ORANGE} [00].${NC}${RED} Back To Menu${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "     ACCOUNT : ${ORANGE}[ ${vma} ]${NC}   Usage : ${ORANGE}[ ${ttoday} ]${NC} "
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
read -p "Select From Options [ 1 - 10 ] : " menu
case $menu in
    1)  
        clear
        addws
        ;;
    2)
        clear
        trialws
        ;;
    3)
        clear
        delws
        ;;
    4)
        clear
        renewws
        ;;
    5) 
        clear
        cekws
        ;;
    6)
        clear
        user-ws
        ;;
    7)
        clear
        restorevmess
        ;;
    8)
        Clear
        changeiplimitvmess
        ;;
    9)
        clear
        changelimitquotavmess
        ;;
    10)
        clear
        resetquotavmess
        ;;
    11)
        statusbotonvmess
        m-vmess
        ;;
    12)
        statusbotoffvmess
        m-vmess
        ;;
    0)
        clear
        menu
        ;;
    *) 
        clear
        menu
        ;;
esac