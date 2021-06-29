FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
COPY . .
RUN npm install
RUN npm run build
CMD ["npm" "start"]
FROM nginx:alpine
COPY --from=builder /app/dist/syne-crud /usr/share/nginx/html/
EXPOSE 4200 80
