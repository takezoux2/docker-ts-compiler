#!/bin/bash


if ! [ -e /root/typescript/node_modules ]; then
    npm i -D typescript gulp webpack webpack-stream ts-loader gulp-webserver run-sequence
fi