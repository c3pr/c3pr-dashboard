FROM node:8-alpine

MAINTAINER acdcjunior

RUN mkdir -p /opt/c3pr-dashboard
WORKDIR /opt/c3pr-dashboard

COPY package.json /opt/c3pr-dashboard
COPY package-lock.json /opt/c3pr-dashboard
RUN npm install

COPY src /opt/c3pr-dashboard/src
COPY resources /opt/c3pr-dashboard/resources
COPY frontend/dist /opt/c3pr-dashboard/frontend/dist

EXPOSE 5005

CMD npm start