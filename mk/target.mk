ARCH ?= x86_64
LIBC ?= musl
VENDOR ?= targetdisk
TARGET ?= $(ARCH)-$(VENDOR)-linux-$(LIBC)
