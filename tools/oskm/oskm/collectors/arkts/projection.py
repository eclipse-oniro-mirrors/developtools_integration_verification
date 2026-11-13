"""Project parsed facts onto the four tables.

Kept out of the collector so that orchestration (discover, drive the backend,
emit) stays readable and a new fact type has one obvious place to land.
"""
from collections import Counter, defaultdict
import hashlib

from ...core.io import InputFailure, canonical
from ...core.models import ScanFatalError
from .linking import resolve
from .models import CAPABILITIES, arch_library_path, arkui_engine_so
from .quality import Diagnostics


def evidence(ctx, data, span):
    start, end = span
    if end - start > ctx.backend_limits.fragment_bytes:
        raise ScanFatalError('ARKTS_FRAGMENT_LIMIT')
    ctx.evidence_bytes += end - start
    if ctx.evidence_bytes > ctx.backend_limits.evidence_bytes:
        raise ScanFatalError('ARKTS_EVIDENCE_LIMIT')
    return data[start:end].decode('utf-8')


def locations(data, offsets):
    text = data.decode('utf-8')
    wanted, result, byte, line, column, previous = set(offsets), {}, 0, 1, 1, ''
    for char in text:
        if byte in wanted:
            result[byte] = (line, column)
        byte += len(char.encode())
        if char == '\n' and previous == '\r':
            pass
        elif char in '\r\n\u2028\u2029':
            line += 1; column = 1
        elif not (byte == 3 and char == '\ufeff'):
            column += 1
        previous = char
    result[byte] = (line, column)
    return result


