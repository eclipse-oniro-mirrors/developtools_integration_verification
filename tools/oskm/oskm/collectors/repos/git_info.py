"""Git metadata collection: HEAD commit and remote URL via direct file reads.

No subprocess is spawned: HEAD is read from ``.git/HEAD`` (detached HEAD
contains the SHA directly; symbolic refs are followed through ``packed-refs``)
and the remote URL from ``.git/config``.  The ``.git`` file in a repo-managed
workspace points to ``.repo/projects/…``, which is resolved once per repo.
"""
from pathlib import Path

from concurrent.futures import ThreadPoolExecutor, as_completed


def _resolve_git_dir(workspace, path):
    """Follow the ``.git`` file or directory to the real git dir."""
    git = workspace / path / '.git'
    if git.is_file():
        content = git.read_text().strip()
        if content.startswith('gitdir:'):
            relative = content[len('gitdir:'):].strip()
            resolved = (git.parent / relative).resolve()
            return resolved if resolved.is_dir() else None
    elif git.is_dir():
        return git
    return None


def _read_head(git_dir):
    """HEAD commit SHA from ``.git/HEAD`` (detached or symbolic ref)."""
    head_file = git_dir / 'HEAD'
    if not head_file.is_file():
        return None
    content = head_file.read_text().strip()
    if content.startswith('ref:'):
        ref = content[4:].strip()
        ref_file = git_dir / ref
        if ref_file.is_file():
            return ref_file.read_text().strip()
        packed = git_dir / 'packed-refs'
        if packed.is_file():
            for line in packed.read_text().splitlines():
                parts = line.split(' ', 1)
                if len(parts) == 2 and parts[1] == ref:
                    return parts[0]
        return None
    return content


def _read_remote_url(git_dir, remote='gitcode'):
    """Remote fetch URL from ``.git/config``."""
    config = git_dir / 'config'
    if not config.is_file():
        return None
    in_section = False
    for line in config.read_text().splitlines():
        stripped = line.strip()
        if stripped.startswith('[') and stripped.endswith(']'):
            in_section = f'remote "{remote}"' in stripped
        elif in_section and 'url' in stripped and '=' in stripped:
            return stripped.split('=', 1)[1].strip()
    return None


def collect(workspace, path):
    """Git metadata for one repo. Never raises; missing data is None."""
    git_dir = _resolve_git_dir(workspace, path)
    if git_dir is None:
        return {}
    return {
        'head_commit': _read_head(git_dir),
        'remote_url': _read_remote_url(git_dir),
    }


def collect_all(workspace, paths, max_workers=16):
    """Concurrent metadata for every repo path.  All file reads, no subprocess."""
    results = {}
    with ThreadPoolExecutor(max_workers=max_workers) as pool:
        futures = {pool.submit(collect, workspace, p): p for p in paths}
        for future in as_completed(futures):
            path = futures[future]
            try:
                results[path] = future.result()
            except Exception:
                results[path] = {}
    return results
