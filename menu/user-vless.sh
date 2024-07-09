#!/bin/bash
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

clear
PUB=$(cat /etc/slowdns/server.pub)
NS=$(cat /etc/xray/dns)
CITY=$(cat /etc/xray/city)
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "${ORANGE} ┌──────────────────────────────────┐${NC}"
echo -e " ${biru}       Config Vless Account        "
echo -e "${ORANGE} └──────────────────────────────────┘${NC}"
    echo ""
    echo "    You have no existing clients! "
    echo ""
    read -n 1 -s -r -p "Press [ Enter ] to back on menu vmess"
    m-vless
fi

echo -e "${ORANGE} ┌──────────────────────────────────┐${NC}"
echo -e " ${biru}       Config Vless Account        "
echo -e "${ORANGE} └──────────────────────────────────┘${NC}"
        echo "     No  Expired   User"
        grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
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
            m-vless
        fi
        
user=$(grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
iplim=$(cat /etc/kyt/limit/vless/ip/$user)
Quota=$(cat /etc/vless/$user)
uuid=$(grep -E "^### " "/etc/vless/.vless.db" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
Quota=$(grep -E "^### " "/etc/vless/.vless.db" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"

clear
echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e "   Xray/Vless Account  "
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Remarks            : ${user}"
echo -e " Domain             : ${domain}"
#echo -e " Host XrayDNS       : ${NS}"
#echo -e " Pub Key            : ${PUB}"
echo -e " User Quota         : ${Quota} GB"
echo -e " Limit IP           : ${iplim} IP"
echo -e " port TLS           : 443"
echo -e " Port NTLS          : 80, 8080, 8081-9999"
echo -e " port Grpc          : 443"
echo -e " port OpenClash TLS : 443"
echo -e " port OpenClash NTLS: 80, 8080, 8081-9999"
echo -e " port CDN TLS       : 443"
echo -e " port CDN NTLS      : 80, 8080, 8081-9999"
echo -e " port CDN Grpc      : 443"
echo -e " User ID            : ${uuid}"
echo -e " Encryption         : none"
echo -e " Path TLS           : /vless "
echo -e " ServiceName        : vless-grpc"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link TLS    : ${vlesslink1}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link NTLS   : ${vlesslink2}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link GRPC   : ${vlesslink3}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link Format Openclash : https://${domain}:81/vless-$user.txt"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link Via Qris  : https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=${vlesslink1}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Expired    : $exp"
echo -e "${z} ──────────────────────────────${NC}"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
m-vless