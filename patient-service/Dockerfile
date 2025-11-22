FROM node:18-bullseye AS builder

WORKDIR /app

COPY package*.json ./

# If package-lock.json exists -> use npm ci
RUN if [ -f package-lock.json ]; then \
        npm ci --legacy-peer-deps; \
    else \
        npm install --legacy-peer-deps; \
    fi

COPY . .

FROM node:18-bullseye
WORKDIR /app

COPY --from=builder /app .

CMD ["node", "index.js"]
