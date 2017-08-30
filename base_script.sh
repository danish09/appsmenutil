#!/bin/bash

set -x

HomeDir=/home/dsiddiqui/AppsUtilityMenu/scripts
HomeDir80bytemcc=/home/dsiddiqui/AppsUtilityMenu/scripts/multiCurrency

func_visa_options()
{
case "$optn" in

	1)	/usr/bin/clear
		echo -e "\nYou have chosen the VISA option....calling the amend VISA script\n"
		$HomeDir/amend_000_s36_to_036_currency.sh
		;;
	2)	/usr/bin/clear
		echo -e "\nYou have chosen the VISA option....calling the amend VISA script\n"
		$HomeDir/reverse_visa_clearing_v5.sh
		;;
	3)	/usr/bin/clear
		echo -e "\nYou have chosen the VISA option....calling the amend VISA script\n"
		$HomeDir/retotal_visa_file.awk
		;;
	4)	/usr/bin/clear
		echo -e "\nYou have chosen the VISA option....calling the amend VISA script\n"
		$HomeDir/extract_arn_from_baseII.awk	
		;;
esac
}

func_80byte_options()
{
case "$optn" in

	5)  /usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE option....calling the omnipay dump utility script\n"
		$HomeDir/omnipay_dump_utility.sh
		;;
	6)  /usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE option....calling the replace OCI 80byte script\n"
		$HomeDir/replace_OCI_80byte.sh
		;;
	7)  /usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE option....calling the extract non ascii chars script\n"
		$HomeDir/extract_non-ascii_chars.sh
		;;
	8)  /usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE option....calling the extract invalid card type script\n"
		$HomeDir/extract_invalid_card_type.sh
		;;
	9)	/usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE option....calling the extract batch summary with trailing record script\n"
		$HomeDir/extract_batch_summary_with_trailing_record.sh
		;;
	10) /usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE option....calling the extract 80byte tran script\n"
		$HomeDir/extract_80bte_tran.sh
		;;
	11) /usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE option....calling the check for DCC script\n"
		$HomeDir/check_for_DCC.sh
		;;
	12) /usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE option....calling the Change date 80 bytes script\n"
		$HomeDir/Change_date_80_bytes.pl
		;;
	13) /usr/bin/clear
		echo -e "\nYou have chosen the 80BYTE mcc option....calling the find multi currency batches script\n"
		$HomeDir80bytemcc/find_multi_currency_batches.sh
		;;
esac
}

func_visa_menu()
{
printf "\t\t1) VISA currency change\n\t\t2) reverse visa clearing\n\t\t3) retotal visa file\n\t\t4) extract_arn_from_baseII\n\n"
echo  -n "Enter your choice: "
read optn
}

func_80byte_menu()
{
printf "\t\t5) 80 Byte Dump Utility\n\t\t6) replace oci 80byte\n\t\t7) extract non ascii chars\n\t\t8) extract invalid card type\n\t\t9) extract batch summary with trailing record\n\t\t10) extract 80byte tran\n\t\t11) check for DCC\n\t\t12) change date 80 bytes\n\t\t13) find multi currency batches\n\n"
echo  -n "Enter your choice: "
read optn
}

func_main_menu()
{

printf "\n\tMain Menu\n\n"

echo  -e "\t   \033[33;5m1) VISA\033[0m\n"

echo  -e "\t   \033[33;5m2) 80BYTE\033[0m\n"

echo  -e "\t   \033[33;5m3) STATEMENTS\033[0m\n"
#printf "\t\t14) extract merchant statement\n\n"

echo  -e "\t   \033[33;5m4) DINERS\033[0m\n"
#printf "\t\t15) diners fallover\n\n"

echo  -e "\t   \033[33;5m5) FILE MENU\033[0m\n"
#printf "\t\t16) archive file\n\t\t17) extract non ascii chars file menu\n\n"

#local optn
echo  -n "Enter your choice: "
read optn

if [[ "$optn" -eq 1 ]]
then
	func_visa_menu
fi
if [[ "$optn" -eq 2 ]]
then
	func_80byte_menu
fi
}




#	14) /usr/bin/clear
#		echo -e "\nYou have chosen the STATEMENTS option....calling the extract merchant statement script\n"
#		$HomeDir/extract_merchant_statement.sh
#		;;
#	15) /usr/bin/clear
#		echo -e "\nYou have chosen the DINERS option....calling the diners fallover script\n"
#		$HomeDir/diners_fallover.sh
#		;;	
#	16) /usr/bin/clear
#		echo -e "\nYou have chosen the FILE MENU option....calling the archive file script\n"
#		$HomeDir/archive_file.sh
#		;;	
#	17) /usr/bin/clear
#		echo -e "\nYou have chosen the FILE MENU option....calling the extract non ascii_chars script\n"
#		$HomeDir/extract_non-ascii_chars.sh
#		;;
#esac
#}

#func_main_menu
#func_options

while :
do
	read -p "Do you want to continue:(y/Y), any other key for exiting the script: " anser
	if [[ "$anser" = "y"||$anser = "Y" ]]
	then
		func_options
	else
		echo "script execution ends here"
		exit
	fi
done
	


