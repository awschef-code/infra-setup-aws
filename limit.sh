#!/bin/bash
set -x
## Limit 1GB Docker Container
LIMIT=134217728
IMAGE='ranjithka/terraform:0.12.17'

SIZE="$(docker image inspect "$IMAGE" --format='{{.Size}}')"
test "$SIZE" -gt "$LIMIT" && echo 'Limit exceeded'
false
