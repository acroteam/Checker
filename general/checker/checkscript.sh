#! /bin/bash

if [[ "$#" != "2" ]] ; then
	echo >&2 "wrong number of arguments"
	exit 1
fi

mkdir $2/tmp
cp /bin/uname $2/tmp/

for var in $(cat $2/versions)
do
	mkdir /lib/modules/$var
	rm -f /lib/modules/$var/build
	ln -s /LinuxHeaders/$var /lib/modules/$var/build
	sed -e "12s/.*/echo "$var"/" -i $2/uname
	rm /bin/uname
	cp $2/uname /bin/

	make -C $1

	if [[ "$?" != "0" ]] ; then
		echo "FAILED TO COMPILE VERSION: $var"
		exit 0
	fi
done

cp $2/tmp/uname  /bin/
rm -rf $2/tmp
	
