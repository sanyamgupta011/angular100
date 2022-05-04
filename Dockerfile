FROM node:latest as node
WORKDIR /app
COPY ./angular .
#RUN npm install -g npm@8.6.0
RUN npm install
RUN npm run build --prod


FROM nginx:alpine
COPY --from=node /app/dist/angular /usr/share/nginx/html

