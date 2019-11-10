FROM node:lts-alpine

# Create app directory	# Create app directory
WORKDIR /usr/src/app


# Install app dependencies	# Bundle app source
# A wildcard is used to ensure both package.json AND package-lock.json are copied	COPY . .
# where available (npm@5+)	
COPY package*.json ./	


RUN npm install
# If you are building your code for production	# If you are building your code for production
# RUN npm ci --only=production	# RUN npm ci --only=production


# Bundle app source	
COPY . .	

EXPOSE 8080

CMD [ "node", "app.js" ] 	
