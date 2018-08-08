#!/bin/bash
while [ true ]
do
    /usr/local/bin/php /var/www/411/bin/cron.php
    echo "cron.php completed"
    /usr/local/bin/php /var/www/411/bin/worker.php
    echo "worker.php completed"
    sleep 60
done