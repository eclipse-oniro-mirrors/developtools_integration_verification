"""Only installed, directly contained system/profile JSON declares inventory."""
import os

from ...core.framework import READ_ERRORS
from ...core.models import ScanFatalError


def profile_paths(ctx):
    """Source files, in a stable order.

    Also resets the per-file state map linking consults: 'this profile declares
    no SA' and 'this profile could not be read' lead to different diagnostics,
    so the distinction has to survive past parsing.
    """
    ctx.states = {}
    try:
        with os.scandir(ctx.directory) as entries:
            paths = sorted(ctx.directory / e.name for e in entries
                           if e.name.endswith('.json') and not e.is_dir(follow_symlinks=False))
    except OSError:
        ctx.issue(ctx.directory, 'PROFILE_DIRECTORY_UNREADABLE')
        return []
    if len(paths) > ctx.limits.input_files:
        raise ScanFatalError('SA_INPUT_COUNT_LIMIT')
    ctx.total_profiles = len(paths)
    return paths


def profile_elements(ctx, path):
    """(context, document, element, pointer) for every systemability declared."""
    profile = path.relative_to(ctx.package).as_posix()
    ctx.progress('profiles', len(ctx.states), ctx.total_profiles, profile)
    ctx.states[profile] = 'error'
    try:
        doc = ctx.read_json(path, ctx.package)
    except READ_ERRORS as exc:
        ctx.issue(path, 'PROFILE_' + getattr(exc, 'code', 'INVALID_JSON'))
        return
    if not isinstance(doc, dict):
        ctx.issue(path, 'PROFILE_NOT_OBJECT')
        return
    if 'systemability' not in doc:
        ctx.states[profile] = 'unrelated'
        return
    if not isinstance(doc['systemability'], list):
        ctx.issue(path, 'SYSTEMABILITY_NOT_ARRAY', '/systemability')
        return
    ctx.states[profile] = 'sa' if doc['systemability'] else 'empty'
    for n, raw in enumerate(doc['systemability']):
        pointer = '/systemability/' + str(n)
        if not isinstance(raw, dict):
            ctx.issue(path, 'SA_NOT_OBJECT', pointer)
        else:
            yield (profile,), doc, raw, pointer
