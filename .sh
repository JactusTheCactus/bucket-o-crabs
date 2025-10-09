#!/usr/bin/env bash
set -euo pipefail
FILE=bucket-o-crabs
BUILDS=(
	debug
	release
)
flag() {
	for f in "$@"; do
		[[ -e ".flags/$f" ]] || return 1
	done
}
tree .flags
if ! flag local; then
	rustup component add --toolchain nightly-x86_64-unknown-linux-gnu rustfmt
fi
if flag fmt; then
	cargo +nightly fmt
fi
if flag local/lint; then
	cargo clippy
fi
for i in "${BUILDS[@]}"; do
	if flag "build/$i"; then
		case "$i" in
			debug) BUILD="";;
			*) BUILD="--$i";;
		esac
		cargo build $BUILD
	else
		[[ -n "$i" ]] && rm -rf "target/$i"
	fi
done
if flag local; then
	mkdir -p bin
	for i in "${BUILDS[@]}"; do
		if flag "local/$i"; then
			mkdir -p "bin/$i"
			cp "target/$i/$FILE" "bin/$i/$FILE"
			if flag "local/$i/run"; then
				"./bin/$i/$FILE"
			fi
		else
			[[ -n "$i" ]] && rm -rf "bin/$i"
		fi
	done
fi
