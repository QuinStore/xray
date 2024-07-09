#!/bin/bash
z="\033[96m"
ORANGE='\033[0;33m'
NC='\033[0m'
RED="\033[31m"
PURPLE='\e[35m'
biru="\033[0;36m"
GREEN='\033[0;32m'
Suffix="\033[0m"
Bold='\e[1m'

source /usr/local/sbin/spiner
source /usr/local/sbin/send-bot

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
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/wingsofhope"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282261333421"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    sleep 5
    reboot
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
echo -e ""
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}Trial Vmess Account${NC}           "
echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
echo -e "${z}  ──────────────────────────────────${NC}"
echo -e "     ${biru}Just input a number for-"
echo -e "${Green}      Expired Account${Suffix}"
echo -e ""
echo -e "     ${biru}Example: "
echo -e "${ORANGE}      5${Suffix} for [${ORANGE}5 Minutes${NC}]"
echo -e "${ORANGE}      10${Suffix} for [${ORANGE}10 Minutes${NC}]"
echo -e "${ORANGE}      30${Suffix} for [${ORANGE}30 Minutes${NC}]"
echo -e "${z}  ──────────────────────────────────${NC}"
read -rp "    Minutes : " pup
echo -e ""
start_spinner " Please wait, Colecting New data...."
domain=$(cat /etc/xray/domain)
masaaktif=1
Quota='500MB'
iplimit=3
user=Trial-VM`</dev/urandom tr -dc 0-9 | head -c3`
clear

cekbrand=$(cat /etc/brand/.brand.db | grep '#vmess#' | cut -d ' ' -f 2 | sort | uniq)

if [[ -z ${cekbrand} ]]; then
  uuid=$(cat /proc/sys/kernel/random/uuid)
else
  uuid="${cekbrand}-${user}"
fi

exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
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
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1


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

baca1=$(cat /etc/vmess/${user})
Quota=$(con ${baca1})

DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid} " >>/etc/vmess/.vmess.db

function trialvmess(){
    exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/^### $user $exp/,/^},{/d" /etc/vmess/.vmess.db
    rm -rf /etc/vmess/$user
    rm -rf /etc/kyt/limit/vmess/ip/$user
    systemctl restart xray > /dev/null 2>&1
}

clear

echo trialvmess | at now + $pup minutes

#kirim Bot
if [ ! -e /etc/active ]; then
  mkdir -p /etc/active
fi

if [ -e "/etc/active/2-vmess" ]; then
    send_trialvmess
else
    echo -e ""
fi

stop_spinner
echo -e " ${Green}Success Verif New Data....${Suffix}"

echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Trial Vmess Account "
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "User Quota       : ${Quota}"
echo -e "Limit IP         : ${iplimit} IP"
echo -e "Port TLS         : 400-900"
echo -e "Port none TLS    : 80, 8080, 8081-9999"
echo -e "id               : ${uuid}"
echo -e "alterId          : 0"
echo -e "Security         : auto"
echo -e "Network          : ws"
echo -e "Path             : /Multi-Path"
echo -e "Dynamic          : https://bugmu.com/path"
echo -e "ServiceName      : vmess-grpc"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link TLS         : ${vmesslink1}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link none TLS    : ${vmesslink2}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link GRPC        : ${vmesslink3}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Format OpenClash : https://${domain}:81/vmess-$user.txt"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $pup Minutes"
echo -e "${z} ──────────────────────────────${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on vmess menu"
m-vmess