#!/bin/bash

RED="\033[31m"
NC='\e[0m'
REDBG="\033[41;37m"
Bold='\e[1m'
blue='\e[34m'
PURPLE='\e[35m'
Suffix="\033[0m"
ORANGE='\033[0;33m'
z="\033[96m"

source /usr/local/sbin/send-bot
source /usr/local/sbin/spiner

# Valid Script
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/proj3c/user/main/user/user"
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

echo -e ""
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}Trial SS Account${NC}           "
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
clear
sspwd=$(cat /etc/xray/passwd)
clear
source /var/lib/kyt/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
clear
masaaktif=1
Quota='500MB'
user=Trial-SS`</dev/urandom tr -dc 0-9 | head -c3`
iplimit=3
clear
cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)

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
sed -i '/#ssws$/a\#!# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\#!# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@$domain:$tls?plugin=xray-plugin;mux=0;path=/ss-ws;host=$domain;tls#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@$domain:$tls?plugin=xray-plugin;mux=0;serviceName=ss-grpc;host=$domain;tls#${user}"

#buat ss WEBSOCKET
sslinkws="ss://${shadowsocks_base64e}@${domain}:443?path=/ss-ws&security=tls&encryption=none&type=ws#${user}"
nonsslinkws="ss://${shadowsocks_base64e}@${domain}:80?path=/ss-ws&security=none&encryption=none&type=ws#${user}"

#buat ss GRPC
sslinkgrpc="ss://${shadowsocks_base64e}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
nonsslinkgrpc="ss://${shadowsocks_base64e}@${domain}:80?mode=gun&security=none&encryption=none&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"

#buatshadowsocks custom
rm -rf /tmp/log
rm -rf /tmp/log1
cat > /var/www/html/sodosokws-$user.txt <<-END
{ 
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}
END
cat > /var/www/html/sodosokgrpc-$user.txt <<-END
{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}
END

if [ ! -e /etc/shadowsocks ]; then
  mkdir -p /etc/shadowsocks
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/shadowsocks/${user}
fi

DATADB=$(cat /etc/shadowsocks/.shadowsocks.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/shadowsocks/.shadowsocks.db
fi

echo "### ${user} ${exp} ${uuid}" >>/etc/shadowsocks/.shadowsocks.db

#kirim Bot
if [ ! -e /etc/active ]; then
  mkdir -p /etc/active
fi

if [ -e "/etc/active/5-shadowshocks" ]; then
    send_trialshadowshocks
else
    echo -e ""
fi

function trialshadowshock(){
    exp=$(grep -wE "^#!# $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/^#!# $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/^#!# $user $exp/,/^},{/d" /etc/shadowshock/.shadowshock.db
    rm -rf /etc/shadowshock/$user
    rm -rf /etc/kyt/limit/shadowshock/ip/$user
    systemctl restart xray > /dev/null 2>&1
}


echo trialshadowshock | at now + $pup minutes

systemctl restart xray >/dev/null 2>&1

clear
stop_spinner
echo -e " ${Green}Success Verif New Data....${Suffix}"

clear
echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e "   TRIAL SHADOWSOCKS         "
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "User Quota  : ${Quota} GB"
echo -e "Port TLS    : 400-900"
echo -e "Password    : ${uuid}"
echo -e "Cipers      : aes-128-gcm"
echo -e "Network     : ws/grpc"
echo -e "Path        : /ss-ws"
echo -e "ServiceName : ss-grpc"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link WS TLS : ${sslinkws}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link WS None TLS : ${nonsslinkws}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link GRPC : ${sslinkgrpc}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Dibuat Pada    : $tnggl"
echo -e "Berakhir Pada  : $pup Minutes"
echo -e "${z} ──────────────────────────────${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-ssws