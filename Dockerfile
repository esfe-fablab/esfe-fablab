# Use an official Node.js runtime as a parent image
FROM node:alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle your app's source code inside the Docker image
COPY . .

# Expose the port that your app will run on
EXPOSE 3000

# Define environment variable
ENV NODE_ENV production

# Build the app
RUN yarn 
RUN yarn build

# Command to run the application
CMD ["yarn", "start"]
