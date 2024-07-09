#!/bin/bash
source /usr/local/sbin/spiner
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
function changelimitquotavmess(){
    clear
    data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);
    defaultgb="60"
    d=$((${defaultgb} * 1024 * 1024 * 1024))

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit Quota              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 Quota       "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/vmess"
        cekada=$(grep -c -E "^### " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-vmess
        fi

        for akun in "${data[@]}"; do
                if [ ! -e /etc/vmess/${akun} ]; then
                    gb="Unlimited"
                else
                    wey=$(cat "/etc/vmess/${akun}")
                    gb=$(con "${wey}")
                fi
                printf "         %-13s %-7s %-8s %2s\n"    "${akun}" "          ${gb}"
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-vmess
    else
        ceklagi=$(grep -wE "^### $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."

            if [[ $limitnew -eq 0 ]]; then
                echo > /dev/null 2>&1
            fi

            truncate -s 0 /etc/vmess/$change
            sleep 1
            lmn=$((${limitnew} * 1024 * 1024 * 1024))
            echo "$lmn" >> /etc/vmess/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-vmess
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vmess
        fi
    fi
}
function changeiplimitvmess(){
    clear
    data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);
    defaultip="5"

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit IP              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 IP Limit     "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/kyt/limit/vmess/ip"

        cekada=$(grep -c -E "^### " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-vmess
        fi

        for akun in "${data[@]}"; do
                if [ ! -e ${directory}/${akun} ]; then
                    iplimit="Unlimited"
                else
                    iplimit=$(cat $directory/$akun)
                fi
                printf "         %-13s %-7s %-8s %2s\n"   "${akun}" "          $iplimit IP";        
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-vmess
    else
        ceklagi=$(grep -wE "^### $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."

            if [[ $limitnew -eq 0 ]]; then
                echo > /dev/null 2>&1
            fi

            truncate -s 0 /etc/kyt/limit/vmess/ip/$change
            sleep 1
            echo "$limitnew" >> /etc/kyt/limit/vmess/ip/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-vmess
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vmess
        fi
    fi
}
function resetquotavmess(){
    clear
    data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE       Reset Usage               $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 Usage       "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/limit/vmess"

        cekada=$(grep -c -E "^### " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-vmess
        fi

            for akun in "${data[@]}"; do
                    if [ ! -e /etc/limit/vmess/${akun} ]; then
                        gb="No Usage"
                    else
                        wey=$(cat "/etc/limit/vmess/${akun}")
                        gb=$(con "${wey}")
                    fi
                    printf "         %-13s %-7s %-8s %2s\n"     "${akun}" "          $gb"    
            done
    echo -e ""
    read -rp "  Input Username for Reset Usage : " change
    echo -e ""
    if [ -z $change ]; then
        m-vmess
    else
        ceklagi=$(grep -wE "^### $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."
            truncate -s 0 /etc/limit/vmess/$change
            sleep 1
            stop_spinner
            echo -e " ${Green}Success Reset Usage Account${Suffix}"
            sleep 2
            m-vmess
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vmess
        fi
    fi
}

## Limit Untuk Vless
function changelimitquotavless(){
    clear
    data=( `cat /etc/xray/config.json | grep '#&' | cut -d ' ' -f 2 | sort | uniq`);
    defaultgb="60"
    d=$((${defaultgb} * 1024 * 1024 * 1024))

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit Quota              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 Quota       "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/vless"

        cekada=$(grep -c -E "^#& " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-vless
        fi

        for akun in "${data[@]}"; do
                if [ ! -e /etc/vless/${akun} ]; then
                    gb="Unlimited"
                else
                    wey=$(cat "/etc/vless/${akun}")
                    gb=$(con "${wey}")
                fi
                printf "         %-13s %-7s %-8s %2s\n"    "${akun}" "          $gb"
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-vless
    else
        ceklagi=$(grep -wE "^#& $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."

            if [[ $limitnew -eq 0 ]]; then
                echo > /dev/null 2>&1
            fi

            truncate -s 0 /etc/vless/$change
            sleep 1
            lmn=$((${limitnew} * 1024 * 1024 * 1024))
            echo "$lmn" >> /etc/vless/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-vless
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vless
        fi
    fi
}
function changeiplimitvless(){
    clear
    data=( `cat /etc/xray/config.json | grep '#&' | cut -d ' ' -f 2 | sort | uniq`);
    defaultip="5"

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit IP              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 IP Limit     "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/kyt/limit/vless/ip"
        cekada=$(grep -c -E "^#& " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-vless
        fi

        for akun in "${data[@]}"; do
                if [ ! -e ${directory}/${akun} ]; then
                    iplimit="Unlimited"
                else
                    iplimit=$(cat $directory/$akun)
                fi
                printf "         %-13s %-7s %-8s %2s\n"   "${akun}" "          $iplimit IP";     
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-vless
    else
        ceklagi=$(grep -wE "^#& $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."

            if [[ $limitnew -eq 0 ]]; then
                echo > /dev/null 2>&1
            fi

            truncate -s 0 /etc/kyt/limit/vless/ip/$change
            sleep 1
            echo "$limitnew" >> /etc/kyt/limit/vless/ip/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-vless
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vless
        fi
    fi
}
function resetquotavless(){
    clear
    data=( `cat /etc/xray/config.json | grep '#&' | cut -d ' ' -f 2 | sort | uniq`);

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE       Reset Usage               $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 Usage       "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/limit/vless"
        cekada=$(grep -c -E "^#& " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-vless
        fi

            for akun in "${data[@]}"; do
                    if [ ! -e /etc/limit/vless/${akun} ]; then
                        gb="No Usage"
                    else
                        wey=$(cat "/etc/limit/vless/${akun}")
                        gb=$(con "${wey}")
                    fi
                    printf "         %-13s %-7s %-8s %2s\n"     "${akun}" "          $gb"         
            done
    echo -e ""
    read -rp "  Input Username for Reset Usage : " change
    echo -e ""
    if [ -z $change ]; then
        m-vless
    else
        ceklagi=$(grep -wE "^#& $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."
            truncate -s 0 /etc/limit/vless/$change
            sleep 1
            stop_spinner
            echo -e " ${Green}Success Reset Usage Account${Suffix}"
            sleep 2
            m-vless
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vless
        fi
    fi
}

## Limit Untuk Trojan
function changelimitquotatrojan(){
    data=( `cat /etc/xray/config.json | grep '#!' | cut -d ' ' -f 2 | sort | uniq`);
    defaultgb="60"
    d=$((${defaultgb} * 1024 * 1024 * 1024))

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit Quota              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 Quota       "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/trojan"

        cekada=$(grep -c -E "^#! " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-trojan
        fi

        for akun in "${data[@]}"; do
                if [ ! -e /etc/trojan/${akun} ]; then
                    gb="Unlimited"
                else
                    wey=$(cat "/etc/trojan/${akun}")
                    gb=$(con "${wey}")
                fi
                printf "         %-13s %-7s %-8s %2s\n"    "${akun}" "          $gb"        
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-trojan
    else
        ceklagi=$(grep -wE "^#! $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."

            if [[ $limitnew -eq 0 ]]; then
                echo > /dev/null 2>&1
            fi

            truncate -s 0 /etc/trojan/$change
            sleep 1
            lmn=$((${limitnew} * 1024 * 1024 * 1024))
            echo "$lmn" >> /etc/trojan/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-trojan
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-trojan
        fi
    fi
}
function changeiplimittrojan(){
    clear
    data=( `cat /etc/xray/config.json | grep '#!' | cut -d ' ' -f 2 | sort | uniq`);
    defaultip="5"

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit IP              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 IP Limit     "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/kyt/limit/trojan/ip"
        cekada=$(grep -c -E "^#! " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-trojan
        fi

        for akun in "${data[@]}"; do
                if [ ! -e ${directory}/${akun} ]; then
                    iplimit="Unlimited"
                else
                    iplimit=$(cat $directory/$akun)
                fi
                printf "         %-13s %-7s %-8s %2s\n"   "${akun}" "          $iplimit IP";         
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-trojan
    else
        ceklagi=$(grep -wE "^#! $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."

            if [[ $limitnew -eq 0 ]]; then
                echo > /dev/null 2>&1
            fi

            truncate -s 0 /etc/kyt/limit/trojan/ip/$change
            sleep 1
            echo "$limitnew" >> /etc/kyt/limit/trojan/ip/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-trojan
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-trojan
        fi
    fi
}
function resetquotatrojan(){
    clear
    data=( `cat /etc/xray/config.json | grep '#!' | cut -d ' ' -f 2 | sort | uniq`);

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE       Reset Usage               $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 Usage       "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/limit/trojan"
        cekada=$(grep -c -E "^#! " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-trojan
        fi

            for akun in "${data[@]}"; do
                    if [ ! -e /etc/limit/trojan/${akun} ]; then
                        gb="No Usage"
                    else
                        wey=$(cat "/etc/limit/trojan/${akun}")
                        gb=$(con "${wey}")
                    fi
                    printf "         %-13s %-7s %-8s %2s\n"     "${akun}" "          $gb"       
            done
    echo -e ""
    read -rp "  Input Username for Reset Usage : " change
    echo -e ""
    if [ -z $change ]; then
        m-trojan
    else
        ceklagi=$(grep -wE "^#! $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."
            truncate -s 0 /etc/limit/trojan/$change
            sleep 1
            stop_spinner
            echo -e " ${Green}Success Reset Usage Account${Suffix}"
            sleep 2
            m-trojan
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-trojan
        fi
    fi
}

## Limit Shadowshock
function changelimitquotashadowshocks(){
    data=( `cat /etc/xray/config.json | grep '#!#' | cut -d ' ' -f 2 | sort | uniq`);
    defaultgb="60"
    d=$((${defaultgb} * 1024 * 1024 * 1024))

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit Quota              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 Quota       "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/shadowsocks"

        cekada=$(grep -c -E "^#!# " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-ssws
        fi

        for akun in "${data[@]}"; do
                if [ ! -e /etc/shadowsocks/${akun} ]; then
                    gb="Unlimited"
                else
                    wey=$(cat "/etc/shadowsocks/${akun}")
                    gb=$(con "${wey}")
                fi
                printf "         %-13s %-7s %-8s %2s\n"    "${akun}" "          $gb"        
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-ssws
    else
        ceklagi=$(grep -wE "^#!# $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."

            if [[ $limitnew -eq 0 ]]; then
                echo > /dev/null 2>&1
            fi

            truncate -s 0 /etc/shadowsocks/$change
            sleep 1
            lmn=$((${limitnew} * 1024 * 1024 * 1024))
            echo "$lmn" >> /etc/shadowsocks/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-ssws
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-ssws
        fi
    fi
}
function changeiplimitshadowshocks(){
    clear
    data=( `cat /etc/xray/config.json | grep '#!#' | cut -d ' ' -f 2 | sort | uniq`);
    defaultip="5"

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit IP              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 IP Limit     "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/kyt/limit/shadowshocks/ip"
        cekada=$(grep -c -E "^#!# " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-ssws
        fi

        for akun in "${data[@]}"; do
                if [ ! -e ${directory}/${akun} ]; then
                    iplimit="Unlimited"
                else
                    iplimit=$(cat $directory/$akun)
                fi
                printf "         %-13s %-7s %-8s %2s\n"   "${akun}" "          $iplimit IP";         
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-ssws
    else
        ceklagi=$(grep -wE "^#!# $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."

            if [[ $limitnew -eq 0 ]]; then
                echo > /dev/null 2>&1
            fi

            truncate -s 0 /etc/kyt/limit/shadowshocks/ip/$change
            sleep 1
            echo "$limitnew" >> /etc/kyt/limit/shadowshocks/ip/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-ssws
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-ssws
        fi
    fi
}
function resetquotashadowshocks(){
    clear
    data=( `cat /etc/xray/config.json | grep '#!#' | cut -d ' ' -f 2 | sort | uniq`);

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE       Reset Usage               $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e "         Username                 Usage       "
    echo -e " ${z} ------------------------------------------ ${NC}"
    echo -e ""
        directory="/etc/limit/shadowshocks"
        cekada=$(grep -c -E "^#!# " "/etc/xray/config.json")

        if [ $cekada == "0" ]; then
            echo -e "          No Exiting Client!"
            sleep 2
            m-ssws
        fi

            for akun in "${data[@]}"; do
                    if [ ! -e /etc/limit/shadowshocks/${akun} ]; then
                        gb="No Usage"
                    else
                        wey=$(cat "/etc/limit/shadowshocks/${akun}")
                        gb=$(con "${wey}")
                    fi
                    printf "         %-13s %-7s %-8s %2s\n"     "${akun}" "          $gb"       
            done
    echo -e ""
    read -rp "  Input Username for Reset Usage : " change
    echo -e ""
    if [ -z $change ]; then
        m-ssws
    else
        ceklagi=$(grep -wE "^#!# $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."
            truncate -s 0 /etc/limit/shadowshocks/$change
            sleep 1
            stop_spinner
            echo -e " ${Green}Success Reset Usage Account${Suffix}"
            sleep 2
            m-ssws
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-ssws
        fi
    fi
}