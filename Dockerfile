FROM node:alpine as testingdone
WORKDIR /var/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=testingdone /var/app/build /usr/share/ngix/html
