FROM ubuntu:latest
MAINTAINER Gard Voigt Rimestad <docker@gurters.com>

RUN apt-get update && apt-get install -y puppet-common
RUN mkdir -p /tmp/puppet/manifests/
RUN mkdir -p /tmp/puppet/modules/
RUN mkdir -p /tmp/puppet/hieradata/
COPY manifests/rvm.pp /tmp/puppet/manifests/
COPY hiera.yaml /tmp/puppet/
COPY hieradata/common.yaml /tmp/puppet/hieradata/
COPY modules/ /tmp/puppet/modules
RUN puppet apply --verbose --modulepath='/tmp/puppet/modules' --hiera_config=/tmp/puppet/hiera.yaml /tmp/puppet/manifests/rvm.pp
