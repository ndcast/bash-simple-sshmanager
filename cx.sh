#!/bin/bash
#path to where you store your list file (make it a place only accesible to your user add chmod 500 to it after editing it)
Lpath=/home/myuser/.lst
echo usage : cx [keyword of entry] 
  #sourcing the Kpath var on the list file
source $Lpath
  #assigning the 1st argument to search in list file
look4=$1
  # func to grep the values in the list file
function Kgrep ()
{
  grep -i $look4 $Lpath | cut -d";" -f$2 | head -n 1
  return 1
}
  # providing feedback of entry found
echo Found :; Kgrep $look4 1; echo
read -p "DO you really wanna connext? (y/n)" conf 
if [ "${conf,,}" == "y" ] ;
then
	echo;
	# concatenating the Kpath value with the key file to pass on the next line.
	ssh -i $Kpath$(Kgrep $look4 2)
else 
   echo Not Connecting
fi
