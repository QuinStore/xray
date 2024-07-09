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

source /usr/local/sbin/spiner

##FUngsi Hitung GB
function con(){
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes} B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 )) KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 )) MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 )) GB"
    fi
}

CITY=$(cat /etc/xray/city)
clear
NUMBER_OF_CLIENTS=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "${ORANGE} ┌──────────────────────────────────┐${NC}"
echo -e " ${biru}       Config Vmess Account        "
echo -e "${ORANGE} └──────────────────────────────────┘${NC}"
    echo ""
    echo "    You have no existing clients! "
    echo ""
    read -n 1 -s -r -p "Press [ Enter ] to back on menu vmess"
    m-vmess
fi

echo -e "${ORANGE} ┌──────────────────────────────────┐${NC}"
echo -e " ${biru}       Config Vmess Account        "
echo -e "${ORANGE} └──────────────────────────────────┘${NC}"
        #echo "     No  Expired   User"
        #ambilakun=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq)
        #echo -e "No " | column -t | sort | uniq | nl -s '. '
        grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | awk 'BEGIN{printf "%-4s%-15s%-15s\n", "    No", "  Username", "  Expired"} {printf "    %-4s%-15s%-15s\n", NR, $1, $2}'
        #echo "     No User    Expired"
	      #grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
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
            m-vmess
        fi

start_spinner " Please wait, Colecting data...."
user=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
iplim=$(cat /etc/kyt/limit/vmess/ip/$user)
Quota1=$(cat /etc/vmess/$user)
Quota=$(con ${Quota1})
uuid1=$(grep -E "uuid" "/var/www/html/vmess-$user.txt" | cut -d ' ' -f 4 | uniq )
#Quota=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=$(date +"%Y-%m-%d")
masaaktif=$(( ($(date -d "$exp" +%s) - $(date -d "$hariini" +%s)) / 86400 ))
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid1}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid1}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid1}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`

if [ ! -e /etc/vmess/${user} ]; then
    Quota="Unlimited"
else
    baca1=$(cat /etc/vmess/${user})
    Quota=$(con ${baca1})
fi

if [ ! -e /etc/kyt/limit/vmess/ip/$user ]; then
    iplimit="Unlimited"
else
    iplimit=$(cat /etc/kyt/limit/vmess/ip/$user)
fi

stop_spinner
echo -e " ${Green}Success Colecting Data....${Suffix}"

vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"

clear
echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Xray/Vmess Account "
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Remarks          : ${user}"
echo -e " Domain           : ${domain}"
echo -e " User Quota       : ${Quota}"
echo -e " User Ip          : ${iplim} IP"
echo -e " Port TLS         : 400-900"
echo -e " Port none TLS    : 80, 8080, 8081-9999"
echo -e " id               : ${uuid1}"
#echo -e "Xray Dns      : ${NS}"
#echo -e "Pubkey        : ${PUB}"
echo -e " alterId          : 0"
echo -e " Security         : auto"
echo -e " Network          : ws"
echo -e " Path             : /Multi-Path"
echo -e " Dynamic          : https://bugmu.com/path"
echo -e " ServiceName      : vmess-grpc"
#echo -e "Host XrayDNS : ${NS}"
#echo -e "Location         : $CITY"
#echo -e "Pub Key          : ${PUB}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link TLS         : ${vmesslink1}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link none TLS    : ${vmesslink2}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link GRPC        : ${vmesslink3}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Format OpenClash : https://${domain}:81/vmess-$user.txt"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Aktif Selama     : $masaaktif Hari"
echo -e " Berakhir Pada    : $exp"
echo -e "${z} ──────────────────────────────${NC}"
echo ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
m-vmess