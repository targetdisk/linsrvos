# Build Gentoo Crossdev target tuple

include mk/target.mk

export CROSSDEV_REPO ?= $(CURDIR)/modules/crossdev-podman

all: router

router: $(CROSSDEV_REPO)/.git
	$(MAKE) -j -Crouter

modules/crossdev-podman/.git:
	git submodule update --init --recursive -- modules/crossdev-podman

.PHONY: all router
