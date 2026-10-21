"""dest expansion: one SMI row installs 0..N targets.

A dest is a path inside the image, relative and normalised. Ten of them on
rk3568 end in '/' -- those are HAP *directory* installs, where every file below
the directory belongs to the module, so exact-path lookup alone would miss them
(see modules_at()).
"""
import os
from pathlib import PurePosixPath

from ...core.shape import UNSET
from .records import field_value

# A directory install is a handful of entries (10 on rk3568), but the tree below
# one is unbounded in principle. Stop counting rather than walk forever; the
# caller reports what it hit.
DIR_ENTRY_CAP = 50_000


def resolve_link_target(dest, link_target):
    """Resolve a symlink's text to a full image-relative path.

    Symlink targets come in three forms on rk3568:
      bare name  'toybox'        → resolved as dirname(dest) + '/' + 'toybox'
      relative  '../lib/libx.so' → resolved by normpath against dirname(dest)
      absolute  '/system/...'   → stored as-is (without leading /)

    Returns the normalised path (same format as `dest`), or None.
    """
    if not isinstance(link_target, str) or not link_target:
        return None
    dest_dir = os.path.dirname(dest)
    # Strip leading './' if present (e.g. './ld-musl-arm.so.1')
    raw = link_target
    if raw.startswith('./'):
        raw = raw[2:]
    # normpath handles '../' and './' in the middle
    resolved = os.path.normpath(os.path.join(dest_dir, raw))
    # Strip any leading ./ or ../ that escaped (shouldn't happen on valid data)
    if resolved.startswith('..'):
        return None
    return resolved.replace('\\', '/')


def measure(ctx, dest):
    """What the package actually holds at `dest`.

    Returns (size, link_target, status):
      size         bytes this entry itself occupies, or None if it is not there
      link_target  the link's text when it is a symlink, else None
      status       'file' | 'link' | 'dir' | 'missing'

    **lstat, never stat.** Following a symlink would charge the target's bytes
    to the link as well, and the target is often installed in its own right --
    rk3568's single symlink points at a file that is, so a followed size would
    add 1.9 MB to the image total twice.

    This is an observation of the package, not a reading of the declaration:
    it is why `size` has a column but no place in `record`.
    """
    path = ctx.package / dest
    try:
        info = path.lstat()
    except OSError:
        return None, None, 'missing'

    if os.path.islink(path):
        return info.st_size, os.readlink(path), 'link'
    if not os.path.isdir(path):
        return info.st_size, None, 'file'

    total = seen = 0
    # followlinks=False: a symlinked directory inside the tree would otherwise
    # let the walk escape the package, and its bytes are charged where the real
    # directory is installed.
    for base, _, files in os.walk(path, followlinks=False):
        for name in files:
            try:
                total += os.lstat(os.path.join(base, name)).st_size
            except OSError:
                continue            # vanished mid-walk; the rest still counts
            seen += 1
            if seen >= DIR_ENTRY_CAP:
                return total, None, 'dir'
    return total, None, 'dir'


def normalize_dest(value):
    """Canonical image-relative path, or None if the declaration is unusable.

    Returns (path, is_directory): a trailing slash is the declaration's way of
    saying "the whole directory", and that distinction has to survive.
    """
    if not isinstance(value, str) or not value:
        return None
    if value.startswith('/') or '\\' in value or '\x00' in value:
        return None
    directory = value.endswith('/')
    parts = []
    for part in value.split('/'):
        if part in ('', '.'):
            continue
        if part == '..':
            return None
        parts.append(part)
    if not parts:
        return None
    return '/'.join(parts), directory


