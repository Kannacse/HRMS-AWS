FROM node:18-alpine

WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your app code
COPY . .

# Open the port your Node app uses
EXPOSE 5100

# START COMMAND
CMD ["node", "server.js"]