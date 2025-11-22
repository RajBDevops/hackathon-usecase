FROM node:18-bullseye AS builder

WORKDIR /app

COPY package*.json ./

RUN echo "===== Checking files =====" && ls -la /app && \
    (npm ci --legacy-peer-deps --verbose \
    || npm install --legacy-peer-deps --verbose) \
    || (echo "===== NPM INSTALL ERROR LOG =====" && cat /root/.npm/_logs/*-debug-0.log && exit 1)

COPY . .

FROM node:18-bullseye
WORKDIR /app
COPY --from=builder /app .
CMD ["node", "index.js"]
