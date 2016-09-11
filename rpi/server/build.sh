#!/bin/bash

SNAP_VERSION=$1
SNAP_ARCH=$2

cp Dockerfile.template Dockerfile

if [ $SNAP_ARCH != "armhf" ]; then

	sed -i 's/armhf\///' Dockerfile
fi

sed -i "s/TEMPLATE_VERSION/$SNAP_VERSION/" Dockerfile
sed -i "s/TEMPLATE_ARCH/$SNAP_ARCH/" Dockerfile

docker build -t snapserver:${SNAP_VERSION}_${SNAP_ARCH} .

rm Dockerfile
