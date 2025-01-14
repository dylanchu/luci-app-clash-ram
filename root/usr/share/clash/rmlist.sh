#!/bin/bash /etc/rc.common

# shellcheck source=/dev/null
. /lib/functions.sh

name=$(uci get clash.config.config_name_remove 2>/dev/null)
check_match_name=$(grep -F "$name" "/usr/share/clash/backup/confit_list.conf")
line_no=$(grep -n "$check_match_name" /usr/share/clash/backup/confit_list.conf | awk -F ':' '{print $1}')
if [ -n "$check_match_name" ]; then
    sed -i "${line_no}d" /usr/share/clash/backup/confit_list.conf
    rm -rf "/usr/share/clash/config/sub/${name}"
    sed -i '/^$/d' /usr/share/clash/backup/confit_list.conf
    rm -rf "/usr/share/clash/config/sub/${name}"
fi
