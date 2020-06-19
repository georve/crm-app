FROM node:12.18 as build-step
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@9.1.7

COPY ./ /app/

RUN npm run build --prod

FROM nginx:1.16.0-alpine as prod-stage
COPY --from=build-step /app/dist/crm-app /usr/share/nginx/html
