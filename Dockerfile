FROM node:12-alpine
WORKDIR /demo
COPY . .
RUN yarn install && yarn run dev
CMD ["node", "src/index.js"]
