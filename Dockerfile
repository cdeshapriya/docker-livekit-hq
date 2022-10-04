FROM node:alpine as builder

RUN apk add --no-cache \
    yarn \
    bash \
    bind-tools \
    curl \
    git \
    iputils \
    jq \
    nano \
    ncurses \
    netcat-openbsd \
    openssh-client \
    sudo

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY . .

CMD ["yarn", "start"]
