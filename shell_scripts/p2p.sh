#!/usr/bin/env bash

protonvpn-cli ks --on
protonvpn-cli c --cc NL -p udp
protonvpn-cli s

firefox https://thepiratebay.org
read -p "Enter the magnet link for the torrent you want to download: " magnetLink
echo "Opening Qbittorrent..."
qbitorrent $magnetLink
