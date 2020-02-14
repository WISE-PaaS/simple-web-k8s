# Specify a base image
FROM node:alpine

# Specifying the working directory in the container
WORKDIR /usr/app

# Copy files from the working directory that is relative to the 
# build context to the working directory in the container
COPY ./package.json ./
# Install some dependencies
# This step will not be run if the package.json is not changed.
RUN npm install
# This step will be executed whenever any file in your machine has been changed.
COPY ./ ./

# Default command
CMD ["npm", "start"]