class Projection:
    """Accumulates the four tables while files are parsed one at a time."""

    def __init__(self, ctx, files):
        self.ctx = ctx
        self.cpu_arch = getattr(ctx.request, 'cpu_arch', None) or 'arm64'
        self.arkui_engine_so = arkui_engine_so(self.cpu_arch)
        self.modules, self.kits, self.sources, self.relations = {}, {}, {}, []
        # 逐文件摘要只用于算 files_digest，不落库：入库一份 1,568 行的 sha256
        # 并不能证明"现在的文件还是当时那份"，而 scope 里的总摘要已经锁住了输入身份。
        self.digests = {}
        self.diagnostics = Diagnostics()
        self.repo_snapshots = {}
        self.repos = sorted(ctx.upstream.rows('repos'), key=lambda r: (-len(r['path']), r['name'])) \
            if ctx.upstream.ran('repos') else []
        # A Kit exists because an entry file opens it, so the Kits are known
        # before any file is read; @kit tags naming something else fall back to
        # a label-only grouping.
        for item in files:
            if item.kit_key:
                self.kits[item.kit_key] = dict(kit_key=item.kit_key, name=item.kit_key[5:],
                                               import_name=item.kit_key, origin='entry_backed')

    # -- per file --------------------------------------------------------
    def declare(self, item):
        """The row that exists whether or not the file can be read."""
        row = dict(source_path=item.source_path, role=item.role,
                   declaration_format=item.declaration_format, language_variant=item.language_variant,
                   file_condition='static' if item.language_variant == 'static' else 'unspecified',
                   condition_evidence=[{'kind': 'static_suffix', 'span': None}]
                                      if item.language_variant == 'static' else [],
                   read_status='unreadable', header_status='failed',
                   coverage={f: 'failed' if f in ('file.header', 'source.utf8_spans')
                                            or item.role == 'kit_entry' else 'not_requested'
                             for f in CAPABILITIES})
        # 仓快照仍记进 scope（查询拼源码 URL 要用），但不在行上留外键：
        # arkts 只扫 interface/sdk-js 一个根，那一列恒为单值。
        repo = next((r for r in self.repos if item.source_path == r['path']
                     or item.source_path.startswith(r['path'].rstrip('/') + '/')), None)
        if repo:
            self.repo_snapshots[repo['path']] = {k: v for k, v in repo.items() if k not in ('id', 'scan_id')}
        if item.role == 'module':
            row['_module_key'] = item.module_key
            module = self.modules.setdefault(item.module_key, dict(
                module_key=item.module_key, module_name=item.module_name,
                declaration_scope=item.declaration_scope, _variants=set()))
            module['_variants'].add(item.language_variant)
        elif item.kit_key:
            row['_kit_key'] = item.kit_key
        else:
            self.diagnostics.add(item.path, 'ARKTS_ENTRY_NAME_INVALID')
        self.sources[item.source_path] = row
        return row

    def read(self, item, row):
        """Bounded read; a failure keeps the row and records why."""
        try:
            data = self.ctx.read_bytes(item.path, self.ctx.sdk_root)
            row['byte_size'] = len(data)
            self.digests[item.source_path] = hashlib.sha256(data).hexdigest()
            data.decode('utf-8', 'strict')
        except InputFailure as error:
            row['read_status'] = ('limit_exceeded' if error.code == 'SIZE_LIMIT' else
                                  'path_invalid' if error.code in ('OUTSIDE_ALLOWED_ROOT', 'NOT_REGULAR_FILE')
                                  else 'unreadable')
            self.diagnostics.add(item.path, 'ARKTS_READ_' + error.code)
            return None
        except (UnicodeError, RuntimeError) as error:
            row['read_status'] = 'encoding_failed' if isinstance(error, UnicodeError) else 'path_invalid'
            self.diagnostics.add(item.path, 'ARKTS_READ_' + row['read_status'].upper(), reason=str(error))
            return None
        row['read_status'] = 'ok'
        return data

    def absorb(self, item, row, data, result):
        """Fold one parse result into the declaration row and the relations."""
        # 后端按能力给 {status, extractor_version}；版本全库一致，只留状态。
        row['coverage'] = {f: v['status'] for f, v in result['coverage'].items()}
        facts = result['facts']
        for diagnostic in result['diagnostics']:
            self.diagnostics.add(item.path, diagnostic['code'],
                                 **{k: v for k, v in diagnostic.items() if k != 'code'})
        if result['diagnostics_omitted']:
            self.diagnostics.add(item.path, 'ARKTS_DIAGNOSTICS_TRUNCATED', total_count=result['diagnostic_count'],
                                 truncated_count=result['diagnostics_omitted'])
        header = facts.get('file.header')
        if header:
            row.update(header_status=header['status'], header_span=header['span'],
                       file_condition=header['file_condition'], condition_evidence=header['condition_evidence'])
        references = facts.get('kit.references', [])
        tags = [t for t in (header or {}).get('tags', []) if t['name'] == 'kit' and t['value']]
        offsets = [r['statement_span'][0] for r in references] + [t['span'][0] for t in tags]
        positions = locations(data, offsets) if offsets else {}
        if item.role == 'module':
            self._membership(item, row, data, positions, tags)
        else:
            self._entry(item, row, data, positions, facts, references, tags, result['coverage'])

    def _membership(self, item, row, data, positions, tags):
        for tag in tags:
            name = '@kit.' + tag['value']
            if name not in self.kits or self.kits[name]['origin'] != 'entry_backed':
                name = 'label:' + tag['value']
                self.kits.setdefault(name, dict(kit_key=name, name=tag['value'],
                                                import_name=None, origin='label_only'))
            self._relation('declared_membership', tag['span'], name, item, data, positions,
                           row['file_condition'], row['condition_evidence'],
                           _module_key=item.module_key, statement_kind='kit_tag',
                           evidence_state=tag['evidence_state'], target_text=tag['value'],
                           target_kind='module', resolution_status='resolved',
                           resolution_method='header_exact', resolution_reason=None,
                           candidate_keys=[item.module_key])

    def _entry(self, item, row, data, positions, facts, references, tags, coverage):
        if not item.kit_key:
            return
        for tag in tags:
            if tag['value'] != item.kit_key[5:]:
                self.diagnostics.add(item.path, 'ARKTS_KIT_NAME_CONFLICT', advisory=True,
                                     value=tag['value'], span=tag['span'])
        conditions = {tuple(c['statement_span']): c
                      for c in facts.get('condition.top_level', {}).get('references', [])}
        for reference in references:
            condition = conditions.get(tuple(reference['statement_span']), {})
            self._relation('entry_reference', reference['statement_span'], item.kit_key, item, data, positions,
                           condition.get('condition_state', 'unknown'), condition.get('condition_evidence', []),
                           statement_kind=reference['statement_kind'],
                           evidence_state=reference['evidence_state'], target_text=reference['specifier'])

    def _relation(self, kind, span, kit_key, item, data, positions, condition, condition_evidence, **extra):
        line, column = positions[span[0]]
        self.relations.append(dict(
            evidence_key=canonical([item.key, kind, *span]).decode(),
            # Relative specifiers resolve against the SDK-relative key, so the
            # linker needs it; it is dropped again once linking is done.
            _source_key=item.key,
            _kit_key=kit_key, _source_file=item.source_path, relation_type=kind,
            source_path=item.source_path, start_byte=span[0], end_byte=span[1], line=line, column=column,
            condition_state=condition, condition_evidence=condition_evidence,
            record=evidence(self.ctx, data, span), **extra))
        if len(self.relations) > self.ctx.limits.tree_items:
            raise ScanFatalError('ARKTS_RELATION_LIMIT')

    # -- after every file ------------------------------------------------
    def link(self):
        """Resolve entry references against the logical modules."""
        names = defaultdict(list)
        for key, row in self.modules.items():
            if row['module_name']:
                names[row['module_name']].append(key)
        for row in self.relations:
            source_key = row.pop('_source_key')
            if row['relation_type'] != 'entry_reference':
                continue
            row.update(resolve(row['target_text'], source_key, self.modules, names,
                               self.ctx.discovery_complete))
            if row['resolution_status'] in ('not_found', 'ambiguous', 'unsupported'):
                self.diagnostics.add(self.ctx.workspace / row['source_path'],
                                     'ARKTS_LINK_' + row['resolution_status'].upper(),
                                     span=[row['start_byte'], row['end_byte']],
                                     reason=row['resolution_reason'], candidates=row['candidate_keys'])

    def implementations(self, matched):
        """把"谁实现了这个模块"写进模块行。

        严格一对一（932 个模块各一条），所以是几列而不是一张表。
        两类证据靠 implementation_kind 区分，不另存 impl_source——
        napi ⟺ 来自映射表，arkui ⟺ 来自采集器常量，它完全可推导。
        断言它们的参考数据不入库，摘要在 collector_runs.scope.napi_map。
        """
        for key, (napi_name, so_path, method) in matched.items():
            self.modules[key].update(
                impl_so_path=arch_library_path(so_path, self.cpu_arch),
                impl_napi_name=napi_name, impl_match=method)
        for row in self.modules.values():
            if row['implementation_kind'] == 'arkui':
                row.update(impl_so_path=self.arkui_engine_so, impl_match='arkui_engine')

    def finalise(self, matched):
        """Derived module columns that only exist once every file is seen."""
        for key, row in self.modules.items():
            variants = row.pop('_variants')
            row['language_coverage'] = 'both' if len(variants) > 1 else next(iter(variants))
            row['implementation_kind'] = self._implementation_kind(key, row, matched)

    @staticmethod
    def _implementation_kind(key, row, matched):
        """How the module is implemented, in order of evidence strength.

        Directory alone cannot answer this: api/ holds NAPI modules, ArkUI
        declarations and pure type declarations side by side.
        """
        name = row['module_name'] or ''
        if key in matched:
            return 'napi'                       # the map names an implementing .so
        if (row['declaration_scope'] in ('internal_component', 'internal_ets')
                or key.startswith('api/arkui/') or name.startswith('@ohos.arkui.')):
            return 'arkui'                      # served by the ArkUI engine
        if row['declaration_scope'] == 'arkts_builtin':
            return 'arkts_builtin'
        if name.startswith('@arkts.'):
            return 'arkts_language'
        if not name:
            return 'type_only'                  # auxiliary declaration, nothing to implement
        return 'unknown'                        # named, but no implementation evidence

    def quality(self):
        declarations = list(self.sources.values())
        return dict(
            discovery='complete' if self.ctx.discovery_complete else 'partial',
            headers='complete' if all(r['header_status'] in ('ok', 'no_tag')
                                      for r in declarations) else 'partial',
            # 由 coverage 读，不另存一列——references_status 本来就是它的投射
            entry_references='complete' if all(r['coverage']['kit.references'] == 'complete'
                                               for r in declarations
                                               if r['role'] == 'kit_entry') else 'partial',
            target_resolution='complete' if all(r['resolution_status'] in ('resolved', 'out_of_scope')
                                                for r in self.relations) else 'partial')

    def counts(self):
        return dict(modules=len(self.modules), kits=len(self.kits),
                    sources=len(self.sources), relations=len(self.relations),
                    implementations=sum(r.get('impl_so_path') is not None
                                        for r in self.modules.values()),
                    kit_entries=sum(r['role'] == 'kit_entry' for r in self.sources.values()),
                    entry_backed=sum(k['origin'] == 'entry_backed' for k in self.kits.values()),
                    dual_declared=sum(r['language_coverage'] == 'both' for r in self.modules.values()))

    def coverage(self):
        return {f: dict(Counter(r['coverage'][f] for r in self.sources.values()))
                for f in CAPABILITIES}

    def files_digest(self):
        """Content identity of every discovered file, without storing the list.

        摘要本身不落库——存 1,568 行 sha256 并不能证明"现在的文件还是当时那份"，
        而这一个总摘要已经锁住了输入身份：改一个字节它就变。
        """
        return hashlib.sha256(canonical(sorted(
            (path, self.digests.get(path), row['read_status'])
            for path, row in self.sources.items()))).hexdigest()

    def rows(self, table):
        # Sorted here rather than by the caller: a composite business key has
        # no single column to sort on, and the foreign keys are still
        # unresolved at this point.
        source = {
            'arkts_modules': sorted(self.modules.values(), key=lambda r: r['module_key']),
            'arkts_kits': sorted(self.kits.values(), key=lambda r: r['kit_key']),
            'arkts_sources': sorted(self.sources.values(), key=lambda r: r['source_path']),
            'arkts_kit_relations': sorted(self.relations, key=lambda r: r['evidence_key']),
        }
        return source[table.name]
