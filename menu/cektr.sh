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
z="\033[96m"
NC='\033[0m'
clear
function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^#!' | cut -d ' ' -f 2 | sort | uniq`);
echo -e " ${z}┌───────────────────────────────────────────────┐${NC}"
echo -e "                 CEK TROJAN ACCOUNT           "
echo -e " ${z}└───────────────────────────────────────────────┘${NC}"
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
echo -e "   No Login Account Here! Try Again Later!"
fi
echo -n > /tmp/iptrojan.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else

if [ ! -e /etc/kyt/limit/trojan/ip/${akun} ]; then
    iplimit='Unlimited'
else
    iplimit=$(cat /etc/kyt/limit/trojan/ip/${akun})
fi
jum2=$(cat /tmp/iptrojan.txt | wc -l)

if [ ! -e /etc/trojan/${akun} ]; then
    lim='Unlimited'
else
    byte=$(cat /etc/trojan/${akun})
    lim=$(con ${byte})
fi

if [ ! -e /etc/limit/trojan/${akun} ]; then
    gb='No Usage'
else
    wey=$(cat /etc/limit/trojan/${akun})
    gb=$(con ${wey})
fi

lastlogin=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 2 | tail -1)
my_log=$(cat /var/log/xray/access.log | grep -w "email: ${akun}" | wc -l)

echo -e " ${z}┌───────────────────────────────────────────────┐${NC}"
printf "  %-13s %-7s %-8s %2s\n" "  UserName    : ${akun}"
printf "  %-13s %-7s %-8s %2s\n" "  Login       : $lastlogin"
printf "  %-13s %-7s %-8s %2s\n" "  Usage Quota : ${gb}" 
printf "  %-13s %-7s %-8s %2s\n" "  Limit Quota : ${lim}" 
printf "  %-13s %-7s %-8s %2s\n" "  Limit IP    : $iplimit" 
printf "  %-13s %-7s %-8s %2s\n" "  Login IP    : $jum2" 
printf "  %-13s %-7s %-8s %2s\n" "  Log User    : $my_log"
echo -e " ${z}└───────────────────────────────────────────────┘${NC}"
fi 
rm -rf /tmp/iptrojan.txt
done
rm -rf /tmp/other.txt
echo -e "       No Client Online/ No Client"
echo ""
read -n 1 -s -r -p "Press [ Enter ] to back"
m-trojan