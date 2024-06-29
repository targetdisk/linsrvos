LINUX_REPO ?= $(CURDIR)/linux
CROSSDEV_REPO ?= $(CURDIR)/crossdev-podman
SETUP_SCRIPTS ?= $(CURDIR)/setup-scripts
EXTRA_PODMAN_FLAGS ?= -v $(LINUX_REPO):/opt/linux \
	              -v $(CURDIR)/linux-cfgs:/opt/linux-cfgs

all: targets/.$(TARGET) linux

include ../mk/target.mk
include $(CROSSDEV_REPO)/GNUmakefile
include ../mk/linux.mk
include ../mk/qemu.mk

.PHONY: all
