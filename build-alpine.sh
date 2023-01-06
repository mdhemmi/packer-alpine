#!/bin/sh

rm -rf output-alpine-* 

#export PATH=$HOME/bin:/usr/local/bin:/Applications/VMware\ OVF\ Tool:$PATH
#alias ovftool="/Applications/VMware\ OVF\ Tool/ovftool"
#alias packer="~/Documents/photonos-appliance/packer"
export PACKER_LOG=1
export PACKER_LOG_PATH="./logs/build.log"

### Check for dir, if not found create it using the mkdir ##
[ ! -d "./logs" ] && mkdir -p "./logs"

packer build \
    --var-file="alpine-builder.json" \
    --var-file="alpine-3.17.0.json" \
    alpine.json
