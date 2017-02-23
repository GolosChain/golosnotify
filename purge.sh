#!/usr/bin/env bash

set -euo pipefail

for c in $(docker ps -a -f status=exited -f status=created -f status=dead --format="{{.ID}}"); do
    docker rm $c
    echo "${c} -------- container removed"
done

echo ---------------------

for img in $(docker images -f dangling=true --format="{{.ID}}"); do
    docker rmi $img
    echo "${img} -------- image removed"
    #echo $img
done
