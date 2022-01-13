--3 sunucuda da yapılması gerekir.
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
---INSTALL DOCKER ENGINE----
sudo yum install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
docker pull mongo
docker images
docker network create my-mongo-cluster
docker network ls 
docker ps -a 
docker run -d -v mongodb1-data:/data/db -v mongodb1-config:/data/config -p 27017:27017 mongo:latest mongod --replSet mongo_rs --1.sunucuda
docker run -d -v mongodb2-data:/data/db -v mongodb2-config:/data/config -p 27017:27017 mongo:latest mongod --replSet mongo_rs --2.sunucuda
docker run -d -v mongodb3-data:/data/db -v mongodb3-config:/data/config -p 27017:27017 mongo:latest mongod --replSet mongo_rs  --3.sunucuda
docker ps 
docker exec -it name bash
--primary olmasını istediğimiz sunucuda
mongo
rs.initiate()
cfg = rs.conf()
cfg.members[0].host = "192.168.53.224:27017"
rs.reconfig(cfg)
rs.add("192.168.1.1:27017")
rs.add("192.168.1.2:27017") 
rs.status();
mongodb://localhost:27017,localhost:27018,localhost:27019/{db}?replicaSet=my-mongo-set
​
---p 27017:27017 exposes port 27017 on the host IP so mongo is accessible on servers' host IP address.
