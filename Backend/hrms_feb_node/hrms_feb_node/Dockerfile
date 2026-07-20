FROM node:18-alpine

WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy application source
COPY . .

# Application listens on port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
