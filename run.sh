docker rm esindexer
docker run --name esindexer --net=host aergo/esindexer esindexer -A 192.168.1.6:7845 -E 192.168.1.6:9200 --prefix chain_