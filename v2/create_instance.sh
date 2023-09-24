#!/bin/bash

red='\e[31m'    #အနီရောင်
#yellow='\e[0;33m' #Regular Color
#yellow='\e[43m' #Background
yellow1='\e[0;93m' #High Intensty
#yellow='\e[1;93m' #Bold High Intensty
#yellow='\e[0;93m' #High Intensty backgrounds
#yellow='\e[4;33m' #Underline
yellow='\e[1;33m' #Bold
gray='\e[90m'   #မီးခိုးရောင်
green='\e[92m'  #အစိမ်းရောင်
blue='\e[94m'   #အပြာရောင်
magenta='\e[95m'#ပန်းခရမ်းရောင်
cyan='\e[96m'   #စိမ်းပြာရောင်
none='\e[0m'    #အရောင်မရှိ
plain='\033[0m'

if [[ -n $1 ]] && [[ $2 == e2-* ]] && [[ -n $3 ]] && [[ -n $4 ]] && [[ -n $5 ]] && [[ -n $6 ]] && [[ -n $7 ]] && [[ $(($(date +%s) - $7)) -lt 120 ]] && [[ $(($(date +%s) - $7)) -ge 0 ]]; then

echo -e "${yellow}Creating instance ...${plain}"
instance=$(gcloud dataproc clusters create $1 --region $4 --master-machine-type $2 --master-boot-disk-size 500 --num-workers 2 --worker-machine-type $2 --worker-boot-disk-size 500 --image-version $6 --project $5)
echo -e "${green}Instance created.${plain}"

echo -e "${yellow}Checking firewall rule ...${plain}"
if [[ $(gcloud compute firewall-rules list --format='value(allowed)') == *"'IPProtocol': 'all'"* ]]; then
echo -e "${green}Firewall rule already exist.${plain}"
else
echo -e "${yellow}Creating firewall rule ...${plain}"
gcloud compute firewall-rules create $3 --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=all --source-ranges=0.0.0.0/0 --no-user-output-enabled
echo -e "${green}Firewall rule created.${plain}"
fi

#echo -e "\n${green}SSH setup is completed successfully.${plain}\n"
#IP=$(wget -qO- ipv4.icanhazip.com)
#echo ""
#echo -e "\033[1;32m===================================="
#echo -e "\033[1;32m   🌺ㅤONLY/:FORYOU&ALLㅤ🌺  " 
#echo -e "\033[1;32m===================================="
#echo ""
#echo -e "\033[1;37m◈─────⪧ SSH ACCOUNT ⪦─────◈"
#echo ""
#echo -e "\033[1;32m◈ Host / IP   :⪧  \033[1;31m$IP"
#echo -e "\033[1;32m◈ Port        :⪧  \033[1;31m22"
#echo -e "\033[1;32m◈ Username    :⪧  \033[1;31m$5"
#echo -e "\033[1;32m◈ Password    :⪧  \033[1;31m$6"
#echo -e "\033[1;32m◈ Login Limit :⪧  \033[1;31m$sshlimiter"
#echo -e "\033[1;32m◈ Expire Date :⪧  \033[1;31m$gui"
#echo ""
#echo -e "\033[1;37m◈────⪧ ✿ ✿ 4▪0▪4 ✿ ✿ ⪦────◈"
#echo ""

#echo -e "IP :  ${green}$(wget -qO- ipv4.icanhazip.com <<<"$instance")${plain}"
echo ""
echo -e "${yellow}------------------------------------${plain}"
printf "Developed the script by \n"
echo -e "${yellow}------------------------------------${plain}"

echo -e "${yellow1}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"
echo -e "${cyan} ___   ___          ________          ___   ___                               ${plain}"
echo -e "${cyan}|\  \ |\  \        |\   __  \        |\  \ |\  \                              ${plain}"
echo -e "${cyan}\ \  \|_\  \       \ \  \|\  \       \ \  \|_\  \                             ${plain}"
echo -e "${cyan} \ \______  \       \ \  \/\  \       \ \______  \                            ${plain}"
echo -e "${cyan}  \|_____|\  \       \ \  \/\  \       \|_____|\  \                           ${plain}"
echo -e "${cyan}         \ \__\       \ \_______\             \ \__\                          ${plain}"
echo -e "${cyan}          \|__|        \|_______|              \|__|                          ${plain}"
echo -e "${yellow1}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"

echo -e "${cyan}i am 404 😎 ${plain}"

else
echo -e "${red}Token is invalid or expired. Contact the developer https://t.me/nkka404 for more information.${plain}"
fi
