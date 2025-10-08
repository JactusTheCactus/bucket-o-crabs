#!/usr/bin/env bash
set -euo pipefail
FILE="bucket-o-crabs"
flag() {
	for f in "$@"; do
		if [[ ! -f ".flags/$f" ]]; then
			return 1
		fi
	done
	return 0
}
all() {
	pre() {
		if flag fmt; then
			cargo fmt && cargo clippy
		fi
	}
	main() {
		cargo build
	}
	post() {
		copy() {
			mkdir -p bin
			cp "target/debug/$FILE" "bin/$FILE"
		}
		run() {
			"./bin/$FILE"
		}
		if flag local; then
			copy
			if flag run; then
				run
			fi
		fi
	}
	pre && main && post
}
all
