#!/bin/sh
cmake . -DCMAKE_BUILD_TYPE=Release
make clean
make

cp ./target/liblinkjacrypto.so /data/liblinkjacrypto.so
