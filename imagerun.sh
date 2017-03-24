#docker run -d --name=virtual1  -v /root/dockertest/statsfeeder/conf:/statsfeeder/config -v /root/dockertest/statsfeeder/log:/statsfeeder/log  tonimoreno/statsfeeder-graphite
docker run -d   -v /root/dockertest/statsfeeder/conf:/statsfeeder/config -v /root/dockertest/statsfeeder/log:/statsfeeder/logs  tonimoreno/statsfeeder-graphite
