# Build stage
FROM node:18-bullseye AS builder

WORKDIR /usr/src/app

# Install build tools for node-gyp modules
RUN apt-get update && apt-get install -y python3 make g++ && apt-get clean

COPY package*.json ./

RUN npm ci --unsafe-perm

COPY . .

# Runtime stage
FROM node:18-bullseye

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

EXPOSE 3000
CMD ["node", "index.js"]
