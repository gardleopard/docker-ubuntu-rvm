puppet module install --modulepath $PWD maestrodev/rvm
docker build -t="gardleopard/ubuntu-rvm:1" .
