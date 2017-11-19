# rpi-cloud-init-builder

Builds cloud-init debian packages for Raspberry Pi.

Set `CLOUD_INIT_VERSION` in [docker-compose.yml](./docker-compose.yml)
to a [cloud-init git reference](https://git.launchpad.net/cloud-init/refs/).
(Default is `17.1`).

Run `build.sh` to build the packages on x86 host machine using [qemu-user-static](https://github.com/multiarch/qemu-user-static).  (Takes a while for all tests to be run.)

Built files will be in the `./build/` directory.
