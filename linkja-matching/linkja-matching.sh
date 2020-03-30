#!/bin/sh
if [ "$1" = "--decrypt" ]; then
    # $2 - the directory to read input files (encrypted) from
    # $3 - the encrypted file prefix
    # $4 - the encrypted file suffix
    # $5 - path to the RSA private key to be used for decryption
  java -Djava.library.path=/data -jar linkja-matching.jar --decrypt --directory "/data/$2" --prefix $3 --suffix $4 --decryptionKey "/data/$5"
else
  echo "For modes other than decryption, please run linkja-matching natively on your machine."
fi
