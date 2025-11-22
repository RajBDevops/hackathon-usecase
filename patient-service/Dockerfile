FROM node:18-bullseye AS builder

WORKDIR /app

# 1. Copy only package.json + package-lock.json
COPY package*.json ./

# 2. Install deps
RUN npm install --legacy-peer-deps --verbose

# 3. Copy rest of project files
COPY . .

# Runtime
FROM node:18-bullseye
WORKDIR /app

COPY --from=builder /app .

CMD ["node", "index.js"]
