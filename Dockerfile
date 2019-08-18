FROM pihole/pihole:latest

WORKDIR /var/www/html

# Pulled from the interactive install script at https://github.com/thomasbnt/Night_PiHole/blob/master/install.sh
RUN git clone https://github.com/thomasbnt/Night_PiHole.git temp
RUN cp temp/skin-blue.min.css admin/style/vendor/skin-blue.min.css
RUN cp temp/AdminLTE.min.css admin/style/vendor/AdminLTE.min.css
RUN cp temp/custom.css admin/style/vendor/custom.css
