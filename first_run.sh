#!/bin/bash

cd ..

echo "removing old mongo data"

sudo rm -rf mongo/data

echo "cloning repositories to appropriate directories"

git clone https://repository.kogifi.com/fanuc/fanuc-calculator-strapi.git
git clone https://repository.kogifi.com/fanuc/fanuc-calculator-roi.git
git clone https://repository.kogifi.com/fanuc-offer-app/backend.git
git clone https://repository.kogifi.com/fanuc-offer-app/frontend.git

cd docker || exit

echo "building images"

docker-compose build

echo "launching mongo..."

docker-compose up -d mongo

sleep 1

echo "restoring database"

docker-compose exec mongo mongorestore /dump -u root -p root

echo "launching application"

docker-compose up "$@"