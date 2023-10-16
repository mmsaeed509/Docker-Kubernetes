#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

# Use an official node image #
FROM node

# working dir #
WORKDIR /app

# Copy the current directory contents into the container at /app #
COPY . /app

# Install any needed packages #
RUN npm install

# Make port 80 available to the world outside this container #
EXPOSE 80

# Run app.py when the container launches #
CMD ["node", "server.js"]
