FROM node:18 AS build
RUN mkdir /app
WORKDIR /app
COPY . ./

RUN npm install
RUN npm run build 

FROM httpd:latest

COPY --from=build /app/build /usr/local/apache2/htdocs

RUN chown www-data.www-data /usr/local/apache2/htdocs -R
