FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

ENV PORT=8080
ENV HOST=0.0.0.0

USER 1000:1000

CMD ./node_modules/probot/bin/probot.js run ./index.js
