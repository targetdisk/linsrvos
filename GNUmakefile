# Build Gentoo Crossdev target tuple

include mk/target.mk

export CROSSDEV_REPO ?= $(CURDIR)/modules/crossdev-podman

router: $(CROSSDEV_REPO)/.git  # FIXME: target unfinished, run "make shell" in the router dir instead for now
	make -Crouter

modules/crossdev-podman/.git:
	git submodule update --init --recursive -- modules/crossdev-podman

.PHONY: router
