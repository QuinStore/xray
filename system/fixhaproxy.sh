#!/bin/bash
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
yellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

MYIP=$(wget -qO- ipinfo.io/ip);
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear

domain=$(cat /etc/xray/domain)

function notif_haproxystatus() {
    versi=$(cat /root/versi/version)
    sleep 2
    TEXT="Satus Service VPN Script V$versi R[Longterm]
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️STATUS SERVICE NOTIF⚠️</b>
<b>     domain: $domain</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>FIXED HAPROXY SUCCESS</code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>BY BOT : @sdctunneling_bot</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

function notif_haproxyrunning() {
    versi=$(cat /root/versi/version)
    sleep 2
    TEXT="Satus Service VPN Script V$versi R[Longterm]
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️STATUS SERVICE NOTIF⚠️</b>
<b>     domain: $domain</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>HAPROXY : 🟢 RUNNING</code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>BY BOT : @sdctunneling_bot</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

function pasang_ssl() {
    green "Renew Cert SSL"
    sleep 2
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

    rm -fr /etc/haproxy/hap.pem
    cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem
}

function haproxystatus(){
    haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

    # STATUS SERVICE HAPROXY
    if [[ $haproxy_service == "running" ]]; then 
        notif_haproxyrunning
    else
        green "FIXING HAPROXY ERROR PLEASE WAIT"
        sleep 2

        STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
        systemctl stop $STOPWEBSERVER
        systemctl stop nginx
        systemctl stop haproxy

        rm -rf /etc/xray/xray.key
        rm -rf /etc/xray/xray.crt

        cp /root/backuppanel/xray.crt /etc/xray/xray.crt
        cp /root/backuppanel/xray.key /etc/xray/xray.key

        chmod 777 /etc/xray/xray.key

        rm -fr /etc/haproxy/hap.pem
        cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem
        clear

        systemctl daemon-reload
        systemctl restart nginx
        systemctl restart xray
        systemctl restart haproxy

    fi
}

function fix(){
    green "proses"
    sleep 2

    file_path="/etc/xray/xray.crt"

    if [ -s "$file_path" ]; then
        if [ ! -e /root/backuppanel ]; then
            mkdir -p /root/backuppanel
            cp /etc/xray/xray.key /root/backuppanel/xray.key
            cp /etc/xray/xray.crt /root/backuppanel/xray.crt
        fi
        haproxystatus
    else
        pasang_ssl

        rm -fr /etc/haproxy/hap.pem
        cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem

        systemctl restart nginx
        systemctl restart xray
        systemctl restart haproxy

        notif_haproxystatus
    fi
}
fix