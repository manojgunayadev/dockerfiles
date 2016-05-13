##
## Create Set Root Password Script. Name it as set_root_pw.sh. Save it in a folder
##

#!/bin/bash
if [ -f /.root_pw_set ]; then
echo "Root password already set!"
exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] &amp;&amp; echo "preset" || echo "random" )
echo "=&gt; Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=&gt; Done!"
touch /.root_pw_set

echo "========================================================================"
echo "You can now connect to this CentOS container via SSH using:"
echo ""
echo "    ssh -p  root@"
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"