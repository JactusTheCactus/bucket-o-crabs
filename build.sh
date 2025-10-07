#!/usr/bin/env bash
#LOG=crabs.log
ifFile() {
	[[ -f ".bash/$1.sh" ]]
}
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
		if [[ -f .bash/dev.sh ]]; then
			dev
		else
			build
		fi
	}
	pre
	main
}
all
