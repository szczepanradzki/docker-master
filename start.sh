#!/bin/bash
echo "starting installations"

npm i -g concurrently nodemon

echo "*** backend ***" && \
cd /var/www/backend && \
yarn install &
echo "*** frontend ***" && \
cd /var/www/frontend && \
yarn install &
echo "*** fanuc-calculator-roi ***" && \
cd /var/www/fanuc-calculator-roi && \
yarn install &
echo "*** fanuc-calculator-strapi *** " && \
cd /var/www/fanuc-calculator-strapi && \
yarn install
echo "*** im done installing ***"

concurrently "cd /var/www/backend && nodemon --delay 1 --exec npm run develop" \
"cd /var/www/fanuc-calculator-strapi && nodemon --delay 1 --exec npm run develop" \
"cd /var/www/fanuc-calculator-roi && export HOST=0.0.0.0 && export PORT=4000 && npm run develop" \
"cd /var/www/frontend && export HOST=0.0.0.0 && export PORT=5000 && npm run develop"