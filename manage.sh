#!/bin/bash
if [ $1 == init ]; then
    docker run -i -t --env-file $(pwd)/aws.env --volume $(pwd)/terraform:/terraform ranjithka/terraform:0.12.17 /bin/terraform init -plugin-dir=/plugins
else
    docker run -i -t --env-file $(pwd)/aws.env --volume $(pwd)/terraform:/terraform ranjithka/terraform:0.12.17 /bin/terraform $1
fi
