CROSSDEV_REPO ?= modules/crossdev-podman

modules/crossdev-podman/.git:
	git submodule update --init --recursive -- modules/crossdev-podman

router: $(CROSSDEV_REPO)/.git
