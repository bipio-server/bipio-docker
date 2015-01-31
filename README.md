Docker Files for BipIO Server

## Pre-Installation ##
Before you can install & run BipIO, you'll also need to set up a `data` directory to persist your data and logs.
(`mongod` requires a minimum of 3GB free space on this volume).

```
mkdir ~/data
mkdir ~/data/db
mkdir ~/data/server_logs
mkdir ~/data/var
mkdir ~/data/etc
```


## Option 1 - Grab 'n Go ##

    docker pull wotio/bipio

### First, Set up Bipio  (this sets up configurations and data volumes)

    docker run -it -v ~/data:/data -p 5000:5000 wotio/bipio


[note: that during the build process you will be asked a series of prompts the first time the BipIO docker container is run to configure some of the basic settings.]

### Then, To Start Container and run Bip.IO

    docker run -d -v ~/data:/data -p 5000:5000 wotio/bipio


## Option 2 - DIY ##

If you're slightly more adventurous, you can build BipIO yourself:

Repo for the docker container is available [here][1]

Repo for the Bip.IO Server is available [here][2]


  [1]: https://github.com/bipio-server/bipio-docker
  [2]: https://github.com/bipio-server/bipio
