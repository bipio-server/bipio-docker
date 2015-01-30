Docker Files for BipIO Server

## Pre-Installation ##
Before you can install & run BipIO, MongoDB and RabbitMQ need to be running.  Docker makes it easy to bundle these as well.
You'll also need to set up a `data` directory to persist your data and logs.

```
mkdir ~/data
mkdir ~/data/db
mkdir ~/data/server_logs
mkdir ~/data/var
mkdir ~/data/etc
```


## Option 1 - Grab 'n Go ##

    docker pull wotio/bipio
    docker run -i -v ~/data:/data -p 5000:5000 wotio/bipio


note that during the build process you will be asked a series of prompts the first time the BipIO docker container is run to configure some of the basic settings.

## Option 2 - DIY ##

If you're slightly more adventurous, you can build BipIO yourself:

Repo is available [here][1]


  [1]: https://github.com/bipio-server/bipio-docker
