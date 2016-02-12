#Getting rootshell:
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential;
mkdir /tmp/rootshell; cd /tmp/rootshell;
wget http://tcpdiag.dl.sourceforge.net/project/rootsh/rootsh/1.5.3/rootsh-1.5.3.tar.gz
tar -xvzf rootsh-1.5.3.tar.gz
cd rootsh-1.5.3;
./configure --disable-logfile && make && sudo make install

#INSTALL DOCKER
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-cache policy docker-engine
sudo apt-get install -y docker-engine

#CONFIGURE CONTAINER
cd /tmp/docker-logging;
sudo docker build -t docker_shell .
sudo mv dockershell /bin/dockershell && sudo chmod 755 /bin/dockershell
sudo mv rundocker /bin/rundocker && sudo chmod 755 /bin/rundocker
sudo sh -c 'cat sudoers > /etc/sudoers'
sudo /usr/sbin/useradd limited -s /bin/bash
sudo /usr/sbin/useradd exampleuser -s /bin/dockershell

