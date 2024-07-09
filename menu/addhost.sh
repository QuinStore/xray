#!/bin/bash

Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
blue='\e[34m'
Suffix="\033[0m"
REDBG="\033[41;37m"
z="\033[96m"
blue='\e[34m'

clear
# Valid Script
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
echo -e "\e[32mloading...\e[0m"
clear
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

clear

function pasang_domain() {
    echo -e "Sebelum Ganti Domain Harap Pointing Dulu Ip Vps Kalian"
    green "Ganti Domain"
    sleep 1
    read -rp "Input ur domain : " -e pp
    if [ -z $pp ]; then
        echo -e "
        Tidak ada domain yang di input"
    else
    echo "$pp" > /etc/xray/domain
    echo $pp > /root/domain
        echo "IP=$pp" > /var/lib/kyt/ipvps.conf
    fi
}


function pasang_ssl() {
    green "Pasang SSL"
    sleep 1
    rm -rf /etc/xray/xray.key
    rm -rf /etc/xray/xray.crt
    domain=$(cat /etc/xray/domain)
    STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
    rm -rf /root/.acme.sh
    mkdir /root/.acme.sh
    systemctl stop $STOPWEBSERVER
    systemctl stop nginx
    systemctl stop haproxy
    curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
    chmod +x /root/.acme.sh/acme.sh
    /root/.acme.sh/acme.sh --upgrade --auto-upgrade
    /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
    /root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
    ~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
    chmod 777 /etc/xray/xray.key
    systemctl restart nginx
    systemctl restart xray
    systemctl restart haproxy
}
function notif_addhost() {
    green "Notif AddHost Tele"
    sleep 2
    CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
    KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
    versiedition=$(cat /root/versi/version)
    TIME="10"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    TEXT="Installasi VPN Script $versiedition
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<b>   **⚡ ADDHOST NOTIF ⚡**</b>
<b>     Add Domain New</b>
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<b>IP VPS  :</b> <code>$MYIP </code>
<b>DOMAIN :</b> <code>$pp</code>
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<code>NEW ADD DOMAIN</code>
<code>BY BOT : @sdctunneling_bot</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
pasang_domain
pasang_ssl
notif_addhost

echo ""
green "Back to menu in 2 sec ${NC}"
sleep 2
menu