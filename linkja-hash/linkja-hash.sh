#!/bin/sh
# $1 - aggregator public key
# $2 - patient data file to hash
# $3 - project-specific salt file
# $4 - project-specific private date
# $5 - output directory
java -Djava.library.path=. -jar linkja-hashing.jar --encryptionKey "/data/$1" --patientFile "/data/$2" --saltFile "/data/$3" --privateDate $4 --outDirectory "/data/$5"
