FROM node:15.8.0-alpine3.12

WORKDIR /opt/cforrest/chan4est

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# Running port env variable
ARG running_port

ENV PORT=$running_port

EXPOSE $running_port

CMD [ "node", "server.js" ]
