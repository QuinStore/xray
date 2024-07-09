#!/bin/bash
source /usr/local/sbin/spiner
source /usr/local/sbin/send-bot

RED="\033[31m"
YELLOW="\033[33m"
NC='\e[0m'
Bold='\e[1m'
blue='\e[34m'
PURPLE='\e[35m'
NC='\e[0m'
ORANGE='\033[0;33m'
biru='\033[0;36m'
z='\033[96m'
grenbo="\e[92;1m"

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
    echo -e " ${RED}IP Address access is not allowed${NC}"
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

IP=$(curl -sS ipv4.icanhazip.com)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
domain=$(cat /etc/xray/domain)
clear
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}SSH Ovpn Account${NC}           "
echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
echo -e "${z}  ──────────────────────────────────${NC}"
echo -e "     ${biru}Just input a number for-"
echo -e "${Green}      Limit IP${Suffix}"
echo -e ""
echo -e "     ${biru}Example: "
echo -e "${ORANGE}      0${Suffix} for No Limit"
echo -e "${z}  ──────────────────────────────────${NC}"
echo -e ""
read -p "   Username : " Login
read -p "   Password : " Pass
read -p "   Limit IP : " iplimit
read -p "   Expired (Days) : " masaaktif
echo -e ""
start_spinner " Please wait, Colecting New data...."
#limitip
if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/ssh/ip
echo -e "$iplimit" > /etc/kyt/limit/ssh/ip/$Login
else
echo > /dev/null
fi
clear
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

DATADB=$(cat /etc/ssh/.ssh.db | grep "^#ssh#" | grep -w "${Login}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${Login}\b/d" /etc/ssh/.ssh.db
fi
echo "#ssh# ${Login} ${Pass} ${iplimit} ${expe}" >>/etc/ssh/.ssh.db
clear

#kirim Bot
if [ ! -e /etc/active ]; then
  mkdir -p /etc/active
fi

if [ -e "/etc/active/1-ssh" ]; then
    send_ssh
else
    echo -e ""
fi

cat > /var/www/html/ssh-$Login.txt <<-END
=========================
   SDC Vpn Tunneling 
=========================

Format SSH OVPN Account
=========================
Username         : $Login
Password         : $Pass
=========================
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80, 8080, 8081-9999
Port SSH SSL WS  : 443
Port SSL/TLS     : 400-900
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100, 7300, 7300
=================================
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
=================================
Payload Enchanced: PATCH / HTTP/1.1[crlf]Host: [host][crlf]Host: bug.com[crlf]Upgrade: websocket[crlf]HTTP/ 3600[crlf]Sec-WebSocket-Extensions: superspeed[crlf]
=================================
SSH TLS/SNI : $domain:443@$Login:$Pass
SSH Non TLS : $domain:80@$Login:$Pass
=================================
OVPN Download : https://$domain:81/
=================================
Aktif Selama     : $masaaktif Hari
Dibuat Pada      : $tnggl
Berakhir Pada    : $expe
=================================

END
stop_spinner
echo -e " ${Green}Success Collecting Data..${Suffix}"
clear
echo ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e "  SSH OVPN Account    "
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Username         : $Login"
echo -e " Password         : $Pass"
#echo -e "Limit Quota      : $Quota GB"
echo -e " Limit Ip         : ${iplimit} User"
#echo -e "IP               : $IP"
echo -e " Host             : $domain"
#echo -e "Host Slowdns     : ${NS}"
#echo -e "Pub Key          : ${PUB}"
#echo -e "Location         : $CITY"
echo -e " Port OpenSSH     : 443, 80, 22"
#echo -e "Port DNS         : 443, 53 ,22 "
echo -e " Port SSH UDP     : 1-65535"
echo -e " Port Dropbear    : 443, 109"
echo -e " Port SSH WS      : 80, 8080, 8081-9999"
echo -e " Port SSH SSL WS  : 443"
echo -e " Port SSL/TLS     : 400-900"
echo -e " Port OVPN WS SSL : 443"
echo -e " Port OVPN SSL    : 443"
echo -e " Port OVPN TCP    : 443, 1194"
echo -e " Port OVPN UDP    : 2200"
echo -e " BadVPN UDP       : 7100, 7300, 7300"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " SSH TLS/SNI : $domain:443@$Login:$Pass"
echo -e " SSH Non TLS : $domain:80@$Login:$Pass"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Payload Enchanced: PATCH / HTTP/1.1 \nHost: [host]\nHost: bug.com\nUpgrade: websocket\n\nHTTP/ 3600\nSec-WebSocket-Extensions: superspeed\n"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " OVPN Download    : https://$domain:81/"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Save Link Account: https://$domain:81/ssh-$Login.txt"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Aktif Selama     : $masaaktif Hari"
echo -e " Dibuat Pada      : $tnggl"
echo -e " Berakhir Pada    : $expe"
echo -e "${z} ──────────────────────────────${NC}"
echo -e ""
read -n 1 -s -r -p " Press any key to back on ssh menu"
m-sshws