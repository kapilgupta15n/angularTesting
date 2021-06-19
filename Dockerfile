### STAGE 1: Build ###
FROM node:15.12.0-alpine3.13 AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
#RUN npm install
COPY . .
RUN npm i && npm run build
### STAGE 2: Run ###
FROM nginx:stable-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/mean-course /usr/share/nginx/html
