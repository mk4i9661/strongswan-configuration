#!/bin/bash

./configure --prefix=/usr --sysconfdir=/etc --enable-md4 --enable-openssl --enable-eap-identity --enable-eap-mschapv2 --enable-eap-peap --enable-kernel-libipsec
make
make install
