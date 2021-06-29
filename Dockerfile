FROM node:alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && \
npm run build
CMD ["npm" "start"]
FROM nginx:alpine
COPY --from=builder /app/dist/* /usr/share/nginx/html/
EXPOSE 4200 80
