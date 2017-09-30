# DOCKER_VERSION 17.09.0
FROM ubuntu
# set proxy
ENV http_proxy http://child-prc.intel.com:913
ENV https_proxy https://child-prc.intel.com:913
# Install node.js
#RUn apt-get install curl
#RUN /usr/bin/curl -x child-prc.intel.com:913 --location https://github.com/nodesource/distributions/blob/master/deb/setup_8.x |bash -
RUN apt-get update
RUN apt-get -y install nodejs
RUN apt-get install -y npm
RUN apt-get install -y vim
# Add source code
ADD . /home/lc/workspace/exercise/
WORKDIR /home/lc/workspace/exercise/
#RUN npm config set proxy http://liuchuan:Focus~66@child-prc.intel.com:914
#RUN npm config set https-proxy https://liuchuan:Focus~66@child-prc.intel.com:914
RUN npm install

EXPOSE 8888
CMD ["nodejs", "server.js"]
