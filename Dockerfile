FROM node:11.15.0-alpine as build-step
WORKDIR /app
COPY ./ /app/
RUN npm install
RUN npm run build --prod

FROM nginx:1.16.0-alpine as prod-stage
COPY --from=build-step /app/dist/crm-app /usr/share/nginx/html
