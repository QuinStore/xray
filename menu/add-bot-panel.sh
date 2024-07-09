#!/bin/bash

YELLOW="\033[33m"
PURPLE='\e[35m'
blue2='\033[0;36m'
NC='\e[0m'
ORANGE='\033[0;33m'
z="\033[96m"
Suffix="\033[0m"
REDBG="\033[41;37m"
blue='\e[34m'
RED="\033[31m"

source /usr/local/sbin/spiner
# Getting
#satusbot
bot_kyt=$(systemctl status kyt | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE  BOT 
if [[ $bot_kyt == "running" ]]; then 
   status_bot="${GREEN}Online${NC}"
else
   status_bot="${RED}Offline${NC}"
fi
#####
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/QuinStore/reseller/main/izin"

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

clear
MYIP=$(wget -qO- ipinfo.io/ip);
clear 

function bckp_bot(){
  clear
  

  echo -e ""
  echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
  echo -e "      $PURPLE       Set Backup Time              $NC"
  echo -e " ${z}└──────────────────────────────────────────┘${NC}"
  echo -e ""

    botbackupcek="/etc/bot/.bot.db"
    if [ -s "$botbackupcek" ]; then   

      filecektime="/etc/list/.time.db"
      if [ -e "$filecektime" ]; then

        if [ -s "$filecektime" ]; then
          status="${green}ON${NC}"
          timegrep=$(cat /etc/list/.time.db | grep '#time#' | cut -d ' ' -f 2 )
          timegrep2=$(cat /etc/list/.time.db | grep '#time#' | cut -d ' ' -f 3 )
          timecek="${green}$timegrep [$timegrep2]"
          time1="Time-${green}${timecek}${NC}"
        else
          time1="${RED}OFF${NC}"
          status="${RED}OFF${NC}"
        fi

        echo -e "    Status Auto Backup : [$status] - [$time1]"
        echo -e ""
        echo -e "    ${ORANGE} [01].${NC}${blue2} 1 AM${NC}"
        echo -e "    ${ORANGE} [02].${NC}${blue2} 3 AM${NC}"
        echo -e "    ${ORANGE} [03].${NC}${blue2} 6 AM${NC}"
        echo -e "    ${ORANGE} [04].${NC}${blue2} 1 PM${NC}"
        echo -e "    ${ORANGE} [05].${NC}${blue2} 5 PM${NC}"
        echo -e "    ${ORANGE} [06].${NC}${blue2} Off Auto Backup Bot${NC}"
        echo -e ""
        echo -e "    ${ORANGE} [00].${NC}${RED} Back to Panel Bot${NC}"
        echo -e ""
        read -rp"    Select Option Menu [ Press ENTER to Back ]: " botmenu
        if [ -z $botmenu ]; then
          clear
          add-bot-panel
        else
          case $botmenu in
            1 | 01)
            start_spinner " Making 1 AM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 1 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            echo "#time# 1 AM" >>/etc/list/.time.db
            sleep 1
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            2 | 02)
            start_spinner " Making 3 AM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 3 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            echo "#time# 3 AM" >>/etc/list/.time.db
            sleep 1
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            3 | 03)
            start_spinner " Making 6 AM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 6 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            echo "#time# 6 AM" >>/etc/list/.time.db
            sleep 1
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            4 | 04)
            start_spinner " Making 1 PM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 13 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            echo "#time# 1 PM" >>/etc/list/.time.db
            sleep 1
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            5 | 05)
            start_spinner " Making 5 PM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 17 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            sleep 1
            echo "#time# 5 PM" >>/etc/list/.time.db
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            6 | 06)
            start_spinner " Off Auto Backup..."
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            0 | 00)
            clear
            add-bot-panel
            ;;
          esac
        fi
      else
          start_spinner " Making File data Bot..."
          mkdir /etc/list
          echo "test" >"/etc/list/.time.db"
          truncate -s 0 /etc/list/.time.db
          sleep 2
          stop_spinner
          echo -e " ${green}Success Make file${Suffix}"
          sleep 1
          echo -e " ${green}Refresh...${Suffix}"
          add-bot-panel
      fi
    else
      echo -e "    ${ORANGE}[*]${NC}${blue2} Please Add Bot Notif & Backup First"
      sleep 3
      add-bot-panel
    fi
}

function chbtf(){
  clear

  botapi=$(cat /etc/bot/.bot.db | grep "^#bot#" | cut -d ' ' -f 2 | sort | uniq)
  chatid=$(cat /etc/bot/.bot.db | grep "^#bot#" | cut -d ' ' -f 3 | sort | uniq)

  echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
  echo -e "$PURPLE        Change Bot Notif & Backup        $NC"
  echo -e " ${z}└──────────────────────────────────────────┘${NC}"
  echo -e ""
  echo -e "    ${RED}Please Becareful to change Bot API and Chat ID${NC}"
  echo -e ""
  echo -e "    This our BOT API : [ ${botapi} ]"
  echo -e ""
  echo -e "    This our CHAT ID : [ ${chatid} ]"
  echo -e ""
  read -rp " BOT API : " bot
  read -rp " CHAT ID : " chat
  echo -e ""
  if [ -z $bot ]; then
    clear
    add-bot-panel
  else
    start_spinner " ${GREEN}Please wait, Change Bot Notif and Backup...${NC}"
    sed -i "/#bot# $botapi $chatid/c\#bot# $bot $chat" /etc/bot/.bot.db
    stop_spinner
    echo -e " ${GREEN}Success Change Bot...${Suffix}"
    sleep 2
    add-bot-panel
  fi
}

echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "         ${PURPLE}       MENU BOT PANEL            "
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e "" 
echo -e "   ${ORANGE}📫︎${NC} Status Bot : [ ${status_bot} ]"
echo -e ""
echo -e " ${ORANGE}   [01].${NC}${blue2} Add Bot Panel${NC}"
echo -e " ${ORANGE}   [02].${NC}${blue2} Delete Bot Panel${NC}"
echo -e " ${ORANGE}   [03].${NC}${blue2} Stop Bot Panel${NC}"
echo -e " ${ORANGE}   [04].${NC}${blue2} Restart Bot Panel${NC}"
echo -e " ${ORANGE}   [05].${NC}${blue2} AUTO Backup VPS [ file to Bot ]${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE           Set Bot Notif              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e " ${ORANGE}   [06].${NC}${blue2} Add Bot Notif & Backup${NC}"
echo -e " ${ORANGE}   [07].${NC}${blue2} Change Bot Notif & Backup${NC}"
echo -e " ${ORANGE}   [08].${NC}${blue2} Delete Bot Notif & Backup${NC}"
echo -e ""
echo -e " ${ORANGE}   [00].${NC}${RED} \e[31mBack To Menu${NC}"
echo -e ""
read -rp " Select menu [ 1-9 ]:  "  opt
echo -e   ""
case $opt in
1 | 01)
  clear
  wget https://raw.githubusercontent.com/QuinStore/xray/main/kyt.sh && chmod +x kyt.sh && ./kyt.sh
  ;;
2 | 02)
  clear
  hapus-bot
  ;;
3 | 03)
  clear
  stop-bot
  ;;
4 | 04)
  clear
  restart-bot
  ;;
5 | 05)
  clear
  bckp_bot
  ;;
6 | 06)
  clear
  add-bot-notif
  ;;
7 | 07)
  clear
  chbtf
  ;;
8 | 08)
  clear
  del-bot-notif
  ;;
0 | 00)
  clear
  menu
  ;;
*)
  clear
  menu
  ;;
esac