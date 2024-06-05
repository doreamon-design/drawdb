# Stage 1: Build the app
FROM whatwewant/builder-node:v20-1 as build

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

# Stage 2: Setup the Nginx Server to serve the app
FROM whatwewant/serve:v1

COPY --from=build /app/dist /var/www/html
