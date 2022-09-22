npm run build 
cd dist
git init 
git add -A
git commit -m "Deploy."
git push -f https://github.com/fjmcruz/vue-anime-tracker.git main:gh-pages
cd ..