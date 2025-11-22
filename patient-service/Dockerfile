# Use a build stage to install dependencies
FROM node:18-alpine AS builder

# Install build tools required for native modules / node-gyp
RUN apk add --no-cache python3 make g++ bash

WORKDIR /usr/src/app

# Copy package files first, to leverage layer caching
COPY package*.json ./

# Print versions to help debug
RUN node -v && npm -v && python3 --version

# Clean npm cache just in case
RUN npm cache clean --force

# Install dependencies (ci)
RUN npm ci --unsafe-perm --verbose

# Copy rest of the application
COPY . .

# (Optional) If you have a build step (e.g. transpile, build), run it here
# RUN npm run build

# Final runtime stage
FROM node:18-alpine AS runtime

WORKDIR /usr/src/app

# Copy only built files + node_modules from builder
COPY --from=builder /usr/src/app ./

EXPOSE 3000

CMD ["node", "index.js"]
