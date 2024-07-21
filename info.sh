#!/bin/bash

# Betik ismi: betik.sh

# Argümanları kontrol et
if [ "$#" -ne 2 ]; then
    echo "Kullanım: $0 --server ip:port"
    exit 1
fi

# --server argümanını ve IP:port bilgisini al
if [ "$1" == "--server" ]; then
    SUNUCU=$2
else
    echo "Kullanım: $0 --server ip:port"
    exit 1
fi

# Oyuncu listesini ve toplam oyuncu sayısını ekrana yazdır
gamedig --type css $SUNUCU | jq -r '.players[] | .name' | awk 'BEGIN { print "Oyuncular:" } { print NR "-" $0 " " } END { print "\nTOPLAM OYUNCU: " NR }'
