#!/bin/bash

HomeDir=/home/dsiddiqui/AppsUtilityMenu/scripts
HomeDir80bytemcc=/home/dsiddiqui/AppsUtilityMenu/scripts/multiCurrency

printf "\n\tMain Menu\n\n"

echo  -e "\t   \033[33;5mVISA\033[0m\n"
printf "\t\t1) VISA currency change\n\t\t2) reverse visa clearing\n\t\t3) retotal visa file\n\t\t4) extract_arn_from_baseII\n\n"

echo  -e "\t   \033[33;5m80BYTE\033[0m\n"
printf "\t\t5) 80 Byte Dump Utility\n\t\t6) replace oci 80byte\n\t\t7) extract non ascii chars\n\t\t8) extract invalid card type\n\t\t9) extract batch summary with trailing record\n\t\t10) extract 80byte tran\n\t\t11) check for DCC\n\t\t12) change date 80 bytes\n\t\t13) find multi currency batches\n\n"

echo  -e "\t   \033[33;5mSTATEMENTS\033[0m\n"
printf "\t\t14) extract merchant statement\n\n"

echo  -e "\t   \033[33;5mDINERS\033[0m\n"
printf "\t\t15) diners fallover\n\n"

echo  -e "\t   \033[33;5mFILE MENU\033[0m\n"
printf "\t\t16) archive file\n\t\t17) extract non ascii chars file menu\n\n"

echo  -n "Enter your choice: "

read optn

case "$optn" in

	1)
		echo -e "\nYou have chosen a VISA option....calling the amend VISA script\n"
		$HomeDir/amend_000_s36_to_036_currency.sh
		;;
	2)	$HomeDir/reverse_visa_clearing_v5.sh
		;;
	3)	$HomeDir/retotal_visa_file.awk
		;;
	4)	$HomeDir/extract_arn_from_baseII.awk	
		;;
	5)  $HomeDir/omnipay_dump_utility.sh
		;;
	6)  $HomeDir/replace_OCI_80byte.sh
		;;
	7)  $HomeDir/extract_non-ascii_chars.sh
		;;
	8)  $HomeDir/extract_invalid_card_type.sh
		;;
	9)	$HomeDir/extract_batch_summary_with_trailing_record.sh
		;;
	10) $HomeDir/extract_80bte_tran.sh
		;;
	11) $HomeDir/check_for_DCC.sh
		;;
	12) $HomeDir/Change_date_80_bytes.pl
		;;
	13) $HomeDir80bytemcc/find_multi_currency_batches.sh
		;;
	14) $HomeDir/extract_merchant_statement.sh
		;;
	15) $HomeDir/diners_fallover.sh
		;;	
	16) $HomeDir/archive_file.sh
		;;	
	17) $HomeDir/extract_non-ascii_chars.sh
		;;
esac
