FROM node:18-bullseye AS builder

WORKDIR /app

# 1. Copy package files
COPY package*.json ./

# 2. Debug: Check if package.json exists BEFORE npm install
RUN echo "===== Checking /app files BEFORE npm install =====" && ls -la /app

# 3. Install deps with full debug output
RUN npm install --legacy-peer-deps --verbose \
    || (echo "===== NPM INSTALL ERROR LOG =====" \
    && cat /root/.npm/_logs/*-debug-0.log \
    && exit 1)

# 4. Copy rest of project
COPY . .

# Runtime stage
FROM node:18-bullseye
WORKDIR /app

COPY --from=builder /app .

CMD ["node", "index.js"]

