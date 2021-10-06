#! /usr/bin/env bash

declare -r this_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

k3d cluster create --config ${this_dir}/k3d.yaml