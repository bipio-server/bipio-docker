#!/bin/bash
set -x
/usr/bin/mongod &
exec /usr/sbin/rabbitmq-server >> /data/server_logs/server.log 2>&1 &
cd /usr/local/lib/node_modules/bipio

#export BIPIO_HOSTNAME=localhost
#export BIPIO_API_HOST=
#export BIPIO_PROTOCOL=http 
#export BIPIO_ADMIN_PASSWORD= 
#export BIPIO_AES_KEY= 
#export AUTH_HOST=

envVars="BIPIO_HOSTNAME BIPIO_API_HOST BIPIO_PROTOCOL BIPIO_ADMIN_PASSWORD BIPIO_AES_KEY AUTH_HOST"

for i in $envVars; do
  # regex escaping
  val=$(echo ${!i} | sed -e 's/\//\\\//g' | sed -e 's/\@/\\@/g')

  echo $val
  perl -pi -e "s/$i/$val/g" /usr/local/lib/node_modules/bipio/config/config.json-dist
done

mkdir -p /data/server_logs

npm config set registry https://registry.npmjs.org

make install
#make install > /data/server_logs/server.log 2>&1

supervisor ./src/server.js >> /data/server_logs/server.log 2>&1 &

/bin/bash -l

