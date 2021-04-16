pgrep vsftpd
return_vsftpd=$?

if [ $return_vsftpd = 0 ]; then
    exit 0
else
    exit 1
fi