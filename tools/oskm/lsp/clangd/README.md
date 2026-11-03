# OSKM clangd 21.1.7-oskm1

`bin/clangd` is a Linux x86_64 build of LLVM **llvmorg-21.1.7**
(`292dc2b86f66e39f4b85ec8b185fd8b60f5213ce`) with the two source patches
in `patches/`. The resource headers in `lib/clang/21/` remain from 21.1.7.
The binary is a Release build with LLVM assertions disabled, matching the
previous bundled binary. The binary is distributed through Git LFS. Run
`git lfs pull` after checkout.

## Background index fixes

1. `0001-remember-successful-header-upgrades.patch` fixes the condition that
   skips an in-memory shard version update. For unchanged content, a successful
   parse must replace an earlier incomplete result. Previously this transition
   was skipped, so later successful translation units repeatedly serialized
   the same shared headers. The patch includes a cold-index regression test
   with one missing generated header followed by two successful translation
   units; it checks recovered symbols, the stored error flag, and write count.
2. `0002-reuse-signal-cleanup-nodes.patch` backports LLVM commit
   [5b21ec3b69504f2fa3fcd2c91edf1df57130876c](https://github.com/llvm/llvm-project/commit/5b21ec3b69504f2fa3fcd2c91edf1df57130876c).
   Temporary-file registrations reuse empty list nodes. Registration and
   cancellation therefore scan a list governed by concurrent registrations,
   instead of all historical shard writes. It preserves fatal-signal cleanup
   and includes tests for cancelled registrations, repeated cleanup, and
   concurrent registration/cancellation.

A failed translation unit marks its included headers as potentially incomplete;
this does not mean that each header contains a syntax error. Compilation
databases can include optional targets whose generated headers do not exist.
Such input errors still need to be investigated, but must not make subsequent
successful indexing repeatedly write an unchanged header for the lifetime of
the process. These fixes retain partial indexing and later recovery.

## Rebuild

Use a separate LLVM source and build directory. Do not patch an executable that
is already running. Source patches and binaries are covered by `LICENSE.TXT`
(Apache-2.0 WITH LLVM-exception).

Download the source archive from
[LLVM llvmorg-21.1.7](https://github.com/llvm/llvm-project/tree/llvmorg-21.1.7).
The GitHub tag archive `llvm-project-21.1.7.tar.gz` used for this build has
SHA256 `9ee167cdf8f6b5221d6b02dbe9a664cf8c6fee70fab071aaa4a3889c7c265258`.
The exact compiler, configuration and artifact checksums are recorded in
`build-info.json`.

```bash
# Set these to separate, absolute directories before running the commands.
# oskm_clangd_dir: this directory in the integration_verification checkout
# llvm_source: extracted llvmorg-21.1.7 source
# llvm_build: a new build directory
# oh_root: OpenHarmony source root with the host compiler and Ninja prebuilts
patch --batch -d "$llvm_source" -p1 \
  < "$oskm_clangd_dir/patches/0001-remember-successful-header-upgrades.patch"
patch --batch -d "$llvm_source" -p1 \
  < "$oskm_clangd_dir/patches/0002-reuse-signal-cleanup-nodes.patch"

cmake -S "$llvm_source/llvm" -B "$llvm_build" -G Ninja \
  -DCMAKE_MAKE_PROGRAM="$oh_root/prebuilts/build-tools/linux-x86/bin/ninja" \
  -DCMAKE_C_COMPILER="$oh_root/prebuilts/clang/ohos/linux-x86_64/llvm/bin/clang" \
  -DCMAKE_CXX_COMPILER="$oh_root/prebuilts/clang/ohos/linux-x86_64/llvm/bin/clang++" \
  -DCMAKE_BUILD_TYPE=Release \
  '-DLLVM_ENABLE_PROJECTS=clang;clang-tools-extra' \
  '-DLLVM_TARGETS_TO_BUILD=X86;AArch64;ARM' \
  -DLLVM_INCLUDE_TESTS=ON -DLLVM_ENABLE_ASSERTIONS=OFF \
  -DLLVM_ENABLE_LIBXML2=OFF -DLLVM_ENABLE_ZSTD=OFF \
  -DLLVM_ENABLE_ZLIB=ON -DLLVM_ENABLE_LIBEDIT=OFF -DLLVM_USE_LINKER=lld \
  -DCLANG_ENABLE_STATIC_ANALYZER=OFF -DCLANG_ENABLE_ARCMT=OFF \
  -DCLANGD_ENABLE_REMOTE=OFF -DLLVM_VERSION_SUFFIX=-oskm1
cmake --build "$llvm_build" --parallel 32 \
  --target clangd ClangdTests SupportTests
"$llvm_build/tools/clang/tools/extra/clangd/unittests/ClangdTests" \
  --gtest_filter='BackgroundIndexTest.*'
"$llvm_build/unittests/Support/SupportTests"
```

After verification, copy the newly built binary into a separate packaging
checkout's `bin/clangd` and strip it with the host toolchain's `llvm-strip`.
Re-run OSKM's `test_portable_index.py` with `LSP_TEST_CLANGD` pointing to that
packaged binary. Update `build-info.json` with the resulting checksums before
publishing it.

The CLI and shard format remain those of clangd 21.1.7. Portable artifacts
require matching producer and consumer version strings; regenerate portable
artifacts with this version before distributing them with this binary. A
running clangd continues using its original executable and in-memory state;
these changes take effect for new processes.
