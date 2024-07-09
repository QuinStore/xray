#!/bin/bash
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
Bold='\e[1m'
biru="\033[0;36m"

CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
function notif_restore() {
    sleep 2
    TIME="10"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    TEXT="Restore Data
<code>━━━━━━━━━━━━━━━━</code>
<b>  RESTORE NOTIF </b>
<b>     Detail Restore VPS</b>
<code>━━━━━━━━━━━━━━━━</code>
<code>Restore Vps Done</code>
<code>━━━━━━━━━━━━━━━━</code>
<code>BY BOT : @sdctunneling_bot</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
# ==========================================
# Getting
source /usr/local/sbin/spiner
clear
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}Restore Data${NC}           "
echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE}If You Chose 1, make sure file backup upload in dir /root${NC}"
echo -e "  ${ORANGE}and Rename file : backup.zip${NC}"
echo -e ""
echo -e "  ${ORANGE}  [01].${NC}${biru} Restore From File${NC}"
echo -e "  ${ORANGE}  [02].${NC}${biru} Restore From Link${NC}"
echo -e ""
echo -e "  ${RED}  [00].${NC}${RED} Back to Menu ${NC}"
echo -e ""
read -r "    Select from Option [ 1-2 ] : " res
case $res in
    1 | 01)
    cd /root
    start_spinner " Please wait, Process Restore...."
    unzip backup.zip
    rm -f backup.zip
    sleep 1
    echo Start Restore
    cd /root/backup
    cp passwd /etc/
    cp group /etc/
    cp shadow /etc/
    cp gshadow /etc/
    cp -r kyt /var/lib/
    cp -r xray /etc/
    cp -r vmess /etc/
    cp -r vless /etc/
    cp -r trojan /etc/
    cp -r shadowsocks /etc/
    cp -r /ip/vmess /etc/kyt/limit/vmess/ip/
    cp -r /ip/vless /etc/kyt/limit/vless/ip/
    cp -r /ip/trojan /etc/kyt/limit/trojan/ip/
    cp -r /ip/shadowsocks /etc/kyt/limit/shadowsocks/ip/
    cp -r /ip/ssh /etc/kyt/limit/ssh/ip/
    cp -r html /var/www/
    cp -r cron.d /etc/
    cp crontab /etc/

    notif_restore
    rm -rf /root/backup
    rm -f backup.zip
    stop_spinner
    echo -e " ${Green} Sucess Restored Data ${NC}"
    ;;
2 | 02)
    clear
    echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
    echo -e "         ${biru}Link Backup Data${NC}           "
    echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
    echo -e ""
    read -rp "    Link File: " -e url
    start_spinner " Please wait, Process Restore...."
    wget -O backup.zip "$url"
    unzip backup.zip
    rm -f backup.zip
    sleep 2
    echo Start Restore
    cd /root/backup
    cp passwd /etc/
    cp group /etc/
    cp shadow /etc/
    cp gshadow /etc/
    cp -r kyt /var/lib/
    cp -r xray /etc/
    cp -r vmess /etc/
    cp -r vless /etc/
    cp -r trojan /etc/
    cp -r shadowsocks /etc/
    cp -r /ip/vmess /etc/kyt/limit/vmess/ip/
    cp -r /ip/vless /etc/kyt/limit/vless/ip/
    cp -r /ip/trojan /etc/kyt/limit/trojan/ip/
    cp -r /ip/shadowsocks /etc/kyt/limit/shadowsocks/ip/
    cp -r /ip/ssh /etc/kyt/limit/ssh/ip/
    cp -r html /var/www/
    cp -r cron.d /etc/
    cp crontab /etc/

    notif_restore
    rm -rf /root/backup
    rm -f backup.zip
    stop_spinner
    echo -e " ${Green} Sucess Restored Data ${NC}"
    ;;
0 | 00)
    clear
    menu
    ;;
*)
    clear
    menu
    ;;
esac