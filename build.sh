#!/usr/bin/env bash
all() {
	dev () {
		cargo run
	}
	build() {
		cargo build
	}
	if [[ -f .bash/dev.sh ]]; then
		dev
	else
		build
	fi
}
all
