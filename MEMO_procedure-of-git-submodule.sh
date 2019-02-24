#!/bin/sh

echo "## git submodue add https://github.com/gihyodocker/todoapi todoapi"
git submodue add https://github.com/gihyodocker/todoapi todoapi

echo "## git show"
git show

echo
echo "If you want to modify sudmodule configurations, edit \".gitmodule\" file"
