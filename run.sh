docker rm esindexer
IP=192.168.1.63
docker run --name esindexer --net=host aergo/esindexer esindexer -A $IP:7845 -E $IP:9200 --prefix chain_
