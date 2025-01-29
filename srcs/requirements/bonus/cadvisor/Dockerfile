FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget
RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64
RUN chmod +x cadvisor-v0.49.1-linux-amd64 && mv cadvisor-v0.49.1-linux-amd64 cadvisor
CMD [ "./cadvisor","--port=8081" ]