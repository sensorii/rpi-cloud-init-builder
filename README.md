# rpi-cloud-init-builder

Builds cloud-init debian packages for Raspberry Pi using Docker.

Set `CLOUD_INIT_VERSION` in [docker-compose.yml](./docker-compose.yml)
to a [cloud-init git reference](https://git.launchpad.net/cloud-init/refs/).
(Default is `17.1`).

Custom config files for `/etc/cloud/` are in [config/](./config).

Run [./build.sh](./build.sh) to build the packages on x86 host machine using [qemu-user-static](https://github.com/multiarch/qemu-user-static).

Built files will be in the `./build/` directory, like this:

```
cloud-init_17.1-1-g5d7fd03-1~bddeb_all.deb
cloud-init_17.1-1-g5d7fd03-1~bddeb_armhf.build
cloud-init_17.1-1-g5d7fd03-1~bddeb_armhf.changes
cloud-init_17.1-1-g5d7fd03-1~bddeb.debian.tar.xz
cloud-init_17.1-1-g5d7fd03-1~bddeb.dsc
cloud-init_17.1-1-g5d7fd03.orig.tar.gz
cloud-init_all.deb -> cloud-init_17.1-1-g5d7fd03-1~bddeb_all.deb
cloud-init.dsc -> cloud-init_17.1-1-g5d7fd03-1~bddeb.dsc
```
