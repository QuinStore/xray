#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
biru='\033[0;36m'
Bold='\e[1m'
z="\033[96m"

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
    echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
    echo -e "         ${biru}Renew Vmess Account${NC}           "
    echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
		echo ""
		echo " ${RED}You have no existing clients!${NC}"
		echo ""
		read -n 1 -s -r -p "Press any key to back on menu"
    m-vmess
	fi

	clear
	  echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
    echo -e "         ${biru}Renew Vmess Account${NC}           "
    echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
    echo -e " ${z} ---------------------------------- ${NC}"
    echo -e "        Username         Expired       "
    echo -e " ${z} ---------------------------------- ${NC}"
            data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);
            for akun in "${data[@]}"; do
                expired=$(grep -wE "^### $akun" "/etc/xray/config.json" | cut -d ' ' -f 3 | uniq)
                printf "        %-13s %-7s %-8s %2s\n"    "${akun}" "   ${expired}"
            done
    echo -e ""
	read -rp "Input Username [ Pres enter to go back Menu vmess ]: " user
    if [ -z $user ]; then
      m-vmess
    else
        ceklagi=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [ $ceklagi != $user ]; then
            echo -e " ${RED}  User Not Found, Please Try again${NC}"
            sleep 3
            renewws
        else
            read -p "Expired (days): " masaaktif
            rm -f /etc/kyt/limit/vmess/ip/${user}
            rm -f /etc/vmess/$user
            read -p "Limit Quota (MB/GB): " Quota
            read -p "Limit User (IP): " iplim
            exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
            mkdir -p /etc/kyt/limit/vmess/ip
            echo ${iplim} >> /etc/kyt/limit/vmess/ip/${user}
            if [ ! -e /etc/vmess/ ]; then
              mkdir -p /etc/vmess/
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

            now=$(date +%Y-%m-%d)
            d1=$(date -d "$exp" +%s)
            d2=$(date -d "$now" +%s)
            exp2=$(( (d1 - d2) / 86400 ))
            exp3=$(($exp2 + $masaaktif))
            exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
            sed -i "/### $user/c\### $user $exp4" /etc/xray/config.json
            sed -i "/### $user/c\### $user $exp4" /etc/vmess/.vmess.db
            systemctl restart xray > /dev/null 2>&1
            clear
            echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
            echo -e "         ${biru}Renew Vmess Success${NC}           "
            echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
            echo -e ""
            echo -e " Client Name  : $user"
            echo -e " Expired On   : $exp4"
            echo -e " User Quota   : $Quota"
            echo -e " User Limit IP: $iplim"
            echo -e ""
            read -n 1 -s -r -p "Press any key to back on menu"
            m-vmess
        fi
    fi