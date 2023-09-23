## using nodejs base image
FROM node:14
## defining working directory
WORKDIR /app
## using the root user to execute the container image
USER root
## copying the nodejs dependencey file . represent the/app
COPY package.json .
## installing npm for nodejs 
RUN npm install
## copying all, applications files to the work ditectory
COPY . /app/
EXPOSE 80
## Healthcheck command
HEALTHCHECK --interval=12s --timeout=12s --start-period=30s \  
    CMD node healthcheck.js
## executing web application
CMD ["node", "/app/server.js" ]

