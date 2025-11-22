FROM node:18-alpine

WORKDIR /usr/src/app

# Install required build tools for native modules
RUN apk add --no-cache python3 make g++ bash

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
