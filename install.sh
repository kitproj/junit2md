#!/usr/bin/env sh
set -eux

tag=$(curl --retry 3 -s "https://api.github.com/repos/kitproj/junit2md/releases/latest" | jq -r '.tag_name')
version=$(echo $tag | cut -c 2-)
url="https://github.com/kitproj/junit2md/releases/download/${tag}/kit_${version}_$(uname)_$(uname -m | sed 's/aarch64/arm64/').tar.gz"
curl --retry 3 -L $url | tar -zxvf - junit2md
chmod +x junit2md
sudo mv junit2md /usr/local/bin/junit2md
