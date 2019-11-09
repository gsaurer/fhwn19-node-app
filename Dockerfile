FROM node:10

# install editor
RUN apt-get -y update \
    && apt-get install -y vim

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

VOLUME ["/app/src/data","/app/src/config"]

EXPOSE 8080

CMD [ "http-server", "dist" ]