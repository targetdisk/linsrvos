LINUX_KERNEL ?= $(LINUX_REPO)/arch/$(ARCH)/boot/bzImage

linux: kernels/$(ARCH)-$(VENDOR).bzImage

kernels:
	mkdir $@

kernels/$(ARCH)-$(VENDOR).bzImage: $(LINUX_KERNEL) kernels
	cp $< $@

linux-cfgs/$(ARCH)-$(VENDOR).cfg:
	@echo Run \"make linux-menuconfig\" and copy linux/.config to $@.
	@exit 1

linux/.config: linux-cfgs/$(ARCH)-$(VENDOR).cfg
	$(PODMAN_RUN) make -j -C/opt/linux KCONFIG_ALLCONFIG=/opt/$< alldefconfig

$(LINUX_KERNEL): linux/.config
	$(PODMAN_RUN) make -j -C/opt/linux

linux-menuconfig:
	$(PODMAN_RUN) make -j -C/opt/linux menuconfig

.PHONY: linux
