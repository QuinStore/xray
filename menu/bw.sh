#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\E[0;100;33m      â€¢ BANDWITH MONITOR â€¢         \E[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "" 
echo -e " [\e[36mâ€¢1\e[0m] Lihat Total Bandwith Tersisa"
echo -e " [\e[36mâ€¢2\e[0m] Tabel Penggunaan Setiap 5 Menit"
echo -e " [\e[36mâ€¢3\e[0m] Tabel Penggunaan Setiap Jam"
echo -e " [\e[36mâ€¢4\e[0m] Tabel Penggunaan Setiap Hari"
echo -e " [\e[36mâ€¢5\e[0m] Tabel Penggunaan Setiap Bulan"
echo -e " [\e[36mâ€¢6\e[0m] Tabel Penggunaan Setiap Tahun"
echo -e " [\e[36mâ€¢7\e[0m] Tabel Penggunaan Tertinggi"
echo -e " [\e[36mâ€¢8\e[0m] Statistik Penggunaan Setiap Jam"
echo -e " [\e[36mâ€¢9\e[0m] Lihat Penggunaan Aktif Saat Ini"
echo -e " [\e[36m10\e[0m] Lihat Trafik Penggunaan Aktif Saat Ini [5s]"
echo -e "" 
echo -e " [\e[31mâ€¢0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e " [\e[31mâ€¢x\e[0m] Keluar"
echo -e "" 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m â€¢ TOTAL BANDWITH SERVER TERSISA â€¢ \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

2)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m â€¢ TOTAL BANDWITH SETIAP 5 MENIT â€¢ \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat -5

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

3)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m   â€¢ TOTAL BANDWITH SETIAP JAM â€¢   \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat -h

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

4)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m  â€¢ TOTAL BANDWITH SETIAP HARI â€¢   \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat -d

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

5)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m  â€¢ TOTAL BANDWITH SETIAP BULAN â€¢  \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat -m

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

6)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m  â€¢ TOTAL BANDWITH SETIAP TAHUN â€¢  \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat -y

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

7)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m    â€¢ TOTAL BANDWITH TERTINGGI â€¢   \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat -t

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

8)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m â€¢ STATISTIK TERPAKAI SETIAP JAM â€¢ \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat -hg

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

9)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33m     â€¢ LIVE BANDWITH SAAT INI â€¢    \e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e   " Press [ Ctrl+C ] â€¢ To-Exit"
echo -e ""

vnstat -l

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

10)
clear 
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e "\e[0;100;33mâ€¢ LIVE TRAFIK PENGGUNAAN BANDWITH â€¢\e[0m"
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""

vnstat -tr

echo -e ""
echo -e "${ORANGE}────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

0)
sleep 1
menu
;;
x)
exit
;;
*)
echo -e ""
echo -e "Kesalahan Input"
sleep 1
bw
;;
esac