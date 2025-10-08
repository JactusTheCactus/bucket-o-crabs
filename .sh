#!/usr/bin/env bash
set -euo pipefail
FILE="bucket-o-crabs"
DEBUG="target/debug/$FILE"
BIN="bin/$FILE"
flag() {
	for f in "$@"; do
		if [[ ! -e ".flags/$f" ]]; then
			return 1
		fi
	done
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
			if flag local; then
				mkdir -p bin
				cp "$DEBUG" "$BIN"
			fi
		}
		run() {
			if flag local/run; then
				"./$BIN"
			fi
		}
		copy && run
	}
	pre && main && post
}
all
