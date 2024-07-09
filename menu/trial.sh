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
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
z='\033[96m'
biru='\033[0;36m'
Suffix="\033[0m"
# Getting
source /usr/local/sbin/spiner
source /usr/local/sbin/send-bot
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
domain=$(cat /etc/xray/domain)
clear
IP=$(curl -sS ipv4.icanhazip.com)
Login=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
masaaktif="1"
Pass=1
limitip=1
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
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}Trial SSH Account${NC}           "
echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
echo -e "${z}  ──────────────────────────────────${NC}"
echo -e "     ${biru}Just input a number for-"
echo -e "${Green}      Expired Account${Suffix}"
echo -e ""
echo -e "     ${biru}Example: "
echo -e "${ORANGE}      5${Suffix} for [${ORANGE}5 Minutes]"
echo -e "${ORANGE}      10${Suffix} for [${ORANGE}10 Minutes]"
echo -e "${ORANGE}      30${Suffix} for [${ORANGE}30 Minutes]"
echo -e "${z}  ──────────────────────────────────${NC}"
read -rp "    Minutes : " pup
echo -e ""
start_spinner " Please wait, Colecting New data...."
if [[ $limitip -gt 0 ]]; then
mkdir -p /etc/kyt/limit/ssh/ip
echo -e "$limitip" > /etc/kyt/limit/ssh/ip/$Login
else
echo > /dev/null
fi

if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi

DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${Login}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${Login}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${Login} " >>/etc/ssh/.ssh.db
echo ""

if [ -e "/etc/active/1-ssh" ]; then
    send_sshtrial
else
    echo -e ""
fi

cat > /var/www/html/ssh-$Login.txt <<-END
=========================
Format SSH Account
=========================
Username         : $Login
Password         : $Pass
Berakhir Pada    : $pup Menit
=========================
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
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
OVPN Download : https://$domain:81/
=================================

END
echo userdel -f "$Login" | at now + $pup minutes

stop_spinner
echo -e " ${Green}Success Collecting Data..${Suffix}"

clear
echo -e "${z} ──────────────────────────────${NC}"
echo -e "    ${biru}Trial SSH & OpenVPN"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Username         : $Login"
echo -e " Password         : $Pass"
echo -e " Domain SSH       : $domain"
echo -e " OpenSSH          : 22"
echo -e " Dropbear         : 80, 8080"
echo -e " Port SSH UDP     : 1-65535"
echo -e " SSL/TLS          : 400-900"
echo -e " SSH Ws Non SSL   : 80, 8080, 8081-9999"
echo -e " SSH Ws SSL       : 443"
echo -e " OVPN Ws Non SSL  : 80"
echo -e " OVPN Ws SSL      : 443"
echo -e " BadVPN UDPGW     : 7100,7200,7300"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " SSH TLS/SNI : $domain:443@$Login:$Pass"
echo -e " SSH Non TLS : $domain:80@$Login:$Pass"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " OVPN Download : https://$domain:81/"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt"
echo -e "${z} ──────────────────────────────${NC}"
#echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Dibuat Pada    : $tnggl"
echo -e "Berakhir Pada  : $pup Menit"
echo -e "${z} ──────────────────────────────${NC}"
read -n 1 -s -r -p "Press any key to back on ssh menu"
m-sshws