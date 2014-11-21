Docker Files for BipIO Server

## Pre-Installation ##
Before you can install & run BipIO, MongoDB and RabbitMQ need to be running.  Docker makes it easy to bundle these as well.

## Option 1 - Grab 'n Go ##

    docker pull wotio/bipio
    docker run -i -p 5000:5000 wotio/bipio


note that during the build process, configuration settings are derived from [this config file][1],
which you can optionally set in the bootstrap.sh file.   Otherwise you will be asked a series of prompts the first time the BipIO docker container is run to configure some of the basic settings.

## Option 2 - DIY ##

If you're slightly more adventurous, you can build BipIO yourself:

Repo is available [here][2]


  [1]: https://github.com/bipio-server/bipio/blob/master/config/config.json-dist
  [2]: https://github.com/bipio-server/bipio-docker
