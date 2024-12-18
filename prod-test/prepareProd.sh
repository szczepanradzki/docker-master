#!/bin/bash

echo "build"

docker-compose build

echo "launching mongo"

docker-compose up -d mongo

echo "restoring database"

docker-compose exec mongo mongorestore /dump -u root -p root

echo "killing processes"

docker-compose stop

rm ../../backend/.env
cp ../../backend/.env.prod.example ../../backend/.env

rm ../../frontend/.env
cp ../../frontend/.env.prod.example ../../frontend/.env

rm ../../fanuc-calculator-roi/.env
cp ../../fanuc-calculator-roi/.env.prod.example ../../fanuc-calculator-roi/.env

rm ../../fanuc-calculator-strapi/.env
cp ../../fanuc-calculator-strapi/.env.prod.example ../../fanuc-calculator-strapi/.env