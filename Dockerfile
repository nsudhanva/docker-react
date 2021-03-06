# Production

# Specify a base image
FROM node:alpine AS builder

WORKDIR /app

# Install dependencies
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# docker run -p 8080:80 ceafe0073c97