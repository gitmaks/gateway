#!/bin/bash

while true
do
	inotifywait -e create,modify,delete /etc/nginx/conf.d
	nginx -t
	if [ $? -eq 0 ]
	then
		echo 'whoray'
		nginx -s reload
	fi
done
