FROM dockerfile/nodejs:latest

# Sane vars
ENV HOME /root
ENV TERM xterm

RUN apt-get install -y build-essential python
RUN apt-get update
RUN apt-get upgrade -y 

# Start with a known base
WORKDIR /root

# clone & install the deps
RUN git clone https://github.com/bipio-server/bipio.git
WORKDIR /root/bipio
RUN npm install .

WORKDIR /root

EXPOSE 5000

# This will be out runner for make install & run
ADD ./bootstrap.sh /root/bootstrap.sh

ENTRYPOINT ["/root/bootstrap.sh"]

