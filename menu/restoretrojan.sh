#!/bin/bash

##Color
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

#tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "${ORANGE} ┌──────────────────────────────────┐${NC}"
echo -e " ${biru}       Restore Trojan Account        "
echo -e "${ORANGE} └──────────────────────────────────┘${NC}"
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
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} > '1' ]]; then
clear
echo -e "${ORANGE} ┌──────────────────────────────────┐${NC}"
echo -e " ${biru}       Restore Trojan Account        "
echo -e "${ORANGE} └──────────────────────────────────┘${NC}"
			echo ""
			echo -e " ${RED}Name was already created, please choose another name${NC}"
			echo ""
			read -n 1 -s -r -p "Press any key to back and try again"
			restoretrojan
		fi
	done

read -p "  Uuid : " uuid
read -p "  Expired (days) : " masaaktif
read -p "  Limit User (MB/GB) : " Quota
read -p "  Limit User (IP) : " iplimit
echo -e ""
start_spinner " Please wait, Restore data...."
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

# Link Trojan Akun

trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@bugkamu.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"

cat >/var/www/html/trojan-$user.txt <<-END
=========================
   SDC VPN Tunneling 
=========================

# Format Trojan GO/WS

- name: Trojan-$user-GO/WS
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}

# Format Trojan gRPC

- name: Trojan-$user-gRPC
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc
END

trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"

if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/trojan/ip
echo -e "$iplimit" > /etc/kyt/limit/trojan/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0MB"
fi

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
  echo "${d}" >/etc/trojan/${user}
fi

if [ ! -e /etc/trojan/${user} ]; then
    Quota1="Unlimited"
else
    baca1=$(cat /etc/trojan/${user})
    Quota1=$(con ${baca1})
fi

if [ ! -e /etc/kyt/limit/vmess/ip/$user ]; then
    iplimit="Unlimited"
else
    iplimit=$(cat /etc/kyt/limit/vmess/ip/$user)
fi

DATADB=$(cat /etc/trojan/.trojan.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/trojan/.trojan.db
systemctl restart xray

sleep 2
stop_spinner
echo -e " ${biru}Success Restore Data....${NC}"

clear
echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e " RESTORED TROJAN ACCOUNT          "
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Remarks          : ${user}" 
echo -e " Host/IP          : ${domain}"
echo -e " Wilcard          : bug.${domain}"
echo -e " User Quota       : ${Quota1}"
echo -e " User Ip          : ${iplimit} IP"
echo -e " Port             : 400-900" 
echo -e " Uuid             : ${uuid}" 
#echo -e "Xray Dns.        : ${NS}"
#echo -e "Pubkey.          : ${PUB}"
echo -e " Path             : /Multi-Path/trojan-ws"
echo -e " Dynamic          : https://bugmu.com/path"
echo -e " ServiceName      : trojan-grpc" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link WS          : ${trojanlink}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Link GRPC        : ${trojanlink1}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Format OpenClash : https://${domain}:81/trojan-$user.txt" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Aktif Selama     : $masaaktif Hari"
echo -e " Restore Pada     : $tnggl"
echo -e " Berakhir Pada    : $expe"
echo -e "${z} ──────────────────────────────${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on trojan menu"
m-trojan