.PHONY: setup sync build-42 build-36 build-all

setup:
	./scripts/bootstrap_qmk.sh

sync: setup
	./scripts/sync_keymap.sh

build-42: sync
	./scripts/build.sh 42

build-36: sync
	./scripts/build.sh 36

build-all: sync
	./scripts/build.sh all
