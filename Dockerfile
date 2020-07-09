FROM pihole/pihole:latest

WORKDIR /var/www/html

# Pulled from the interactive install script at https://github.com/thomasbnt/Night_PiHole/blob/master/install.sh
RUN git clone https://github.com/thomasbnt/Night_PiHole.git temp
RUN cp temp/skin-blue.min.css admin/style/vendor/skin-blue.min.css
RUN cp temp/AdminLTE.min.css admin/style/vendor/AdminLTE.min.css
RUN cp temp/custom.css admin/style/vendor/custom.css

# https://github.com/JavanXD/ya-pihole-list#yet-another-pi-hole-list
# adlists-updater.sh is hard-coded to use /home/pi
WORKDIR /home
RUN git clone --depth=1 https://github.com/JavanXD/ya-pihole-list.git pi
RUN chmod a+x /home/pi/adlists-updater.sh
RUN crontab -l | { cat | grep -v 'adlists-updater.sh'; echo "0 */12 * * * /home/pi/adlists-updater.sh >/dev/null"; echo "@reboot sleep 60; /home/pi/adlists-updater.sh >/dev/null"; } | crontab -
