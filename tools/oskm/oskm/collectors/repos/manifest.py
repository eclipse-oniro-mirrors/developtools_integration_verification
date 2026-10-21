"""Recursive repo manifest parser: include chains, remotes and projects.

Includes are resolved relative to the manifests directory, not relative to
the file doing the include, matching the repo tool's resolution rule.
"""
import xml.etree.ElementTree as ET
from pathlib import Path


def parse(manifest_dir, entry='default.xml'):
    """Parse the manifest include chain, returning (projects, remotes).

    manifest_dir: path to .repo/manifests/
    entry: filename within manifest_dir to start from (default: default.xml)

    <default> attributes are inherited across includes: a sub-manifest
    that does not redeclare <default> keeps the parent's remote/revision.
    """
    projects = {}
    remotes = {}
    _parse(manifest_dir / entry, manifest_dir, {}, projects, remotes)
    return projects, remotes


def _parse(path, manifest_dir, inherited, projects, remotes):
    root = ET.parse(path).getroot()
    for r in root.findall('remote'):
        remotes[r.get('name')] = dict(r.attrib)
    default = root.find('default')
    default_attrs = dict(default.attrib) if default is not None else {}
    merged = {**inherited, **default_attrs}
    for inc in root.findall('include'):
        _parse(manifest_dir / inc.get('name'), manifest_dir, merged, projects, remotes)
    for p in root.findall('project'):
        attrs = dict(p.attrib)
        attrs.setdefault('remote', merged.get('remote'))
        attrs.setdefault('revision', merged.get('revision'))
        projects[attrs['name']] = attrs
