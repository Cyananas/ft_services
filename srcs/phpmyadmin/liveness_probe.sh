pgrep nginx
return_nginx=$?
pgrep php
return_phpmyadmin=$?

if [ $return_nginx = 0 ] && [ $return_phpmyadmin = 0 ]; then
    exit 0
else
    exit 1
fi
