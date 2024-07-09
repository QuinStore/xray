#!/bin/bash
source /usr/local/sbin/spiner

function configssh(){
    clear

    echo -e ""
    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Show Config SSH              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e "" 
    while read expired
        do
        AKUN="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        status="$(passwd -S $AKUN | awk '{print $2}' )"
        if [[ $ID -ge 1000 ]]; then
            if [[ "$status" = "L" ]]; then
            printf "%-17s %2s %-17s %2s \n" "      $AKUN" "$exp   " "LOCKED${NORMAL}"
            else
            printf "%-17s %2s %-17s %2s \n" "      $AKUN" "$exp   " "UNLOCKED${NORMAL}"
            fi
        fi
    done < /etc/passwd

    echo -e ""
    read -p "   Input Username to Show Config : " show
    cekakun=$(cat /var/www/html/ssh-$show.txt | grep "Username" | cut -d ' ' -f 11)

    if [ -z $show ]; then
        m-sshws
    else
        if [ $cekakun == $show ]; then
        clear

        userssh=$( cat /var/www/html/ssh-$show.txt | grep "Username" | cut -d ' ' -f 11 )
        passsh=$( cat /var/www/html/ssh-$show.txt | grep "Password" | cut -d ' ' -f 11 )
        exp=$( chage -l $show | grep "Account expires" | awk -F": " '{print $2}')
        iplimit=$( cat /etc/kyt/limit/ssh/ip/$show )
        domain=$( cat /etc/xray/domain )

        echo ""
        echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e " SSH OVPN Account Config "
        echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "Username         : $userssh"
        echo -e "Password         : $passsh"
        echo -e "Limit Ip         : ${iplimit} User"
        echo -e "Host             : $domain"
        echo -e "Port OpenSSH     : 443, 80, 22"
        echo -e "Port SSH UDP     : 1-65535"
        echo -e "Port Dropbear    : 443, 109"
        echo -e "Port SSH WS      : 80, 8080, 8081-9999"
        echo -e "Port SSH SSL WS  : 443"
        echo -e "Port SSL/TLS     : 400-900"
        echo -e "Port OVPN WS SSL : 443"
        echo -e "Port OVPN SSL    : 443"
        echo -e "Port OVPN TCP    : 443, 1194"
        echo -e "Port OVPN UDP    : 2200"
        echo -e "BadVPN UDP       : 7100, 7300, 7300"
        echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
        echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "OVPN Download    : https://$domain:81/"
        echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "Save Link Account: https://$domain:81/ssh-$userssh.txt"
        echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "Berakhir Pada    : $exp"
        echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e ""
        read -n 1 -s -r -p "Press any key to back on ssh menu"
        m-sshws
        else
            echo -e "    ${RED} Incorect Username to input, Please Try Again!${NC}"
            sleep 3
            configssh
        fi
    fi
}

