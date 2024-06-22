LINUX_REPO ?= $(CURDIR)/linux
CROSSDEV_REPO ?= $(CURDIR)/crossdev-podman
SETUP_SCRIPTS ?= $(CURDIR)/setup-scripts
EXTRA_PODMAN_FLAGS ?= -v $(LINUX_REPO):/opt/linux \
	              -v $(CURDIR)/linux-cfgs:/opt/linux-cfgs

include ../mk/target.mk
include $(CROSSDEV_REPO)/GNUmakefile

linux:
	$(MAKE) linux/vmlinux

linux-cfgs/$(ARCH)-$(VENDOR).cfg:
	@echo Run \"make linux-menuconfig\" and copy linux/.config to $@.
	@exit 1

linux/.config: linux-cfgs/$(ARCH)-$(VENDOR).cfg
	$(PODMAN_RUN) make -j -C/opt/linux KCONFIG_ALLCONFIG=/opt/$< alldefconfig

linux/vmlinux: linux/.config
	$(PODMAN_RUN) make -j -C/opt/linux

linux-menuconfig:
	$(PODMAN_RUN) make -j -C/opt/linux menuconfig

.PHONY: linux
