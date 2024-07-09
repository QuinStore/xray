#!/bin/bash
clear

RED='\033[0;31m'
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
BGX="\033[42m"
blue='\e[34m'
Suffix="\033[0m"
REDBG="\033[41;37m"
z="\033[96m"

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
    echo -e "   1 IP Address :    8 USD"
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

echo -e " ${YELL}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE          Add Bot Notif              $NC"
echo -e " ${YELL}└──────────────────────────────────────────┘${NC}"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e " ${YELL} ───────────────────────────────────────────${NC}"
read -rp "  [*] Input your Bot Token : " -e bottoken 
read -rp "  [*] Input Your Id Telegram : " -e admin
echo -e " ${YELL} ───────────────────────────────────────────${NC}"
clear

if [ -z $bottoken ] || [ -z $admin ]; then
echo -e " Input Is Null ( Bottoken or ID tele ), Please try again"
add-bot-notif
else
echo "#bot# ${bottoken} ${admin}" >>/etc/bot/.bot.db
fi

clear
echo -e " ${YELL}┌──────────────────────────────────────────┐${NC}"
echo -e "               Success Add Bot Notif            $NC"
echo -e " ${YELL}└──────────────────────────────────────────┘${NC}"
echo "  Bot Token    : $bottoken"
echo "  ID Telegram  : $admin"
echo -e " ${YELL} ───────────────────────────────────────────${NC}"
read -n 1 -s -r -p "Press [ Enter ] to back menu"
menu