# Use a smaller base image like node:alpine
FROM node:alpine
RUN addgroup app && adduser -S -G app app
USER app

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm Install

EXPOSE 2000

# Copy the rest of the application files
COPY . .

# Specify the command to run the application
CMD ["node", "start"]
