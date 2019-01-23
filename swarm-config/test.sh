#!/bin/sh

hoge="hogehoge"
hoge="ogehoge"

if [ $hoge = "hogehoge" ]; then
  echo "hoge"
else
  echo "else"
fi
