FROM node:lts-alpine

# install editor	
RUN apt-get -y update \	
    && apt-get install -y vim	

# install simple http server for serving static content	# install simple http server for serving static content
RUN npm install -g http-server	RUN npm install -g http-server

# copy both 'package.json' and 'package-lock.json' (if available)	# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./	COPY package*.json ./


# install project dependencies	# install project dependencies leaving out dev dependencies
RUN npm install	RUN npm install --production


# copy project files and folders to the current working directory (i.e. 'app' folder)	# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .


# build app for production with minification	# build app for production with minification
RUN npm run build


EXPOSE 8080	

CMD [ "http-server", "dist" ] 