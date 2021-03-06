#!/bin/bash

echo "Linux is " $(getconf LONG_BIT) "bit."

cd /usr/local/src
wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
tar zxf go1.8.linux-amd64.tar.gz
mv go /srv/go-1.8

ln -s /srv/go-1.8 /srv/go

#cat >> /etc/man.config <<EOF
#MANPATH  /srv/go/man
#EOF

cat >> /etc/profile.d/go.sh <<'EOF'
export GOROOT=/srv/go
export PATH=$PATH:$GOROOT/bin
EOF

source /etc/profile.d/go.sh