#!/usr/bin/env bash
set -euo pipefail
FILE="bucket-o-crabs"
flag() {
	[[ -f ".flags/$1" ]]
}
all() {
	pre() {
		cargo fmt
		cargo clippy
	}
	main() {
		cargo build
	}
	post() {
		copy() {
			cp "target/debug/$FILE" "$FILE"
			chmod +x "$FILE"
		}
		run() {
			"./$FILE"
		}
		if flag local; then
			copy
		fi
		if flag run; then
			run
		fi
	}
	pre && main && post
}
all
