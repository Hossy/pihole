FROM pihole/pihole:latest

# https://github.com/JavanXD/ya-pihole-list#yet-another-pi-hole-list
# adlists-updater.sh is hard-coded to use /home/pi
WORKDIR /home
RUN git clone --depth=1 https://github.com/JavanXD/ya-pihole-list.git pi
RUN chmod a+x /home/pi/adlists-updater.sh
RUN sed -i 's/memory_limit = 128M/memory_limit = 256M/' `find /etc/php -name php.ini | grep 'cgi'`
RUN crontab -l | { cat | grep -v 'adlists-updater.sh'; echo "0 */12 * * * /home/pi/adlists-updater.sh >/dev/null"; echo "@reboot sleep 60; /home/pi/adlists-updater.sh >/dev/null"; } | crontab -
