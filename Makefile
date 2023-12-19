PROJECT_DIR=$HOME/Rust/src/github.com/abitofhelp/apis-rust

.PHONY:baz_build_all baz_clean baz_run baz_sync_from_cargo baz_test cratelist cratepub cratepub_dryrun

baz_build_all:
	@bazel build //...

baz_clean:
	@bazel clean --expunge --async

baz_run:
	@bazel run //crates/rust-bazel:apis-rust

baz_sync_from_cargo:
	@CARGO_BAZEL_REPIN=true bazel sync --only=crate_index

baz_test_calculator:
	@bazel test //crates/mycalculator:mycalculator_test

cratelist:
	@cargo package --list

cratepub_dryrun:
	@cargo publish --dry-run

cratepub:
	@cargo publish -publish apis-rust

