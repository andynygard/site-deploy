# Teardown ################################################

echo Stopping containers...
docker stop $(docker ps -a -q)

echo Removing containers...
docker rm $(docker ps -a -q)

# Start ###################################################

set -e 

echo Starting reverse proxy...
docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy

echo Starting static site...
docker run -d -p 8080:80 -e VIRTUAL_HOST=scurvy.dog scurvy/site-static
