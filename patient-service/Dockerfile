FROM node:18-bullseye AS builder

WORKDIR /app

# Copy only package files
COPY package*.json ./

# Debug: show files
RUN echo "===== FILES IN /app =====" && ls -la /app

# Force very verbose logging and do NOT use npm ci anymore
RUN npm install --legacy-peer-deps --loglevel verbose || true

# After npm install, print ALL logs manually
RUN echo "===== PRINTING NPM LOG FILES =====" && \
    find /root/.npm/_logs -type f -exec echo "---- LOG: {} ----" \; -exec cat {} \;

# Copy rest of project
COPY . .

FROM node:18-bullseye
WORKDIR /app
COPY --from=builder /app .
CMD ["node", "index.js"]
