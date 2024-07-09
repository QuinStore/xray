#!/bin/bash
source /usr/local/sbin/spiner
function head(){
   echo -e " ${z}┌─────────────────────────────────────────────┐${NC}"
   echo -e " ${z}$NC$purple            $msg               $NC${z}$NC"
   echo -e " ${z}└─────────────────────────────────────────────┘${NC}"
}

function addbrand(){
    msg="SET BRAND NAME"
    head

    #kondisi on dan off
    cekvmess=$(cat /etc/brand/.brand.db | grep '#vmess#' | cut -d ' ' -f 2 | sort | uniq)
    cekvless=$(cat /etc/brand/.brand.db | grep '#vless#' | cut -d ' ' -f 2 | sort | uniq)
    if [ -z ${cekvmess} ];then
        statusvmess="${RED}OFF${NC}"
    else
        statusvmess="${green}ON${NC}"
    fi

    if [ -z ${cekvless} ];then
        statusvless="${RED}OFF${NC}"
    else
        statusvless="${green}ON${NC}"
    fi

    echo -e "   If indicator Vmess/ Vless ${green}ON${NC} Please dont addnew brand"
    echo -e ""
    echo -e "  Example : Brand-User"
    echo -e ""
    read -p "   Input Brand Name : " name
    echo -e ""
    echo -e "   For Core :"
    echo -e "       [${grenbo}01${NC}]${z} Vmess [$statusvmess]"
    echo -e "       [${grenbo}02${NC}]${z} Vless [$statusvless]"
    echo -e ""
    read -rp " Select For Core, From Option [type x for Exit]: " brand
    echo -e ""
    case $brand in
        1 | 01)
        start_spinner " Please wait, add New data."
        echo "#vmess# ${name}" >>/etc/brand/.brand.db
        stop_spinner
        echo -e " ${Green}Success...${Suffix}"
        sleep 2
        brandname
        ;;
        2 | 02)
        start_spinner " Please wait, add New data."
        core="vless"
        echo "#vless# ${name}" >>/etc/brand/.brand.db
        stop_spinner
        echo -e " ${Green}Success...${Suffix}"
        sleep 2
        brandname
        ;;
    esac
}

function changebrand(){
    msg="CHANGE BRAND NAME"
    head

    cekvmess=$(cat /etc/brand/.brand.db | grep '#vmess#' | cut -d ' ' -f 2 | sort | uniq)
    cekvless=$(cat /etc/brand/.brand.db | grep '#vless#' | cut -d ' ' -f 2 | sort | uniq)
    if [ -z ${cekvmess} ];then
        statusvmess="${RED}OFF${NC}"
    else
        statusvmess="${green}ON${NC}"
    fi

    if [ -z ${cekvless} ];then
        statusvless="${RED}OFF${NC}"
    else
        statusvless="${green}ON${NC}"
    fi

    echo -e ""
    read -p "   Enter New Brand Name : " newname
    echo -e ""
    echo -e "   For Core :"
    echo -e "       [${grenbo}01${NC}]${z} Vmess [$statusvmess]"
    echo -e "       [${grenbo}02${NC}]${z} Vless [$statusvless]"
    echo -e ""
    read -rp " Select For Core, From Option [type x for Exit]: " brand
    echo -e ""
    case $brand in
        1 | 01)
        start_spinner " Please wait, add New data."
        brandnow=$(cat /etc/brand/.brand.db | grep '#vmess#' | cut -d ' ' -f 2 | sort | uniq)
        sed -i "/#vmess# $brandnow/c\#vmess# $newname" /etc/brand/.brand.db
        stop_spinner
        echo -e " ${Green}Success...${Suffix}"
        sleep 2
        brandname
        ;;
        2 | 02)
        start_spinner " Please wait, add New data."
        brandnow=$(cat /etc/brand/.brand.db | grep '#vless#' | cut -d ' ' -f 2 | sort | uniq)
        sed -i "/#vless# $brandnow/c\#vless# $newname" /etc/brand/.brand.db
        stop_spinner
        echo -e " ${Green}Success...${Suffix}"
        sleep 2
        brandname
        ;;
    esac
}

function offbrand(){
    msg="OFF BRAND NAME"
    head

    cekvmess=$(cat /etc/brand/.brand.db | grep '#vmess#' | cut -d ' ' -f 2 | sort | uniq)
    cekvless=$(cat /etc/brand/.brand.db | grep '#vless#' | cut -d ' ' -f 2 | sort | uniq)
    if [ -z ${cekvmess} ];then
        statusvmess="${RED}OFF${NC}"
    else
        statusvmess="${green}ON${NC}"
    fi

    if [ -z ${cekvless} ];then
        statusvless="${RED}OFF${NC}"
    else
        statusvless="${green}ON${NC}"
    fi

    echo -e "   If You off Vmess/Vless, for activate again please addbrand"
    echo -e ""
    echo -e "   Off Brand Name For Core :"
    echo -e "       [${grenbo}01${NC}]${z} Vmess [$statusvmess]"
    echo -e "       [${grenbo}02${NC}]${z} Vless [$statusvless]"
    echo -e ""
    read -rp " Select Name For Core, From Option [type x for Exit]: " brand
    echo -e ""
    case $brand in
        1 | 01)
        start_spinner " Please wait, add New data."
        brandnow=$(cat /etc/brand/.brand.db | grep '#vmess#' | cut -d ' ' -f 2 | sort | uniq)
        sed -i "/^#vmess# $brandnow/,/^},{/d" /etc/brand/.brand.db
        stop_spinner
        echo -e " ${Green}Success...${Suffix}"
        sleep 2
        brandname
        ;;
        2 | 02)
        start_spinner " Please wait, add New data."
        brandnow=$(cat /etc/brand/.brand.db | grep '#vless#' | cut -d ' ' -f 2 | sort | uniq)
        sed -i "/^#vless# $brandnow/,/^},{/d" /etc/brand/.brand.db
        stop_spinner
        echo -e " ${Green}Success...${Suffix}"
        sleep 2
        brandname
        ;;
        x)
        clear
        brandname
        ;;
    esac
}