#-------------------------------------------------------------------------------

function sleep_with_message {
		sleeploop=$1
		sleepintv=$2;
		sleeptotal=$(( sleepintv*sleeploop  ))
		echo "------->  Night for approx. $sleeptotal sec "
		COUNTER=0
		while [ "$COUNTER" != "$sleeploop" ]
		do 
			COUNTER=$[$COUNTER +1]
			sleepmeg=$(curl -X GET --silent --show-error --fail https://geek-jokes.sameerkumar.website/api)
			echo -ne "\r $sleepmeg"; 
			sleep $sleepintv; 
		done
		echo "------->  Morning here! "
}