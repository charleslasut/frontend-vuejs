#!/usr/bin/env sh

set -e 

npm run build

cd dist

git init
git add -A
git commit -m 'deploy baru'
git push -f https://github.com/charleslasut/frontend-charles.io.git master:gh-pages

cd -