def expand(ctx, records, path):
    """Emit one install_targets row per entry this module puts in the image.

    Two declarations feed it: `dest[]` (the artifact) and `symlink_file[]`
    (links the module creates). See symlink-design.md -- the two keys point in
    opposite directions, but both land in the image, so both become rows.

    Also reports a dest claimed by more than one module: the build installs both
    and the later one wins at image-assembly time, so neither declaration can be
    dropped and the ambiguity belongs in the issue list.
    """
    seen = {}
    for position, (record, pointer) in enumerate(records):
        dests = record.get('dest')
        if not isinstance(dests, list):
            ctx.issue(path, 'MODULE_ROW_INVALID', f'{pointer}/dest')
            continue

        # Two declarations, one list of things this module puts in the image:
        #   dest[]          the artifact itself (a symlink when symlink_path is set)
        #   symlink_file[]  links the module creates, pointing at its own dest
        # They are opposite directions (see symlink-design.md §3.1), but from the
        # image's point of view both are just "an entry at a path", so both become
        # install_targets rows.
        # symlink_file is not in SHAPE.primary, so it lives in the record's
        # config bucket -- look it up by its *declared* name, which is what
        # field_value() is for. record.get() would silently miss it.
        links = field_value(record, 'symlink_file')
        links = None if links is UNSET else links
        if links is not None and not isinstance(links, list):
            ctx.issue(path, 'MODULE_ROW_INVALID', f'{pointer}/symlink_file')
            links = None
        plan = [('dest', dests)] + ([('symlink_file', links)] if links else [])

        # One running number across both arrays. `dest_index` only ever means
        # "the Nth thing this module puts in the image" -- nothing maps it back
        # to an array subscript -- so continuing the count keeps the unique key
        # working without inventing a `kind` column.
        ordinal = 0
        placed = set()
        for field, values in plan:
            for index, value in enumerate(values):
                normalized = normalize_dest(value)
                if normalized is None:
                    code = ('MODULE_DEST_INVALID' if field == 'dest'
                            else 'MODULE_SYMLINK_INVALID')
                    ctx.issue(path, code, f'{pointer}/{field}/{index}')
                    continue
                dest, directory = normalized
                # The same path in both arrays is one entry, not two: rk3568 has
                # exactly one (etsstdlib.abc), where symlink_file names the same
                # place as dest and symlink_path says what it points at. A second
                # row would make modules_at() return two rows for one file.
                if dest in placed:
                    continue
                placed.add(dest)

                size, link_target, status = measure(ctx, dest)
                if status == 'missing':
                    # The declaration installs something the package does not
                    # have. Advisory: both files read fine, they just disagree --
                    # a fact about the product, not a gap in the scan.
                    ctx.issue(path, 'TARGET_MISSING', f'{pointer}/{field}/{index}',
                              severity='warning', advisory=True, details=dict(dest=dest))
                elif field == 'symlink_file' and status != 'link':
                    # Declared as a link, but the package holds a real file or a
                    # directory. Never fires on rk3568 (776/776 are links) -- it
                    # exists because breaking this invariant means the build put a
                    # full copy where a link belongs, and the image silently grows.
                    ctx.issue(path, 'SYMLINK_NOT_A_LINK', f'{pointer}/{field}/{index}',
                              severity='warning', advisory=True,
                              details=dict(dest=dest, found=status))
                elif status == 'dir' and not directory:
                    # Declared as a file (no trailing slash) but the package holds
                    # a directory. Matters beyond cosmetics: modules_at() only does
                    # the prefix fallback for declared directories, so files below
                    # this one cannot be traced back to their module.
                    ctx.issue(path, 'TARGET_DIRECTORY_UNDECLARED',
                              f'{pointer}/{field}/{index}',
                              severity='warning', advisory=True, details=dict(dest=dest))

                ctx.track((ctx.package / dest,))
                ctx.emit('install_targets', dict(
                    module_position=position, dest_index=ordinal, dest=dest,
                    # A link is never a directory install, whatever the path looks like
                    directory=int(directory and field == 'dest'),
                    partition=dest.split('/')[0],
                    file_name=PurePosixPath(dest).name,
                    size=size,
                    link_target_path=resolve_link_target(dest, link_target) if link_target else None))
                ordinal += 1
                seen.setdefault(dest, []).append((position, pointer))
    for dest, places in seen.items():
        if len(places) > 1:
            declarations = [p for _, p in places]
            for _, pointer in places:
                ctx.issue(path, 'INSTALL_DEST_AMBIGUOUS', f'{pointer}/dest',
                          severity='warning', advisory=True,
                          details=dict(dest=dest, declarations=declarations))


def modules_at(rows, dest):
    """Rows installing `dest`: exact match first, then the longest directory
    install covering it. Directory installs are a handful, so the fallback scan
    is cheaper than maintaining a prefix index."""
    exact = [row for row in rows if row['dest'] == dest]
    if exact:
        return exact
    covering = [row for row in rows
                if row['directory'] and dest.startswith(row['dest'] + '/')]
    if not covering:
        return []
    longest = max(len(row['dest']) for row in covering)
    return [row for row in covering if len(row['dest']) == longest]
