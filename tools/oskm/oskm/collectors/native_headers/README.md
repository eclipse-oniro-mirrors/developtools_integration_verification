# Native SDK headers

`native_headers` maps every installed ELF whose `elf_modules.category` contains
`native` to source header files under `interface/sdk_c`.

## Matching order

1. **`BUILD.gn`**: `interface/sdk_c/**/BUILD.gn` is the primary source. The
   collector parses `ohos_native_library.system_capability_headers` and resolves
   the declared paths through `ohos_native_headers.dest_dir`.
2. **`@library` tags**: for libraries without a GN header declaration, each
   header's Doxygen `@library` tag names its consumer `.so`.
3. **Exported symbols**: if both declarations are absent, exported ELF symbols
   are matched against function declarations in SDK headers. This is only a
   fallback for upstream libraries such as `libuv`.

## Output

Each row in `native_headers` is one `(elf_module_id, header_path)` pair:

- `elf_module_id` is the foreign key to `elf_modules`.
- `header_path` is workspace-relative and points to the `interface/sdk_c`
  source header that `ohos_native_headers.sources` installs into the SDK.
- `match_strategy` records which of the three sources produced the row.

Unresolved libraries are reported as advisory issues rather than guessed.

