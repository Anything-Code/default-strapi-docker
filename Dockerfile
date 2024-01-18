FROM node:18-alpine
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/
RUN npx create-strapi-app@latest strapi --quickstart --ts --no-run
RUN npm i pg
RUN npm i -D @types/pg
WORKDIR /opt/strapi/
RUN npm install -g node-gyp
RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install
ENV PATH /opt/strapi/node_modules/.bin:$PATH

RUN chown -R node:node /opt/strapi/
USER node
RUN ["npm", "run", "build"]
EXPOSE 1337

CMD ["npm", "run", "develop"]
