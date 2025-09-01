FROM guidcruncher/typescript-base:node-latest AS base

ARG DEBIAN_FRONTEND=noninteractive
ENV NODE_ENV=production
ARG TARGETARCH
ENV TZ=UTC

RUN <<EOF
mkdir -p /src
npm install -g typescript ts-node nodemon caddy
npm install -g tslib @types/node
EOF

WORKDIR /src

COPY package*.json ./

RUN npm i

COPY . .

FROM base as production

ENV NODE_PATH=./build

RUN npm run build
