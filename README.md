## Spectra-chess

This is a simple BASIC game for the ZX Spectrum that allows to play chess using the Spectranet interface.

It works using a proxy like this on an public internet server:

```
root@tuxe:~# cat spectra-chess-server.sh
#!/bin/bash

ps axuwww|grep 'nc -n -lkvp'|egrep -v grep| awk '{print $2}'|xargs -i% kill -9 %

rm /tmp/a2b
rm /tmp/b2a

mkfifo /tmp/a2b
mkfifo /tmp/b2a

nc -n -lkvp 2500 < /tmp/b2a | tee /tmp/a2b &
nc -n -lkvp 2501 < /tmp/a2b | tee /tmp/b2a &
root@tuxe:~#

```

## How to play

1. Open "spectranet_setPandReset.szx" with FUSE
2. Configure your local network (IP addresse & Gateway). Note that DHCP does not work with FUSE.
3. Apply a hard reset, you should see a NTFS server screen. Come back to BASIC and load the tape "chess.tap"
4. One peer should choose whites and the other blacks.

