#!/bin/bash

mv web-logbook-linux-amd64/* /config
cd /config
./web-logbook

## this must be the last item - i think - safe than sorry
/usr/sbin/sshd -D
