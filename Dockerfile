# base image
FROM node:12.2.0-alpine

# set working directory
RUN mkdir -p /usr/src/react-kanopy

COPY . /usr/src/react-kanopy

WORKDIR /usr/src/react-kanopy

# add `/react-kanopy/node_modules/.bin` to $PATH
ENV PATH /usr/src/react-kanopy/node_modules/.bin:$PATH

# install and cache app dependencies
RUN npm config set unsafe-perm true
RUN npm install --silent
RUN npm install react-scripts -g --silent

EXPOSE 8080

# start app
CMD ["npm", "start"]