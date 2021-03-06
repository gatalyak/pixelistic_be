FROM node:10

ENV FRONT_URL=$FRONT_URL

# Copy script to check for services
#COPY docker/wait-for /wait-for
#RUN chmod +x wait-for

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .




RUN chmod +x wait-for-it.sh


EXPOSE 3000
CMD [ "node", "./bin/www" ]

