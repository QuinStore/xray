#!/bin/bash
# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
Bold='\e[1m'
#INTALLER-UDP
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/QuinStore/reseller/main/izin | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/QuinStore/reseller/main/izin | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl -sS https://raw.githubusercontent.com/QuinStore/reseller/main/izin | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
#####INFOAKUN
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2

### Version SC
versiedition=$(cat /root/versi/version)

##cek update
function cekupdate(){
   IZIN=$( curl https://raw.githubusercontent.com/owl64/AutoSC/main/system/version | grep $versiedition ); >/dev/null 2>&1
   if [ $versiedition = $IZIN ]; then
         cekupdateinfo="${green}UPTO DATE!${NC}"
   else
         cekupdateinfo="${y}New Update!${NC}"
   fi
}
cekupdate
a=" ${CYAN}ACCOUNT" 
clear

echo -e " "
echo -e " ${z}┌──────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC$purple                ${Bold}INFORMATION VPS                  $NC${z} │$NC"
echo -e " ${z}└──────────────────────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC${z} System OS ${NC}     $Blue=$NC $MODEL${NC}"
echo -e " ${z}│$NC${z} Core System ${NC}   $Blue=$NC $CORE${NC}"
echo -e " ${z}│$NC${z} Server RAM ${NC}    $Blue=$NC $uram/$RAM MB $NC"
echo -e " ${z}│$NC${z} Uptime Server ${NC} $Blue=$NC $SERONLINE${NC}"
echo -e " ${z}│$NC${z} IP/Domain ${NC}     $Blue=$NC ${domain}/${IPVPS}${NC}"
echo -e " ${z}│$NC${z} ISP/CITY ${NC}      $Blue=$NC ${ISP}/${CITY}${NC}"
echo -e " ${z}└──────────────────────────────────────────────────┘${NC}"
echo -e " ${z}        ┌──────────────────────────────────┐${NC}"
echo -e "              SSH/OVPN    $y:$NC $ssh1  $a${NC}"
echo -e "              VMESS       $y:$NC $vma  $a${NC}"
echo -e "              VLESS       $y:$NC $vla  $a${NC}"
echo -e "              TROJAN      $y:$NC $trb  $a${NC}"    
echo -e "              SHADOWSOCKS $y:$NC $ssa  $a${NC}" 
echo -e " ${z}        └──────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC${z} Version$NC       ${Blue}=${NC}${YELL} v${versiedition} LTS Rev.1"
echo -e " ${z}│$NC${z} User$NC          ${Blue}=$NC $username $sts"
echo -e " ${z}│$NC${z} Expiry script$NC ${Blue}=${green} $certifacate Days$NC "
echo -e " ${z}└──────────────────────────────────────────────────┘${NC}"
echo -e " ${z} ────────────────────────────────────────────────── ${NC}"
echo -e "           to access use$YELL ☞$green menu$NC commands"
echo -e "               ${Blue}[*]$y SCRIPT : $cekupdateinfo"
echo -e " ${z} ────────────────────────────────────────────────── ${NC}"
echo -e ""