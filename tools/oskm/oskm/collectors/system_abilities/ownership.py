"""Resolve declaration ownership through the actual single-SA build inputs."""
from pathlib import Path
from collections import defaultdict
from ...core.framework import READ_ERRORS
from .records import identity, raw_sa
from ...core.provenance import strip_label
from ...core.query import equal
from ...core.ownership import (manifest_directories, nearest_component,
                               resolve_component)

class Ownership:
    def __init__(self, ctx, components):
        self.ctx = ctx
        self.components = components
        self.directories = manifest_directories(components)
        self.index, self.owners = defaultdict(list), {}
        self.complete = True
        manifest = ctx.package / 'sa_profile/src_sa_install_info.json'
        try:
            rows = ctx.read_json(manifest, ctx.package)
            if not isinstance(rows, list):
                raise ValueError('SA_SOURCE_MANIFEST_NOT_ARRAY')
            for n, row in enumerate(rows):
                ctx.check()
                try:
                    if not isinstance(row, dict) or 'type' not in row:
                        raise ValueError('SA_SOURCE_ROW_INVALID')
                    if row['type'] == 'sa':
                        self.load_target(row)
                except READ_ERRORS:
                    self.complete = False
                    ctx.issue(manifest, 'SA_SOURCE_ROW_INVALID', '/' + str(n))
        except READ_ERRORS:
            self.complete = False
            ctx.issue(manifest, 'SA_SOURCE_MANIFEST_INVALID')
        if not self.complete:
            ctx.issue(manifest, 'SA_SOURCE_INDEX_INCOMPLETE')

    def build_path(self, value):
        if not isinstance(value, str) or not value or any(c in value for c in '$\x00{}'):
            raise ValueError('INVALID_BUILD_PATH')
        path = Path(value)
        if '..' in path.parts:
            raise ValueError('INVALID_BUILD_PATH')
        path = self.ctx.build / path
        if not path.is_relative_to(self.ctx.build):
            raise ValueError('BUILD_PATH_OUTSIDE_ROOT')
        return path

    def read_build(self, value):
        path = self.build_path(value)
        try:
            return self.ctx.read_json(path, self.ctx.build)
        except READ_ERRORS as exc:
            self.ctx.issue(path, 'SA_SOURCE_' + getattr(exc, 'code', 'INVALID_JSON'))
            raise

    def load_target(self, row):
        part, label = row.get('part_name'), strip_label(row.get('label'))
        if not isinstance(part, str) or not part or ',' in part or label is None:
            raise ValueError('INVALID_TARGET')
        info = self.read_build(row.get('install_info_file'))
        if not isinstance(info, dict) or info.get('part_name') != part or strip_label(info.get('label')) != label:
            raise ValueError('TARGET_CONFLICT')
        paths = info.get('sa_info_files')
        if not isinstance(paths, list) or not paths:
            raise ValueError('INVALID_SOURCE_LIST')
        for path in paths:
            doc = self.read_build(path)
            elements = doc.get('systemability') if isinstance(doc, dict) else None
            if not isinstance(elements, list) or len(elements) != 1 or not isinstance(elements[0], dict):
                raise ValueError('EXPECTED_SINGLE_SA')
            raw = elements[0]
            key = identity(doc.get('process'), raw.get('name'))
            if key is None:
                raise ValueError('INVALID_SOURCE_IDENTITY')
            candidate = dict(part=part, label=label, raw=raw)
            if not any(equal(candidate, old) for old in self.index[key]):
                self.index[key].append(candidate)

    def owner(self, candidate):
        # subsystem is no longer independently derived here: once `part` is
        # cross-checked against bundle.json's own declaration, it is looked up in
        # the components dependency to bind the real Component (core/ownership.py).
        part, label = candidate['part'], candidate['label']
        key = part, label
        if key in self.owners:
            return self.owners[key]
        ctx = self.ctx
        location = ctx.workspace / label[2:].split(':')[0]
        component = nearest_component(self.directories, label) or {}
        # source_label is the sa_profile target this SA was built from. It is not
        # stored: the published `label` is the installing module's, read back
        # through install_module_id. It is kept here only as the first key the
        # install lookup tries (link_installs).
        owner = dict(source_label=label)
        declared = component.get('name')
        if isinstance(declared, str) and declared and declared != part:
            ctx.issue(location, 'SA_COMPONENT_CONFLICT')
        else:
            bound = resolve_component(ctx, location, None, part, self.components)
            if bound is not None:
                owner['component_id'] = bound
        self.owners[key] = owner
        return owner

    def apply(self, record, pointer):
        ctx = self.ctx
        location = ctx.package / record['profile']
        key = identity(record.get('process'), record.get('name'))
        if key is None:
            ctx.issue(location, 'SA_IDENTITY_INVALID', pointer)
            return
        if not self.complete:
            return
        hits = self.index.get(key, [])
        if len(hits) != 1:
            ctx.issue(location, 'SA_SOURCE_UNMATCHED' if not hits else 'SA_SOURCE_AMBIGUOUS', pointer)
        elif not equal(hits[0]['raw'], raw_sa(record)):
            ctx.issue(location, 'SA_SOURCE_MISMATCH', pointer)
        else:
            record.update(self.owner(hits[0]))


def link_installs(ctx, records):
    """Bind each SA to the module that installed it, best evidence first.

    The sa_profile target an SA was built from is tried first, but on a real
    product it never appears in the install manifest (0 of 165 on rk3568): the
    manifest records the *implementation library's* target instead. So the
    lookup falls back to libpath, which may be written either as an image path
    or as a bare file name, and both forms are tried.

    Deliberately not the profile's own installer: system/profile/*.json is put
    there by a label-less `sa_info` aggregate (104 of 116 profile targets carry
    no GN label at all), so that link could never be followed back by label.
    """
    index = ctx.install_index()
    # No issue when the index is unusable: an SA's ownership comes from its own
    # build inputs, so a missing install link costs only the link. source_label
    # is dropped either way -- it is never stored, and leaving it on the record
    # would outlive its one use.
    usable = index is not None and index is not False
    for record, _ in records:
        label = record.pop('source_label', None)
        if not usable:
            continue
        libpath = record.get('libpath')
        name = libpath.rsplit('/', 1)[-1] if isinstance(libpath, str) else None
        found = index.locate(label=label, path=libpath, name=name)
        if found is not None:
            record['install_module_id'] = found['id']
