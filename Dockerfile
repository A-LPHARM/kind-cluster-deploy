FROM node
COPY . /app
WORKDIR /app
RUN npm install express
EXPOSE 3000
CMD [ "node", "app.js"]