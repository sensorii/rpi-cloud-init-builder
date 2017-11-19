#!/bin/bash -ex

CLOUD_INIT_VERSION=${CLOUD_INIT_VERSION:-17.1}

# get cloud-init source and checkout tag'd version
git clone https://git.launchpad.net/cloud-init /tmp/cloud-init
cd /tmp/cloud-init
git checkout -b ${CLOUD_INIT_VERSION}-rpi ${CLOUD_INIT_VERSION}

# apply small patch to fix failing lib imports
# (git commit is required to avoid error about uncomitted changes)
sed -i -e \
  's/from requests.packages.urllib3/from urllib3/' \
  cloudinit/sources/DataSourceScaleway.py
git config user.email "you@example.com"
git config user.name "Your Name"
git commit -am'Fix urllib3 imports'

# install dependencies
# (this is extracted from `packages/bddeb` script)
tools/read-dependencies \
  --distro debian \
  --python-version 2 \
  --install
tools/read-dependencies \
  --distro debian \
  --python-version 2 \
  --system-pkg-names \
  --requirements-file test-requirements.txt \
  --install

# build package files
python packages/bddeb \
  --python2 \
  --release ${CLOUD_INIT_VERSION} \
  --verbose

# copy files to the external volume
cp -av cloud-init* /build/