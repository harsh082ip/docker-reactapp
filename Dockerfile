FROM node:20-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build


FROM nginx
# elastic beanstalk will map this port automatically
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html 
