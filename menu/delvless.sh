#!/bin/bash
# Color
RED='\033[0;31m'
NC='\033[0m'
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
biru='\033[0;36m'
Bold='\e[1m'
z="\033[96m"

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
        echo -e "         ${biru}Delete Vless Account${NC}           "
        echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
		echo ""
		echo " ${RED}You have no existing clients!${NC}"
		echo ""
		read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi

	clear
	echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
    echo -e "         ${biru}Delete Vless Account${NC}           "
    echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
    echo -e " ${z} ---------------------------------- ${NC}"
    echo -e "        Username         Expired       "
    echo -e " ${z} ---------------------------------- ${NC}"
            data=( `cat /etc/xray/config.json | grep '#&' | cut -d ' ' -f 2 | sort | uniq`);
            for akun in "${data[@]}"; do
                expired=$(grep -wE "^#& $akun" "/etc/xray/config.json" | cut -d ' ' -f 3 | uniq)
                printf "        %-13s %-7s %-8s %2s\n"    "${akun}" "   ${expired}"
            done
    echo -e ""
    read -rp "Input Username [ Pres enter to go back Menu vless ]: " user
    if [ -z $user ]; then
        m-vless
    else
        ceklagi=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [ $ceklagi = $user ]; then
            exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
            sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
            sed -i "/^#& $user $exp/,/^},{/d" /etc/vless/.vless.db
            rm -rf /etc/vless/$user
            rm -rf /etc/kyt/limit/vless/ip/$user
            rm -rf /etc/limit/vless/$user
            rm -rf /var/www/html/vless-$user.txt
            systemctl restart xray > /dev/null 2>&1
            clear
            echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
            echo -e "     ${biru}Success Delete Vless Account${NC}           "
            echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
            echo -e ""
            echo -e "   Client Name : $user"
            echo -e "   Expired On  : $exp"
            echo -e ""
        else
            echo -e " ${RED}  User Not Found, Please Try again${NC}"
            sleep 3
            delvless
        fi
    fi