#!/bin/bash

RED="\033[31m"
REDBG="\033[41;37m"
NC='\e[0m'
Bold='\e[1m'
blue='\e[34m'
PURPLE='\e[35m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
biru='\033[0;36m'
z='\033[96m'

source /usr/local/sbin/spiner
source /usr/local/sbin/send-bot

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

domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
  echo -e "         ${biru}Create Vless Account${NC}           "
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
  echo -e "         ${biru}Create Vless Account${NC}           "
  echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
    echo ""
    echo -e " ${RED}Name was already created, please choose another name${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back and try again"
    addvless
  fi
done

#Test For New Brand UUID
if [ ! -e /etc/brand ]; then
  mkdir -p /etc/brand
fi

if [ ! -e /etc/brand/.brand.db ]; then
    touch /etc/brand/.brand.db
fi

cekbrand=$(cat /etc/brand/.brand.db | grep '#vless#' | cut -d ' ' -f 2 | sort | uniq)

if [[ -z ${cekbrand} ]]; then
  uuid=$(cat /proc/sys/kernel/random/uuid)
else
  uuid="${cekbrand}-${user}"
fi

read -p "  Expired (days) : " masaaktif
read -p "  Limit Quota (MB/GB): " Quota
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
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
systemctl restart xray > /dev/null 2>&1
stop_spinner
echo -e " ${Green}Success Collecting Data..${Suffix}"
echo -e ""
sleep 2
start_spinner " Please wait, Verify New data...."
cat >/var/www/html/vless-$user.txt <<-END

=========================
  SDC VPN TUNNELING 
=========================
# Format Vless WS TLS

- name: Vless-$user-WS TLS
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}

# Format Vless WS Non TLS

- name: Vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
  udp: true

# Format Vless gRPC (SNI)

- name: Vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
    grpc-service-name: vless-grpc

=========================
Link Akun Vless 
=========================
Link TLS      : 
${vlesslink1}
=========================
Link none TLS : 
${vlesslink2}
=========================
Link GRPC     : 
${vlesslink3}
=========================

END
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vless/ip
echo -e "$iplimit" > /etc/kyt/limit/vless/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0MB"
fi

# Menghapus semua karakter kecuali angka, MB, dan GB
sanitized_input=$(echo "${Quota}" | sed -E 's/[^0-9MBmbGBgb]*//g')

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
  echo "${d}" >/etc/vless/${user}
fi

if [ ! -e /etc/vless/${user} ]; then
    Quota1="Unlimited"
else
    baca1=$(cat /etc/vless/${user})
    Quota1=$(con ${baca1})
fi

if [ ! -e /etc/kyt/limit/vmess/ip/$user ]; then
    iplimit="Unlimited"
else
    iplimit=$(cat /etc/kyt/limit/vmess/ip/$user)
fi

DATADB=$(cat /etc/vless/.vless.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vless/.vless.db

#kirim Bot
if [ ! -e /etc/active ]; then
  mkdir -p /etc/active
fi

if [ -e "/etc/active/3-vless" ]; then
    send_vless
else
    echo -e ""
fi

stop_spinner
echo -e " ${Green}Success Verify Data..${Suffix}"
sleep 2

clear
echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e " CREATE VLESS ACCOUNT           "
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Remarks     : ${user}"
echo -e " Domain      : ${domain}"
echo -e " Wilcard     : bug.${domain}"
echo -e " User Quota  : ${Quota1}"
echo -e " User Ip     : ${iplimit} IP"
echo -e " port TLS    : 400-900"
#echo -e "Port DNS    : 443"
echo -e " Port NTLS   : 80, 8080, 8081-9999"
echo -e " User ID     : ${uuid}"
#echo -e "Xray Dns.   : ${NS}"
#echo -e "Pubkey.     : ${PUB}"
echo -e " Encryption  : none"
echo -e " Path        : /Multi-Path"
echo -e " Dynamic     : https://bugmu.com/path"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link TLS    : ${vlesslink1}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link NTLS   : ${vlesslink2}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link GRPC   : ${vlesslink3}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Aktif Selama     : $masaaktif Hari"
echo -e " Dibuat Pada      : $tnggl"
echo -e " Berakhir Pada    : $expe"
echo -e "${z} ──────────────────────────────${NC}"
echo -e ""
read -n 1 -s -r -p " Press any key to back on vless menu"
m-vless