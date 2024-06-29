export ARCH ?= x86_64
export LIBC ?= musl
export VENDOR ?= targetdisk
export TARGET ?= $(ARCH)-$(VENDOR)-linux-$(LIBC)
export HOSTTYPE := $(shell echo $$HOSTTYPE)
