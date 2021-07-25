npm run build

cd dist

git init
git add -A
git commit -m 'New Deployment'
git push -f https://github.com/gabrielsntr/pokedex.git master:gh-pokedex