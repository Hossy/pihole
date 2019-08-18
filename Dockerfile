FROM pihole/pihole:latest

WORKDIR /var/www/html

# Pulled from the interactive install script at https://github.com/thomasbnt/Night_PiHole/blob/master/install.sh
RUN git clone https://github.com/thomasbnt/Night_PiHole.git temp
RUN cp temp/skin-blue.min.css .
RUN cp temp/AdminLTE.min.css .
RUN cp temp/custom.css .
