FROM node:18-bullseye AS builder

WORKDIR /app

COPY package*.json ./

# Disable optional deps (fixes most build failures)
#RUN npm config set optional false

# Clean cache and install
RUN npm cache clean --force
RUN npm install --verbose --legacy-peer-deps

COPY . .

FROM node:18-bullseye
WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000
CMD ["node", "index.js"]
