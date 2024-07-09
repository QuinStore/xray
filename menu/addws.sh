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

red() { echo -e "\\033[32;1m${*}\\033[0m"; }
source /usr/local/sbin/spiner
source /usr/local/sbin/send-bot
# Getting
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
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

clear
source /var/lib/kyt/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

#tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
#none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}Create Vmess Account${NC}           "
echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
  echo -e "${z}  ──────────────────────────────────${NC}"
    echo -e "    ${biru}Format GB"
    echo -e "     ${ORANGE}20MB/2GB, 20mb/2gb For Quota Limit${Suffix}"
    echo -e "     ${ORANGE}0MB/0mb${Suffix} ${biru}for Unlimited"
    echo -e ""
    echo -e "    ${biru}Format IP, Just Input Number"
    echo -e "     ${ORANGE}0${Suffix} ${biru}for No Limit"
  echo -e "${z}  ──────────────────────────────────${NC}"
		echo -e ""
    read -rp "  User : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} > '1' ]]; then
clear
            echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
            echo -e "         ${biru}Create Vmess Account${NC}           "
            echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"

			echo ""
			echo -e " ${RED}Name was already created, please choose another name${NC}"
			echo ""
			read -n 1 -s -r -p "Press any key to back and try again"
      addws
		fi
	done
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )

#Test For New Brand UUID
if [ ! -e /etc/brand ]; then
  mkdir -p /etc/brand
fi

if [ ! -e /etc/brand/.brand.db ]; then
    touch /etc/brand/.brand.db
fi

cekbrand=$(cat /etc/brand/.brand.db | grep '#vmess#' | cut -d ' ' -f 2 | sort | uniq)

if [[ -z ${cekbrand} ]]; then
  uuid=$(cat /proc/sys/kernel/random/uuid)
else
  uuid="${cekbrand}-${user}"
fi

read -p "  Expired (days) : " masaaktif
read -p "  Limit Quota (MB/GB) : " Quota
read -p "  Limit User (IP) : " iplimit
echo -e ""
start_spinner " Please wait, Colecting New data...."
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json

asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
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
      "id": "${uuid}",
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
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
stop_spinner
echo -e " ${Green}Success Collecting Data..${Suffix}"
sleep 1
echo -e ""
start_spinner " Please wait, Add New data...."
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
stop_spinner
echo -e " ${Green}Success Add New Data....${Suffix}"
echo -e ""
start_spinner " Please wait, Verif New data...."

cat >/var/www/html/vmess-$user.txt <<-END

=========================
  SDC VPN TUNNELING 
=========================
# Format Vmess WS TLS

- name: Vmess-$user-WS TLS
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess WS Non TLS

- name: Vmess-$user-WS Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess gRPC

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

=========================
 Link Akun Vmess                   
=========================
Link TLS         : 
${vmesslink1}
=========================
Link none TLS    : 
${vmesslink2}
=========================
Link GRPC        : 
${vmesslink3}
=========================

END
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vmess/ip
echo -e "$iplimit" > /etc/kyt/limit/vmess/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0MB"
fi


# Menghapus semua karakter kecuali angka, MB, dan GB
sanitized_input=$(echo "${Quota}" | sed -E 's/[^0-9MBmbGBgb]*//g')

# Mendeteksi apakah input berisi MB atau GB

if [[ $sanitized_input =~ [Mm][Bb]$ ]]; then
  c=$(echo "${sanitized_input}" | sed 's/[Mm][Bb]$//')
  if [[ $c -eq 0 ]]; then
    echo > /dev/null 2>&1
  fi
  d=$((${c} * 1024 * 1024))
elif [[ $sanitized_input =~ [Gg][Bb]$ ]]; then
  c=$(echo "${sanitized_input}" | sed 's/[Gg][Bb]$//')
  if [[ $c -eq 0 ]]; then
    echo > /dev/null 2>&1
  fi
  d=$((${c} * 1024 * 1024 * 1024))
else
  echo "Input tidak valid. Harap masukkan nilai dengan satuan MB atau GB (contoh: 20MB, 2GB)"
  exit 1
fi

    if [[ ${c} != "0" ]]; then
      echo "${d}" >/etc/vmess/${user}
    fi

if [ ! -e /etc/vmess/${user} ]; then
    Quota1="Unlimited"
else
    baca1=$(cat /etc/vmess/${user})
    Quota1=$(con ${baca1})
fi

if [ ! -e /etc/kyt/limit/vmess/ip/$user ]; then
    iplimit="Unlimited"
else
    iplimit=$(cat /etc/kyt/limit/vmess/ip/$user)
fi

DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vmess/.vmess.db

#kirim Bot
if [ ! -e /etc/active ]; then
  mkdir -p /etc/active
fi

if [ -e "/etc/active/2-vmess" ]; then
    send_vmess
else
    echo -e ""
fi

stop_spinner
echo -e " ${Green}Success Verif New Data....${Suffix}"

clear
echo -e "${z} ──────────────────────────────${NC}"
echo -e "    Xray/Vmess Account "
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Remarks          : ${user}"
echo -e " Domain           : ${domain}"
echo -e " Wilcard          : bug.${domain}"
echo -e " User Quota       : ${Quota1}"
echo -e " User Ip          : ${iplimit} IP"
echo -e " Port TLS         : 400-900"
echo -e " Port none TLS    : 80, 8080, 8081-9999"
echo -e " id               : ${uuid}"
#echo -e "Xray Dns         : ${NS}"
#echo -e "Pubkey           : ${PUB}"
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
echo -e " Dibuat Pada      : $tnggl"
echo -e " Berakhir Pada    : $expe"
echo -e "${z} ──────────────────────────────${NC}"
echo ""
read -n 1 -s -r -p " Press any key to back on vmess menu"
m-vmess