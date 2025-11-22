FROM node:18-alpine AS builder

# Install build tools needed for native modules
RUN apk add --no-cache python3 make g++ bash

WORKDIR /usr/src/app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./

# Use npm ci instead of install for more stable, deterministic installs (especially in CI / build)
RUN npm ci --unsafe-perm

# Copy source code
COPY . .

# (Optional) If you have a build step, run it. For example:
# RUN npm run build

# Final stage: smaller runtime image
FROM node:18-alpine AS runtime

WORKDIR /usr/src/app

# Copy only the built app + production dependencies
COPY --from=builder /usr/src/app ./

EXPOSE 3000

CMD ["node", "index.js"]
