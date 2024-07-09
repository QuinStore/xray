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
blue='\e[34m'

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
    echo -e "      \033[0;36mTelegram${NC} t.me/andiowl"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282217067357"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
echo -e ""
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}Trial Trojan Account${NC}           "
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
user=Trial-TR`</dev/urandom tr -dc 0-9 | head -c3`
clear
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
# Link Trojan Akun
systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@bugkamu.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"

cat >/var/www/html/trojan-$user.txt <<-END
=========================
  SDC VPN TUNNELING 
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

=========================
Link Akun Trojan 
=========================
Link WS          : 
${trojanlink}
=========================
Link GRPC        : 
${trojanlink1}
=========================

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
  echo "${d}" >/etc/trojan/${user}
fi

baca1=$(cat /etc/vmess/${user})
Quota=$(con ${baca1})

DATADB=$(cat /etc/trojan/.trojan.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/trojan/.trojan.db

function trialtrojan(){
    exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/^#! $user $exp/,/^},{/d" /etc/trojan/.trojan.db
    rm -rf /etc/trojan/$user
    rm -rf /etc/kyt/limit/trojan/ip/$user
    systemctl restart xray > /dev/null 2>&1
}


echo trialtrojan | at now + $pup minutes

if [ ! -e /etc/active ]; then
  mkdir -p /etc/active
fi

if [ -e "/etc/active/4-trojan" ]; then
    send_trialtrojan
else
    echo -e ""
fi

stop_spinner
echo -e " ${Green}Success Verif New Data....${Suffix}"

clear
echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e " Trial Trojan Account          "
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Remarks          : ${user}" 
echo -e "Host/IP          : ${domain}"
echo -e "User Quota       : ${Quota}"
echo -e "User IP          : ${iplimit} IP"
echo -e "port             : 400-900" 
echo -e "Key              : ${uuid}" 
echo -e "Path             : /trojan-ws" 
echo -e "ServiceName      : trojan-grpc" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link WS          : ${trojanlink}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link GRPC        : ${trojanlink1}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $pup Minutes"
echo -e "${z} ──────────────────────────────${NC}"
echo "" 
read -n 1 -s -r -p "Press any key to back on menu"
m-trojan