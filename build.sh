#!/usr/bin/env bash
LOG=crabs.log
all() {
	pre() {
		fmt() {
			cargo fmt
			cargo clippy
		}
		fmt
	}
	main() {
		dev () {
			cargo run
		}
		build() {
			cargo build
		}
		build > $LOG
		if [[ -f .bash/dev.sh ]]; then
			dev
		fi
	}
	pre > $LOG
	main 2> $LOG
}
all
