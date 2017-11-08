#!/bin/bash

cat /var/run/secrets/boostport.com/vault-token | jq -r .clientToken > /tmp/token.txt

curl -X GET -H"X-VAULT-TOKEN: `cat /var/run/secrets/boostport.com/vault-token | jq -r .clientToken`" "http://tc-staging.ayla.com.cn:8200/v1/secret/ecryptfs-passphrase" > /tmp/passphrase.txt

mkdir -p /ayla/dummy_prj

cd /ayla/dummy_prj
FOLDER="releases/`date +'%Y-%m-%d-%s'`"
git clone https://github.com/jslu/dummy_prj $FOLDER
rm -f current; ln -s $FOLDER current
