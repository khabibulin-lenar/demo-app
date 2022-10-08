FROM node:12-alpine
EXPOSE 3000
WORKDIR /demo-app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]