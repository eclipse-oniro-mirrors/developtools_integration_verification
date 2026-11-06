"""Deterministic bounded discovery; retain logical source identities on read failure."""
import os
import re
from pathlib import Path
from typing import NamedTuple
from ...core.models import RequestError, ScanFatalError
from .models import SUFFIXES, VARIANTS


class SourceFile(NamedTuple):
    """One declaration file, already resolved to the entity it declares.

    Two different relative paths, deliberately: `key` is SDK-relative and is
    what module keys and import specifiers are expressed in, `source_path` is
    workspace-relative and is what locates the file in its repository.
    """
    key: str                    # relative to the SDK root
    source_path: str            # relative to the workspace root
    path: Path
    role: str                   # 'module' | 'kit_entry'
    declaration_format: str     # d.ts | d.ets | static.d.ets
    language_variant: str       # dynamic | static
    module_key: str | None      # source_path minus the language suffix
    module_name: str | None     # bare import specifier, when it has one
    declaration_scope: str | None   # where the declaration lives; a path fact
    kit_key: str | None         # '@kit.<Name>' for a well-formed Kit entry


def split(key):
    """Return (path without language suffix, format, language variant)."""
    suffix = next(s for s in SUFFIXES if key.endswith(s))
    return key[:-len(suffix)], suffix[1:], VARIANTS[suffix]


def kit_name(key):
    stem = split(Path(key).name)[0]
    return stem if re.fullmatch(r'@kit\.[A-Za-z_][A-Za-z_0-9]*', stem) else None


def classify(key):
    """Project a discovered path onto the entity it declares.

    Two files differing only by language suffix are one module: the key drops
    that suffix. `module_name` stays None for the declaration files that are
    only reachable by relative path -- they are modules in the TypeScript sense
    but cannot be named in an import.
    """
    path = Path(key)
    module_key, declaration_format, variant = split(key)
    parent = path.parent.as_posix()
    stem = Path(module_key).name
    # Where the declaration lives. Purely positional -- how it is implemented
    # is a separate column, because these directories are mixed.
    scope = ('arkts_builtin' if key.startswith('arkts/builtin/') else
             'internal_component' if key.startswith('api/@internal/component/ets/') else
             'internal_ets' if key.startswith('api/@internal/ets/') else
             'arkts_named' if parent == 'arkts' else
             'api_named' if parent == 'api' else 'api_auxiliary')
    named = ((parent == 'api' and stem.startswith(('@ohos.', '@system.'))) or
             (parent == 'arkts' and stem.startswith('@arkts.')))
    role = 'kit_entry' if key.startswith('kits/') else 'module'
    return SourceFile(key=key, source_path=key, path=Path(), role=role,
                      declaration_format=declaration_format, language_variant=variant,
                      module_key=None if role == 'kit_entry' else module_key,
                      module_name=stem if named and role == 'module' else None,
                      declaration_scope=None if role == 'kit_entry' else scope,
                      kit_key=kit_name(key) if role == 'kit_entry' else None)


def discover(ctx):
    files, visited = [], 0
    ctx.discovery_complete = True
    roots = [ctx.sdk_root / name for name in ('api', 'arkts', 'kits')]
    if not any(path.is_dir() and not path.is_symlink() for path in roots):
        raise RequestError('ARKTS_INPUT_SUBDIRS_MISSING')

    def issue(path, code):
        ctx.discovery_complete = False
        ctx.issue(path, code)

    def walk(directory, depth):
        nonlocal visited
        ctx.check()
        if depth > ctx.limits.tree_depth:
            raise ScanFatalError('ARKTS_DISCOVERY_DEPTH_LIMIT')
        ctx.scan_directories.add(str(directory))
        try:
            with os.scandir(directory) as entries:
                ordered = []
                for entry in entries:
                    visited += 1
                    if visited > ctx.limits.tree_items:
                        raise ScanFatalError('ARKTS_DISCOVERY_ITEM_LIMIT')
                    ordered.append(entry)
            ordered.sort(key=lambda e: e.name)
        except OSError:
            issue(directory, 'ARKTS_DISCOVERY_UNREADABLE')
            return
        for entry in ordered:
            ctx.check()
            path = Path(entry.path)
            try:
                if entry.is_dir(follow_symlinks=False):
                    walk(path, depth + 1)
                    continue
                if entry.is_symlink() and path.is_dir():
                    issue(path, 'ARKTS_DISCOVERY_SYMLINK_DIRECTORY')
                    continue
            except (OSError, RuntimeError):
                issue(path, 'ARKTS_DISCOVERY_PATH_INVALID')
            if not entry.name.endswith(SUFFIXES):
                continue
            ctx.track((path,))
            files.append(classify(path.relative_to(ctx.sdk_root).as_posix())._replace(
                path=path, source_path=ctx.relative(path)))

    for root in roots:
        if root.is_symlink():
            issue(root, 'ARKTS_DISCOVERY_SYMLINK_DIRECTORY')
        elif not root.is_dir():
            issue(root, 'ARKTS_DISCOVERY_SUBDIR_MISSING')
        else:
            walk(root, 0)
    return sorted(files, key=lambda item: item.key)
