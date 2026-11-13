# Design

The collector depends on `elf_modules` and never reclassifies Native SDK libraries. It
only consumes rows whose `category` JSON array contains `native`.

`BUILD.gn` is preferred over header tags and symbol matching because it is the
build-time declaration of which headers belong to which Native SDK library. Header
tags remain useful for libraries that do not declare `system_capability_headers`.
Symbol matching is last and requires a unique best-scoring header because symbols
can be shared, forwarded, or declared in helper headers.

The table keeps one row per header, not one row per symbol, because the mapping
question is “which headers describe this library.” `match_strategy` preserves
the source quality, while SysCap and symbol evidence are not mapping attributes.

`header_path` is the workspace-relative source path under `interface/sdk_c`.
The collector uses `ohos_native_headers.sources` to translate installed SDK paths
such as `hilog/log.h` back to their source paths.

