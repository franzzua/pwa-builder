#!/bin/bash
./answers.sh | bubblewrap init --manifest=https://$1/manifest.json
bubblewrap build
mv ./app-release-* /out