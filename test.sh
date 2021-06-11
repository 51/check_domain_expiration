#!/bin/sh
dir=$(dirname "$0")
whois=$dir/whois.sh
sh=${SH:-/bin/sh}
printf "\n%-20s %-35s %-16s %-12s %-35s\n" "Domain" "Registrar" "Expires" "Days Left"  "NameServer"
echo "------------------- ----------------------------------- --------------- ------------- ----------------------------"
for domain in ${*:-$(grep -Ev '^#' "$dir/domains")}; do
	server=${domain##*:}
	domain=${domain%%:*}
	server=${server#$domain}
	#echo "-> $domain"
	$sh -$- ./check_domain.sh -d $domain
	#echo "<- $domain"
done

exit 0
