
#!/usr/bin/env bash

SRC=$(cd $(dirname "$0"); pwd)
source "${SRC}/../include.sh"

cd $file_path

############# TEST

echo -e "\033[1mRunning tests:\033[0m"

cat all.json | $pm2 start -
should 'should start processes' 'online' 6

cat all.json | $pm2 delete -
should 'should delete all processes' 'name' 0
