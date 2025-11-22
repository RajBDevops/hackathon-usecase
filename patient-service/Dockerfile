FROM node:18-bullseye AS builder

WORKDIR /app

# 1. Copy ONLY package.json and package-lock.json
COPY package*.json ./

# 2. Install deps
RUN npm ci --legacy-peer-deps

# 3. Copy rest of project
COPY . .

# 4. Build (only if needed)
# RUN npm run build

# --- Runtime image ---
FROM node:18-bullseye

WORKDIR /app

# Copy from builder
COPY --from=builder /app .

CMD ["node", "index.js"]
