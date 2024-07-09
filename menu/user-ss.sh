#!/bin/bash
clear

RED="\033[31m"
Suffix="\033[0m"
REDBG="\033[41;37m"
NC='\e[0m'
Bold='\e[1m'
blue='\e[34m'
PURPLE='\e[35m'
ORANGE='\033[0;33m'
biru='\033[0;36m'
z='\033[96m'

PUB=$(cat /etc/slowdns/server.pub)
NS=$(cat /etc/xray/dns)
CITY=$(cat /etc/xray/city)
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/shadowsocks/.shadowsocks.db")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "${ORANGE} ┌──────────────────────────────────┐${NC}"
echo -e " ${biru}       Config SS Account        "
echo -e "${ORANGE} └──────────────────────────────────┘${NC}"
    echo ""
    echo "    You have no existing clients! "
    echo ""
    read -n 1 -s -r -p "Press [ Enter ] to back on menu vmess"
    m-ssws
fi

echo -e "${ORANGE} ┌──────────────────────────────────┐${NC}"
echo -e " ${biru}       Config SS Account        "
echo -e "${ORANGE} └──────────────────────────────────┘${NC}"
        echo "     No  Expired   User"
        grep -E "^### " "/etc/shadowsocks/.shadowsocks.db" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        echo -e ""
                        echo -e " Press ENTER to Back"
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        echo -e ""
                        echo -e " Press ENTER to Back"
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done

        if [ -z $CLIENT_NUMBER ]; then
            m-ssws
        fi

user=$(grep -E "^### " "/etc/shadowsocks/.shadowsocks.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
iplim=$(cat /etc/kyt/limit/shadowsocks/ip/$user)
Quota=$(cat /etc/shadowsocks/$user)
uuid=$(grep -E "^### " "/etc/shadowsocks/.shadowsocks.db" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
#Quota=$(grep -E "^### " "/etc/shadowsocks/.shadowsocks.db" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/shadowsocks/.shadowsocks.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`

#buat ss WEBSOCKET
sslinkws="ss://${shadowsocks_base64e}@${domain}:443?path=/ss-ws&security=tls&encryption=none&type=ws#${user}"
nonsslinkws="ss://${shadowsocks_base64e}@${domain}:80?path=/ss-ws&security=none&encryption=none&type=ws#${user}"

#buat ss GRPC
sslinkgrpc="ss://${shadowsocks_base64e}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
nonsslinkgrpc="ss://${shadowsocks_base64e}@${domain}:80?mode=gun&security=none&encryption=none&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
clear

echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e "   Xray/SS Account  "
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Remarks        : ${user}"
echo -e " Domain         : ${domain}"
#echo -e "Host XrayDNS   : ${NS}"
#echo -e "Pub Key        : ${PUB}"
echo -e " User Quota     : ${Quota} GB"
echo -e " Limit IP       : ${iplim}"
echo -e " Port TLS/Ws    : 443"
echo -e " Port NoneTLS   : 80,8880,8080"
echo -e " Port Grpc      : 443"
echo -e " Port OpenClash : 443"
echo -e " Port CDN TLS   : 400-900"
echo -e " Port CDN NoTLS : 400-900"
echo -e " Port CDN GRPC  : 443"
echo -e " Password       : ${uuid}"
echo -e " Cipers         : aes-128-gcm"
echo -e " Network        : ws/grpc"
echo -e " Path           : /ss-ws"
echo -e " ServiceName    : ss-grpc"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link WS TLS : ${sslinkws}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link WS None TLS : ${nonsslinkws}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link GRPC   : ${sslinkgrpc}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link CDN & OpenClash   : https://${domain}:81/sodosokws-$user.txt"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link Via Qris  :https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=${sslinkws}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Expired On  : ${exp}"
echo -e "${z} ──────────────────────────────${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu