#! /bin/bash

set -eu

DEPLOY_REPO="https://${DEPLOY_BLOG_TOKEN}@github.com/hoangtn1304/hoangtn1304.github.io.git"

echo "deploying changes"

if [ -z "$TRAVIS_PULL_REQUEST" ]; then
    echo "except don't publish site for pull requests"
    exit 0
fi  

if [ "$TRAVIS_BRANCH" != "master" ]; then
    echo "except we should only publish the master branch. stopping here"
    exit 0
fi

cd _site
git config --global user.name "Travis CI"
git config --global user.email hoangtn1304@gmail.com
git add -A
git status
git commit -m "Lastest site built on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to github"
exit `git push $DEPLOY_REPO master:master`