#!/bin/bash

# DSID 30/08/17 created menu based apps utility

HomeDir=/home/dsiddiqui/AppsUtilityMenu/scripts
HomeDir80bytemcc=/home/dsiddiqui/AppsUtilityMenu/scripts/multiCurrency
HomeDirMC=/home/dsiddiqui/AppsUtilityMenu/Manage_IPM

func_visa_scripts()
{
case "$visa_optn" in

	a)	/usr/bin/clear
		echo -e "\n....calling the amend VISA script\n"
		$HomeDir/amend_000_s36_to_036_currency.sh
		;;
	b)	/usr/bin/clear
		echo -e "\n....calling the reverse visa clearing script\n"
		$HomeDir/reverse_visa_clearing_v5.sh
		;;
	c)	/usr/bin/clear
		echo -e "\n....calling the retotal visa file script\n"
		$HomeDir/retotal_visa_file.awk
		;;
	d)	/usr/bin/clear
		echo -e "\n....calling the extract arn from baseII script\n"
		$HomeDir/extract_arn_from_baseII.awk	
		;;
esac
}

func_mc_scripts()
{
case "$mc_optn" in

	a)	/usr/bin/clear
		echo -e "\n....calling the manage ipm script\n"
		$HomeDirMC/manage_ipm.sh
		;;
esac
}

func_80byte_scripts()
{
case "$optn_80byte" in

	a)  /usr/bin/clear
		echo -e "\n....calling the omnipay dump utility script\n"     #script has error
		$HomeDir/omnipay_dump_utility.sh
		;;
	b)  /usr/bin/clear
		echo -e "\n....calling the replace OCI 80byte script\n"		#script has error
		$HomeDir/replace_OCI_80byte.sh
		;;
	c)  /usr/bin/clear
		echo -e "\n....calling the extract non ascii chars script\n"	
		$HomeDir/extract_non-ascii_chars.sh
		;;
	d)  /usr/bin/clear
		echo -e "\n....calling the extract invalid card type script\n"	#script will not return to main menu
		$HomeDir/extract_invalid_card_type.sh
		;;
	e)	/usr/bin/clear
		echo -e "\n....calling the extract batch summary with trailing record script\n"
		$HomeDir/extract_batch_summary_with_trailing_record.sh
		;;
	f) /usr/bin/clear
		echo -e "\n....calling the extract 80byte tran script\n"		#script will not return to main menu
		$HomeDir/extract_80bte_tran.sh
		;;
	g) /usr/bin/clear
		echo -e "\n....calling the check for DCC script\n"
		$HomeDir/check_for_DCC.sh
		;;
	h) /usr/bin/clear
		echo -e "\n....calling the Change date 80 bytes script\n"		# you have to give date and filename as argument
		$HomeDir/Change_date_80_bytes.pl
		;;
	i) /usr/bin/clear
		echo -e "\n....calling the find multi currency batches script\n"
		$HomeDir80bytemcc/find_multi_currency_batches.sh
		;;
esac
}

func_statements_scripts()
{
case "$optn" in

	14) /usr/bin/clear
		echo -e "\n....calling the extract merchant statement script\n"
		$HomeDir/extract_merchant_statement.sh
		;;
esac
}

func_diners_scripts()
{
case "$optn" in

	15) /usr/bin/clear
		echo -e "\n....calling the diners fallover script\n"
		$HomeDir/diners_fallover.sh
		;;
esac
}

func_file_scripts()
{
case "$optn" in

	16) /usr/bin/clear
		echo -e "\n....calling the archive file script\n"
		$HomeDir/archive_file.sh
		;;	
	17) /usr/bin/clear
		echo -e "\n....calling the extract non ascii_chars script\n"
		$HomeDir/extract_non-ascii_chars.sh
		;;
esac
}

func_visa_menu()
{
printf "\n\t\ta) VISA currency change\n\t\tb) reverse visa clearing\n\t\tc) retotal visa file\n\t\td) extract_arn_from_baseII\n\n"
echo  -n "Enter your choice: "
read visa_optn

func_visa_scripts

}

func_mc_menu()
{
printf "\n\t\ta) manage ipm\n\n"
echo  -n "Enter your choice: "
read mc_optn

func_mc_scripts

}

func_80byte_menu()
{
printf "\n\t\ta) 80 Byte Dump Utility (error in this script)\n\t\tb) replace oci 80byte\n\t\tc) extract non ascii chars\n\t\td) extract invalid card type (script doesn't return to main menu, press Ctrl+C for exiting)\n\t\te) extract batch summary with trailing record\n\t\tf) extract 80byte tran (script doesn't return to main menu, press Ctrl+C for exiting)\n\t\tg) check for DCC\n\t\th) change date 80 bytes (script exits in error)\n\t\ti) find multi currency batches\n\n"
echo  -n "Enter your choice: "
read optn_80byte

func_80byte_scripts
}

func_statements_menu()
{
printf "\n\t\t14) extract merchant statement (script doesn't return to main menu, press Ctrl+C for exiting)\n\n"
echo  -n "Enter your choice: "
read optn

func_statements_scripts
}

func_diners_menu()
{
printf "\n\t\t15) diners fallover (script exits in error)\n\n"
echo  -n "Enter your choice: "
read optn

func_diners_scripts
}

func_file_menu()
{
printf "\n\t\t16) archive file (script exits in error)\n\t\t17) extract non ascii chars file menu\n\n"
echo  -n "Enter your choice: "
read optn

func_file_scripts
}

func_main_menu()
{

printf "\n\tMain Menu\n\n"

echo  -e "\t   \033[33;5m1) VISA\033[0m\n"

echo  -e "\t   \033[33;5m2) MC\033[0m\n"

echo  -e "\t   \033[33;5m3) 80BYTE\033[0m\n"

echo  -e "\t   \033[33;5m4) STATEMENTS\033[0m\n"

echo  -e "\t   \033[33;5m5) DINERS\033[0m\n"

echo  -e "\t   \033[33;5m6) FILE MENU\033[0m\n"


printf "Enter your choice: "
read optn

if [[ "$optn" -eq 1 ]]
then
	func_visa_menu
else 
	if [[ "$optn" -eq 2 ]]
	then
		func_mc_menu
	else
		if [[ "$optn" -eq 3 ]]
		then
			func_80byte_menu
		else
			if [[ "$optn" -eq 4 ]]
			then
				func_statements_menu
			else
				if [[ "$optn" -eq 5 ]]
				then
					func_diners_menu
				else
					if [[ "$optn" -eq 6 ]]
					then
						func_file_menu
					fi
				fi
			fi
		fi
	fi
fi
}


func_main_menu

while :
do
	echo
	read -p "Do you want to return to the main menu:(y/Y), any other key for exiting the script: " anser
	if [[ "$anser" = "y"||$anser = "Y" ]]
	then
		/usr/bin/clear
		func_main_menu
	else
		/usr/bin/clear
		printf "script execution ends here\n\n"
		exit
	fi
done
	


