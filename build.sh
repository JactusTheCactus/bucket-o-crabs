#!/usr/bin/env bash
# LOG=crabs.log
all() {
	pre() {
		fmt() {
			cargo fmt
			cargo clippy
		}
		fmt
	}
	main() {
		dev() {
			cargo run
		}
		build() {
			cargo build
		}
		build
		if [[ -f .bash/dev.sh ]]; then
			dev
		fi
	}
	pre
	main
}
all
