#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "app.mjs" ]
