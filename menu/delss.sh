#!#/bin/bash
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
z="\033[96m"
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#!# " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
        echo -e "         ${biru}Delete Shadow Account${NC}           "
        echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
		echo ""
		echo " ${RED}You have no existing clients!${NC}"
		echo ""
		read -n 1 -s -r -p "Press any key to back on menu"
        m-ssws
	fi

	clear
	echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
    echo -e "         ${biru}Delete Shadow Account${NC}           "
    echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
    echo -e " ${z} ---------------------------------- ${NC}"
    echo -e "        Username         Expired       "
    echo -e " ${z} ---------------------------------- ${NC}"
            data=( `cat /etc/xray/config.json | grep '#!#' | cut -d ' ' -f 2 | sort | uniq`);
            for akun in "${data[@]}"; do
                expired=$(grep -wE "^#!# $akun" "/etc/xray/config.json" | cut -d ' ' -f 3 | uniq)
                printf "        %-13s %-7s %-8s %2s\n"    "${akun}" "   ${expired}"
            done
    echo -e ""
    read -rp "Input Username [ Pres enter to go back Menu shadowsocks ]: " user
    if [ -z $user ]; then
        m-ssws
    else
        ceklagi=$(grep -wE "^#!# $user" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [ $ceklagi = $user ]; then
            exp=$(grep -wE "^#!# $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
            sed -i "/^#!# $user $exp/,/^},{/d" /etc/xray/config.json
            sed -i "/^#!# $user $exp/,/^},{/d" /etc/shadowsocks/.shadowsocks.db
            rm -rf /etc/shadowsocks/$user
            rm -rf /etc/kyt/limit/shadowsocks/ip/$user
            rm -rf /etc/limit/shadowsocks/$user
            rm -rf /var/www/html/shadowsocks-$user.txt
            systemctl restart xray > /dev/null 2>&1
            clear
            echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
            echo -e "     ${biru}Success Delete Shadow Account${NC}           "
            echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
            echo -e ""
            echo -e "   Client Name : $user"
            echo -e "   Expired On  : $exp"
            echo -e ""
        else
            echo -e " ${RED}  User Not Found, Please Try again${NC}"
            sleep 3
            delss
        fi
    fi