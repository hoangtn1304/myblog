#! /bin/bash

set -eu

DEPLOY_REPO="https://${DEPLOY_BLOG_TOKEN}@github.com/hoangtn1304/hoangtn1304.github.io.git"

function main {
	clean
	get_current_site
	build_site
}

function clean { 
	echo "cleaning _site folder"
	if [ -d "_site" ]; then rm -Rf _site; fi 
}

function get_current_site { 
	echo "getting latest site"
	git clone --depth 1 $DEPLOY_REPO _site 
}

function build_site { 
	echo "building site"
	bundle exec jekyll build 
}

main