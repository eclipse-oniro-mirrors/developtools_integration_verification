"""Git URL builder — ported from viewer/src/model/gitlink.js.

Builds git repository access URLs from workspace-relative paths or GN labels,
using repo manifest data (path, remote_url, head_commit/revision).
"""
from __future__ import annotations

import re

_HOSTS = [
    (re.compile(r'gitlab', re.I),
     lambda base, ref, path: f'{base}/-/tree/{ref}/{path}' if path else f'{base}/-/tree/{ref}'),
    (re.compile(r'.*'),
     lambda base, ref, path: f'{base}/tree/{ref}/{path}' if path else f'{base}/tree/{ref}'),
]

_REPO_CACHE: dict[int, list[dict]] = {}


def _repo_index(session) -> list[dict]:
    scan_id = session.scan_id
    if scan_id in _REPO_CACHE:
        return _REPO_CACHE[scan_id]
    repos = list(session.sql(
        'SELECT name, path, remote_url, revision, head_commit FROM repos '
        'WHERE scan_id = ? AND path IS NOT NULL AND path != ""', (scan_id,)))
    repos.sort(key=lambda r: len(r.get('path', '')), reverse=True)
    _REPO_CACHE[scan_id] = repos
    return repos


def reset_cache():
    _REPO_CACHE.clear()


def git_url(session, path: str, line: int | None = None) -> dict | None:
    """Build a git URL for a workspace-relative path or GN label.

    Returns {url, repo, ref, file_path, exact} or None if no repo matches.
    """
    if not path:
        return None

    # 1. Input recognition
    if path.startswith('//'):
        directory = path[2:].split(':')[0].rstrip('/')
        search_path = directory
        is_label = True
    else:
        search_path = path
        is_label = False

    # 2. Longest prefix match
    repos = _repo_index(session)
    repo = None
    for r in repos:
        rp = (r.get('path') or '').strip('/')
        if not rp:
            continue
        if search_path == rp or search_path.startswith(rp + '/'):
            repo = r
            break
    if not repo or not repo.get('remote_url'):
        return None

    # 3. Repo-relative path
    rp = (repo['path'] or '').strip('/')
    if is_label:
        rel = search_path[len(rp):].lstrip('/') if search_path.startswith(rp) else search_path
        file_path = f'{rel}/BUILD.gn' if rel else 'BUILD.gn'
    else:
        file_path = path[len(rp):].lstrip('/') if path.startswith(rp) else path

    # 4. Ref selection
    ref = repo.get('head_commit') or repo.get('revision')
    if not ref:
        return None

    # 5. URL construction
    base = repo['remote_url'].removesuffix('.git').rstrip('/')
    builder = next(fn for pattern, fn in _HOSTS if pattern.search(base))
    url = builder(base, ref, file_path)

    # 6. Line anchor
    if line:
        url += f'#L{line}'

    return {
        'url': url,
        'repo': repo['name'],
        'ref': ref,
        'file_path': file_path,
        'exact': bool(repo.get('head_commit')),
    }
