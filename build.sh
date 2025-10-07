#!/usr/bin/env bash
set -euo pipefail
#LOG=crabs.log
ifFile() {
	[[ -f ".bash/$1.sh" ]]
}
all() {
	pre() {
		cargo fmt
		cargo clippy
	}
	main() {
		dev() {
			cargo run
		}
		build() {
			cargo build
		}
		if ifFile "dev"; then
			dev
		else
			build
		fi
	}
	pre
	main
}
all
