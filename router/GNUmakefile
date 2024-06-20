LINUX_REPO ?= $(CURDIR)/linux
CROSSDEV_REPO ?= $(CURDIR)/crossdev-podman
SETUP_SCRIPTS ?= $(CURDIR)/setup-scripts
EXTRA_PODMAN_FLAGS ?= -v $(LINUX_REPO):/opt/linux

include ../mk/target.mk
include $(CROSSDEV_REPO)/GNUmakefile

linux:
	$(PODMAN_RUN) make -C/opt/linux

linux-menuconfig:
	$(PODMAN_RUN) make -C/opt/linux menuconfig

.PHONY: linux
