#!/bin/bash

HomeDirVISA=/home/dsiddiqui/AppsUtilityMenu/VISA
HomeDir80byte=/home/dsiddiqui/AppsUtilityMenu/80byte
HomeDir80bytescripts=/home/dsiddiqui/AppsUtilityMenu/80byte/scripts
HomeDir80bytemcc=/home/dsiddiqui/AppsUtilityMenu/80byte/scripts/multiCurrency
HomeDirstatements=/home/dsiddiqui/AppsUtilityMenu/statements
HomeDirdiners=/home/dsiddiqui/AppsUtilityMenu/Diners
HomeDirFileMenu=/home/dsiddiqui/AppsUtilityMenu/FilesMenu

printf "\n\tMain Menu\n"
printf "\n\n\t   VISA:\n\n\t\t1) VISA currency change\n\t\t2) reverse visa clearing\n\t\t3) retotal visa file\n\t\t4) extract_arn_from_baseII\n\n\t   80BYTE:\n\n\t\t5) 80 Byte Dump Utility\n\t\t6) replace oci 80byte\n\t\t7) extract non ascii chars\n\t\t8) extract invalid card type\n\t\t9) extract batch summary with trailing record\n\t\t10) extract 80byte tran\n\t\t11) check for DCC\n\t\t12) change date 80 bytes\n\t\t13) find multi currency batches\n\n\t   STATEMENTS:\n\n\t\t14) extract merchant statement\n\n\t   DINERS:\n\n\t\t15) diners fallover\n\n\t   FILE MENU:\n\n\t\t16) archive file\n\t\t17) extract non ascii chars file menu\n"
read optn

case "$optn" in

	1)
		$HomeDirVISA/amend_000_s36_to_036_currency.sh
		;;
	2)	$HomeDirVISA/reverse_visa_clearing_v5.sh
		;;
	3)	$HomeDirVISA/retotal_visa_file.awk
		;;
	4)	$HomeDirVISA/extract_arn_from_baseII.awk	
		;;
	5)  $HomeDir80byte/omnipay_dump_utility.sh
		;;
	6)  $HomeDir80bytescripts/replace_OCI_80byte.sh
		;;
	7)  $HomeDir80bytescripts/extract_non-ascii_chars.sh
		;;
	8)  $HomeDir80bytescripts/extract_invalid_card_type.sh
		;;
	9)	$HomeDir80bytescripts/extract_batch_summary_with_trailing_record.sh
		;;
	10) $HomeDir80bytescripts/extract_80bte_tran.sh
		;;
	11) $HomeDir80bytescripts/check_for_DCC.sh
		;;
	12) $HomeDir80bytescripts/Change_date_80_bytes.pl
		;;
	13) $HomeDir80bytemcc/find_multi_currency_batches.sh
		;;
	14) $HomeDirstatements/extract_merchant_statement.sh
		;;
	15) $HomeDirdiners/diners_fallover.sh
		;;	
	16) $HomeDirFileMenu/archive_file.sh
		;;	
	17) $HomeDirFileMenu/extract_non-ascii_chars.sh
		;;
esac
