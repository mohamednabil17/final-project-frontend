FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
<<<<<<< HEAD
# Use npm ci for faster, reliable, deterministic builds
RUN npm ci
=======
RUN npm install
>>>>>>> 4ed69460d7755f4d28401e22555eb81b477cd7bf

COPY . .
RUN npm run build

FROM nginx:alpine
<<<<<<< HEAD
# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

=======
>>>>>>> 4ed69460d7755f4d28401e22555eb81b477cd7bf
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

<<<<<<< HEAD
# Add healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
    CMD wget -q --spider http://localhost/ || exit 1

=======
>>>>>>> 4ed69460d7755f4d28401e22555eb81b477cd7bf
CMD ["nginx", "-g", "daemon off;"]