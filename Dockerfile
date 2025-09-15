FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY tsconfig.json ./
COPY src ./src
COPY dist/ ./public

RUN npm run build

EXPOSE 80
ENV PORT=80
CMD ["node", "dist/index.js"]
