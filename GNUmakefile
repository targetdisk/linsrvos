# Build Gentoo Crossdev target tuple

include mk/target.mk

CROSSDEV_REPO ?= $(CURDIR)/modules/crossdev-podman

router: $(CROSSDEV_REPO)/.git  # FIXME: target unfinished, run "make shell" in the router dir instead for now
	make TARGET=$(TARGET) CROSSDEV_REPO=$(CROSSDEV_REPO) -Crouter

modules/crossdev-podman/.git:
	git submodule update --init --recursive -- modules/crossdev-podman

.PHONY: router
