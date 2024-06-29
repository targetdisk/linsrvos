VM_MEM_SIZE ?= 2048  # (In MiB)
MNT_TAG ?= fsRoot
ACCEL ?= kvm

IS_NATIVE := $(findstring $(strip $(ARCH)),$(strip $(HOSTTYPE)))

LINUX_CMDLINE ?= root=$(MNT_TAG) rw rootfstype=9p \
		 rootflags=trans=virtio,version=9p2000.L,msize=5000000,cache=mmap,posixacl \
		 console=ttyS0

QEMU_CMD := qemu-system-$(ARCH) -nographic -net user -m $(VM_MEM_SIZE) -boot strict=on \
	    -machine dump-guest-core=off,$(if $(IS_NATIVE),accel=$(ACCEL),) \
	    $(if $(IS_NATIVE),-cpu host,) \
	    -kernel kernels/$(ARCH)-$(VENDOR).bzImage -append '$(LINUX_CMDLINE)' \
	    -fsdev local,security_model=mapped,multidevs=remap,id=fsdev-$(MNT_TAG),path=targets/$(TARGET) \
	    -device virtio-9p-pci,id=$(MNT_TAG),fsdev=fsdev-$(MNT_TAG),mount_tag=$(MNT_TAG) \
	    -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny

qemu-test: all
	$(QEMU_CMD)
