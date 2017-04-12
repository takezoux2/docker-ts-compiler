#!/bin/bash

template_dir=/root/tool/
copy_to_dir=/root/typescript/


if ! [ -e $copy_to_dir ]; then
    mkdir $copy_to_dir
fi

for fn in tsconfig.json webpack.config.js gulpfile.js; do
    if ! [ -e ${copy_to_dir}${fn} ]; then
        cp ${template_dir}${fn} ${copy_to_dir}${fn}
        echo create ${copy_to_dir}${fn}
    fi
done
