FROM buildpack-deps:jammy

WORKDIR /app

RUN <<EOT bash
set -euxo pipefail

apt-get update
apt-get upgrade -y
apt-get install --no-install-recommends -y openjdk-11-jre-headless curl unzip git patchutils
curl -fsSL -o jing.zip https://github.com/relaxng/jing-trang/releases/download/V20241231/jing-20241231.zip
curl -fsSL -o trang.zip  https://github.com/relaxng/jing-trang/releases/download/V20241231/trang-20241231.zip
EOT

RUN <<EOT bash
set -euxo pipefail

git config --global user.email cnxml
git config --global user.name cnxml

unzip jing.zip
unzip trang.zip
rm jing.zip
rm trang.zip

shopt -s globstar

jing_path=\$(echo /app/jing-*/**/jing.jar)
test -f \$jing_path
{
    echo '#!/usr/bin/env bash' 
    echo 'java -jar "'\$jing_path'" "\$@"'
} > /usr/local/bin/jing
chmod u+x /usr/local/bin/jing

trang_path=\$(echo /app/trang-*/**/trang.jar)
test -f \$trang_path
{
    echo '#!/usr/bin/env bash' 
    echo 'java -jar "'\$trang_path'" "\$@"'
} > /usr/local/bin/trang
chmod u+x /usr/local/bin/trang

EOT
