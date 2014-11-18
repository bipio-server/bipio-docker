FROM dockerfile/nodejs:latest
MAINTAINER WoT.io Devs <dev@wot.io>

RUN mkdir -p /data/db
RUN mkdir -p /data/server_logs


# Install RabbitMQ

ADD rabbitmq-signing-key-public.asc /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get -qq update > /dev/null
RUN apt-get -qq -y install rabbitmq-server > /dev/null
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management
RUN echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

EXPOSE 5672 15672 4369


# Install MongoDB

# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN apt-get update && apt-get install -y mongodb-org

EXPOSE 27017


# Install supervisor

RUN npm install -g supervisor

# Install BipIO

# Start with a known base
WORKDIR /root

RUN npm install -g bipio

# Add config
RUN mv /etc/localtime /etc/localtime.bak
RUN ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime

EXPOSE 5000

ADD ./bootstrap.sh /root/bootstrap.sh

RUN chmod 755 ./*.sh

ENTRYPOINT ["/root/bootstrap.sh"]
