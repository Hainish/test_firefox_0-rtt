#!/bin/bash

if [ ! -e "/opt/packet_dump/dump.pcap" ]; then
  mkfifo /opt/packet_dump/dump.pcap
fi

$@
