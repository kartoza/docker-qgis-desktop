#!/bin/bash
set -e

docker stop server || true
docker rm server || true

docker build -t qgis-server ..
docker run -d -p 8380:80 --volume=$PWD:/project --name server qgis-server

URL=http://localhost:8380/

curl "$URL?SERVICE=WMS&REQUEST=GetCapabilities" > /dev/null
curl "$URL?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=-0.69003700000000001,-1.54244000000000003,1.30996000000000001,1.03689999999999993&CRS=EPSG:4326&WIDTH=667&HEIGHT=518&LAYERS=Test&STYLES=&FORMAT=image/jpeg&DPI=96&MAP_RESOLUTION=96&FORMAT_OPTIONS=dpi:96" > /dev/null

docker stop server
