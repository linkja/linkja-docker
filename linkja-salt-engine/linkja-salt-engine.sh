#!/bin/sh
# $1 - salt engine program mode (generateProject, addSites, version)

if [ "$1" = "--generateProject" ]; then
    # $2 - site file
    # $3 - project name
   java -Djava.library.path=/data -jar linkja-salt-engine.jar --generateProject --siteFile "/data/$2" --projectName $3
elif [ "$1" = "--addSites" ]; then
    # $2 - site file
    # $3 - existing salt file
    java -Djava.library.path=/data -jar linkja-salt-engine.jar --addSites --siteFile "/data/$2" --saltFile "/data/$3"
else
    java -Djava.library.path=/data -jar linkja-salt-engine.jar --version
fi
