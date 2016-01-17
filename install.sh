#Getting rootshell:
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential;
mkdir /opt/rootshell; cd /opt/rootshell;
wget http://tcpdiag.dl.sourceforge.net/project/rootsh/rootsh/1.5.3/rootsh-1.5.3.tar.gz
tar -xvzf rootsh-1.5.3.tar.gz

Add permissions in line 682 as the third argument

./configure --disable-logfile 
make
make install

mv dockershell /bin/dockershell

#INSTALL https://docs.docker.com/engine/installation/ubuntulinux/

Install sudoers

Cmnd_Alias DOCKERSHELL = /usr/local/bin/rootsh -u nobody /bin/runas
ALL     ALL=(ALL) NOPASSWD: DOCKERSHELL

#Place dockerrun
mv dockerrun /bin/dockerrun

docker build .
