#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY nginx/nginx.conf .

RUN mv nginx.conf default.conf

WORKDIR /var/www/html

COPY src .
