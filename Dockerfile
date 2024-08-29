
FROM node:bookworm-slim

RUN apt update && apt install -y wget curl
RUN npm install -g opencollective

COPY ./install.sh /install.sh

COPY ./service.sh /service.sh

RUN chmod 755 /install.sh && chmod 755 /service.sh

RUN /install.sh

ENTRYPOINT [ "bash","-c","/service.sh" ]
