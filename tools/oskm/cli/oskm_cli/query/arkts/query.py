"""SQL-only module/Kit queries with filter-bound, content-versioned keyset page_tokens."""
import base64
import hashlib
import json
import posixpath
from urllib.parse import quote

from ..jsonutil import canonical
from ..errors import QueryError
from .export import snapshot
from oskm_schema.arkts_records import key_maps, publish
from oskm_schema.arkts import TABLES, MODULES, KITS, SOURCES, RELATIONS

SCHEMA_VERSION = '7.0.0'


def _text(value, name, *, optional=False):
    if optional and value is None:
        return
    if not isinstance(value, str) or len(value) > 4096 or '\x00' in value:
        raise QueryError('INVALID_PARAM: ' + name)


class ArktsQuery:

    def __init__(self, session):
        self.connection, self.scan_id = session.connection, session.scan_id
        self._refresh()


    def list_kits(self, *, query='', origin=None, limit=50, page_token=None):
        _text(query, 'query')
        if origin not in (None, 'entry_backed', 'label_only'):
            raise QueryError('INVALID_PARAM: origin')
        clauses, values = ['(instr(t.name,?)>0 OR instr(t.kit_key,?)>0)'], [query, query]
        if origin:
            clauses.append('t.origin=?'); values.append(origin)
        return self._page(KITS, clauses, values, limit=limit, page_token=page_token, filters=dict(query=query, origin=origin))


    def list_modules(self, *, query='', declaration_scope=None, implementation_kind=None,
                     declaration_format=None, language_coverage=None, membership=None,
                     component=None, implemented_by=None, limit=50, page_token=None):
        _text(query, 'query')
        _text(component, 'component', optional=True)
        _text(implemented_by, 'implemented_by', optional=True)
        if (declaration_scope not in (None, 'api_named', 'api_auxiliary', 'internal_component',
                                      'internal_ets', 'arkts_named', 'arkts_builtin')
                or implementation_kind not in (None, 'napi', 'arkui', 'arkts_builtin',
                                               'arkts_language', 'type_only', 'unknown')
                or declaration_format not in (None, 'd.ts', 'd.ets', 'static.d.ets')
                or language_coverage not in (None, 'dynamic', 'static', 'both')
                or membership not in (None, 'declared', 'undeclared')):
            raise QueryError('INVALID_PARAM: module filter')
        clauses, values = ['(instr(t.module_key,?)>0 OR instr(COALESCE(t.module_name,\'\'),?)>0)'], [query, query]
        for column, value in (('declaration_scope', declaration_scope),
                              ('implementation_kind', implementation_kind),
                              ('language_coverage', language_coverage)):
            if value:
                clauses.append(f't.{column}=?'); values.append(value)
        if declaration_format:
            # A format is a property of one declaration, so this asks whether
            # the module has a declaration in that format.
            clauses.append("EXISTS (SELECT 1 FROM arkts_sources d WHERE d.scan_id=t.scan_id "
                           "AND d.module_id=t.id AND d.declaration_format=?)")
            values.append(declaration_format)
        if membership:
            clauses.append(('NOT ' if membership == 'undeclared' else '') +
                "EXISTS (SELECT 1 FROM arkts_kit_relations r WHERE r.scan_id=t.scan_id AND r.module_id=t.id "
                "AND r.relation_type='declared_membership' AND r.evidence_state='confirmed')")
        if implemented_by:
            # 路径在采集时已按本次 ScanRequest.cpu_arch 构造；子串匹配只是允许
            # 调用方只给文件名。
            clauses.append('instr(COALESCE(t.impl_so_path,?),?)>0'); values.extend(['', implemented_by])
        if component:
            # SDK 接口 → 实现它的 .so → 构建那个 .so 的部件，反着走。
            # 这是实现映射接入全库关联图之后才可能的查询。
            if not self._available('elf_modules', 'elf_modules', 'components'):
                raise QueryError('CAPABILITY_UNAVAILABLE: elf_modules')
            clauses.append('EXISTS (SELECT 1 FROM elf_modules e JOIN components c ON c.id=e.component_id '
                           'WHERE e.id=t.impl_elf_id AND c.name=?)')
            values.append(component)
        return self._page(MODULES, clauses, values, limit=limit, page_token=page_token,
            filters=dict(query=query, declaration_scope=declaration_scope,
                         implementation_kind=implementation_kind,
                         declaration_format=declaration_format,
                         language_coverage=language_coverage, membership=membership,
                         component=component, implemented_by=implemented_by))


    def kit_modules(self, kit_key, *, view='resolved', limit=50, page_token=None, **filters):
        if view not in ('resolved', 'unresolved'):
            raise QueryError('INVALID_PARAM: view')
        with snapshot(self.connection):
            self._refresh()
            row = self._entity(KITS, kit_key)
            clauses, values = self._relations(**filters)
            if view == 'unresolved':
                clauses = [c.replace('r.', 't.') for c in clauses]
                return self._page(RELATIONS, ['t.kit_id=?', "t.resolution_status!='resolved'", *clauses], [row['id'], *values],
                    limit=limit, page_token=page_token, filters=dict(kit_key=kit_key, view=view, **filters), evidence=True)
            where = ' AND '.join(["r.resolution_status='resolved'", *clauses])
            return self._page(MODULES, ['EXISTS (SELECT 1 FROM arkts_kit_relations r WHERE r.scan_id=t.scan_id '
                f'AND r.module_id=t.id AND r.kit_id=? AND {where})'], [row['id'], *values], limit=limit, page_token=page_token,
                filters=dict(kit_key=kit_key, view=view, **filters))


    def module_kits(self, module_key, *, limit=50, page_token=None, **filters):
        with snapshot(self.connection):
            self._refresh()
            row = self._entity(MODULES, module_key)
            clauses, values = self._relations(**filters)
            where = ' AND '.join(["r.resolution_status='resolved'", *clauses])
            return self._page(KITS, ['EXISTS (SELECT 1 FROM arkts_kit_relations r WHERE r.scan_id=t.scan_id '
                f'AND r.kit_id=t.id AND r.module_id=? AND {where})'], [row['id'], *values], limit=limit, page_token=page_token,
                filters=dict(module_key=module_key, **filters))


    def list_declarations(self, *, query='', role=None, language_variant=None, read_status=None, limit=50, page_token=None):
        _text(query, 'query')
        if (role not in (None, 'module', 'kit_entry') or language_variant not in (None, 'dynamic', 'static')
                or read_status not in (None, 'ok', 'unreadable', 'encoding_failed', 'limit_exceeded', 'path_invalid')):
            raise QueryError('INVALID_PARAM: declaration filter')
        clauses, values = ['instr(t.source_path,?)>0'], [query]
        for column, value in (('role', role), ('language_variant', language_variant), ('read_status', read_status)):
            if value:
                clauses.append(f't.{column}=?'); values.append(value)
        return self._attach_sources(self._page(SOURCES, clauses, values, limit=limit, page_token=page_token,
            filters=dict(query=query, role=role, language_variant=language_variant, read_status=read_status)))


    def get_module(self, module_key, *, limit=50, declaration_page_token=None, evidence_page_token=None):
        with snapshot(self.connection):
            self._refresh()
            row = self._entity(MODULES, module_key)
            declarations = self._attach_sources(self._page(SOURCES, ['t.module_id=?'], [row['id']],
                limit=limit, page_token=declaration_page_token, filters=dict(module_key=module_key, view='declarations')))
            evidence = self._page(RELATIONS, ['t.module_id=?'], [row['id']], limit=limit, page_token=evidence_page_token,
                                  filters=dict(module_key=module_key, view='evidence'), evidence=True)
            # A module spans several files, so its issues are the union of the
            # issues recorded against each of them.
            paths = [r[0] for r in self.connection.execute(
                'SELECT source_path FROM arkts_sources WHERE scan_id=? AND module_id=?', (self.scan_id, row['id']))]
            marks = ','.join('?' for _ in paths) or "''"
            issues = [dict(r) for r in self.connection.execute(
                'SELECT path,code,severity,advisory FROM issues WHERE scan_id=? AND collector=\'arkts\' '
                f'AND path IN ({marks}) ORDER BY path,code LIMIT 100', (self.scan_id, *paths))]
            return dict(module=publish(row, MODULES), declarations=declarations,
                        implementation=self._implementations(row),
                        kit_routes=self._routes('module_id', row['id']),
                        quality=self.scope['quality'], evidence=evidence, issues=issues)


    def get_kit(self, kit_key, *, limit=50, source_page_token=None, evidence_page_token=None):
        with snapshot(self.connection):
            self._refresh()
            row = self._entity(KITS, kit_key)
            sources = self._attach_sources(self._page(SOURCES, ['t.kit_id=?'], [row['id']],
                limit=limit, page_token=source_page_token, filters=dict(kit_key=kit_key, view='sources')))
            evidence = self._page(RELATIONS, ['t.kit_id=?'], [row['id']], limit=limit, page_token=evidence_page_token,
                                  filters=dict(kit_key=kit_key, view='evidence'), evidence=True)
            summary = self.connection.execute(
                "SELECT COUNT(DISTINCT CASE WHEN evidence_state='confirmed' AND resolution_status='resolved' THEN module_id END) modules, "
                "COALESCE(SUM(resolution_status!='resolved'),0) unresolved FROM arkts_kit_relations WHERE scan_id=? AND kit_id=?",
                (self.scan_id, row['id'])).fetchone()
            result = dict(kit=publish(row, KITS), sources=sources, evidence=evidence,
                          member_routes=self._routes('kit_id', row['id']),
                          summary=dict(summary), quality=self.scope['quality'])
            if not sources['total']:
                result['mentioned_in'] = self._mentioned_in(row['id'])
            return result


    def _refresh(self):
        run = self.connection.execute("SELECT * FROM collector_runs WHERE scan_id=? AND collector='arkts'", (self.scan_id,)).fetchone()
        if run is None:
            raise QueryError('COLLECTOR_NOT_RUN')
        if run['status'] == 'failed':
            raise QueryError('COLLECTOR_FAILED')
        if run['schema_version'] != SCHEMA_VERSION:
            raise QueryError('SCHEMA_UNSUPPORTED')
        tables = {r[0] for r in self.connection.execute("SELECT name FROM sqlite_master WHERE type='table'")}
        if not all(t.name in tables for t in TABLES):
            raise QueryError('SCHEMA_UNSUPPORTED')
        for table in TABLES:
            columns = {row['name'] for row in self.connection.execute(f'PRAGMA table_info({table.name})')}
            if not {c.name for c in table.all_columns} <= columns:
                raise QueryError('SCHEMA_UNSUPPORTED')
        self.run, self.scope = dict(run), json.loads(run['scope'])


    def _decode_page_token(self, page_token, state):
        """Validate a page token by table name rather than object identity."""
        if page_token is None:
            return None
        try:
            raw = base64.b64decode(
                page_token.encode('ascii'), altchars=b'-_', validate=True)
            decoded = json.loads(raw)
            if not isinstance(decoded, dict) or set(decoded) != set(state) | {'last_key'}:
                raise ValueError()
            if (not isinstance(decoded['version'], int)
                    or isinstance(decoded['version'], bool)
                    or not isinstance(decoded['scan_id'], int)
                    or isinstance(decoded['scan_id'], bool)):
                raise ValueError()
            for key in ('input_digest', 'filters_hash', 'view', 'last_key'):
                if not isinstance(decoded[key], str):
                    raise ValueError()
            if decoded['scan_id'] != self.scan_id or decoded['input_digest'] != state['input_digest']:
                raise QueryError('STALE_PAGE_TOKEN')
            if any(decoded[k] != v for k, v in state.items()):
                raise ValueError()
            return decoded['last_key']
        except (UnicodeError, KeyError) as exc:
            raise QueryError('INVALID_PAGE_TOKEN') from exc

    def _attach_kit_summaries(self, rows, items):
        ids = [r['id'] for r in rows]
        marks = ','.join('?' for _ in ids)
        counts = {r['kit_id']: r for r in self.connection.execute(
            f"SELECT kit_id,COUNT(DISTINCT CASE WHEN evidence_state='confirmed' AND resolution_status='resolved' "
            f"THEN module_id END) modules,SUM(resolution_status!='resolved') unresolved "
            f'FROM arkts_kit_relations WHERE scan_id=? AND kit_id IN ({marks}) GROUP BY kit_id',
            [self.scan_id, *ids])}
        sources = {r['kit_id']: r['n'] for r in self.connection.execute(
            f'SELECT kit_id,COUNT(*) n FROM arkts_sources WHERE scan_id=? '
            f'AND kit_id IN ({marks}) GROUP BY kit_id', [self.scan_id, *ids])}
        for row, item in zip(rows, items):
            count = counts.get(row['id'])
            item['summary'] = dict(
                modules=count['modules'] if count else 0,
                unresolved=count['unresolved'] if count else 0,
                sources=sources.get(row['id'], 0))

    def _attach_module_summaries(self, rows, items):
        ids = [r['id'] for r in rows]
        marks = ','.join('?' for _ in ids)
        summaries = {}
        for r in self.connection.execute(
                f'SELECT module_id,relation_type,COUNT(*) n FROM arkts_kit_relations '
                f'WHERE scan_id=? AND module_id IN ({marks}) GROUP BY module_id,relation_type',
                [self.scan_id, *ids]):
            summaries.setdefault(r['module_id'], {})[r['relation_type']] = r['n']
        declarations = {r['module_id']: r['n'] for r in self.connection.execute(
            f'SELECT module_id,COUNT(*) n FROM arkts_sources WHERE scan_id=? '
            f'AND module_id IN ({marks}) GROUP BY module_id', [self.scan_id, *ids])}
        for row, item in zip(rows, items):
            item['evidence_counts'] = summaries.get(row['id'], {})
            item['declaration_count'] = declarations.get(row['id'], 0)

    def _page(self, table, clauses, params, *, limit, page_token, filters, evidence=False):
        if not isinstance(limit, int) or isinstance(limit, bool) or not 1 <= limit <= 200:
            raise QueryError('INVALID_PARAM: limit')
        _text(page_token, 'page_token', optional=True)
        with snapshot(self.connection):
            self._refresh()
            state = dict(version=1, scan_id=self.scan_id, input_digest=self.scope['input_digest'],
                         filters_hash=hashlib.sha256(canonical(filters)).hexdigest(), view=table.name)
            last = self._decode_page_token(page_token, state)
            where = ' AND '.join(['t.scan_id=?', *clauses])
            params = [self.scan_id, *params]
            total = self.connection.execute(
                f'SELECT COUNT(*) FROM {table.name} t WHERE {where}', params).fetchone()[0]
            key = table.primary_key[0]
            page_where = where + (f' AND t.{key}>?' if last is not None else '')
            rows = self.connection.execute(
                f'SELECT t.* FROM {table.name} t WHERE {page_where} '
                f'ORDER BY t.{key} LIMIT ?',
                [*params, *([last] if last is not None else []), limit + 1]).fetchall()
            next_page_token = None
            if len(rows) > limit:
                next_page_token = base64.urlsafe_b64encode(
                    canonical(dict(state, last_key=rows[limit - 1][key]))).decode()
            rows = rows[:limit]
            keys = key_maps(self.connection, self.scan_id) if table in (SOURCES, RELATIONS) else {}
            items = [publish(row, table, keys, evidence=evidence) for row in rows]
            if table.name == KITS.name and rows:
                self._attach_kit_summaries(rows, items)
            if table.name == MODULES.name and rows:
                self._attach_module_summaries(rows, items)
            return dict(scan_id=self.scan_id, input_digest=self.scope['input_digest'],
                        items=items, total=total, next_page_token=next_page_token,
                        quality=self.scope['quality'])


    def _available(self, collector, *tables):
        """别的采集器的数据能不能用。

        **表存在不是判据**：框架建库时会把全部已注册采集器的表都建出来，所以
        `--only arkts` 扫出来的库里 `elf_modules` 照样在，只是一行没有。
        真正的判据是 `collector_runs` 里有没有它、是不是 failed。

        这一步不能省：缺数据时静默返回 0 条，会被读成"没有模块由这个部件实现"，
        而事实是"这次扫描没采 ELF，答不了"。两者必须分开。
        """
        present = {r[0] for r in self.connection.execute(
            "SELECT name FROM sqlite_master WHERE type='table'")}
        if not set(tables) <= present:
            return False
        run = self.connection.execute(
            'SELECT status FROM collector_runs WHERE scan_id=? AND collector=?',
            (self.scan_id, collector)).fetchone()
        return run is not None and run[0] != 'failed'


    def _routes(self, column, entity_id):
        """成员关系的两条来路各自多少、重合多少。

        `declared_membership` 是模块在自己文件头写的 @kit 标签，
        `entry_reference` 是 Kit 入口把它 import 了进去。两者会不一致，而且
        **不一致是正常的**——标签是模块的自本文声明，import 是入口的实际组成。
        只给一个合计数就把"谁说的"抹掉了，所以这里拆开。

        另一个容易误读的地方：引用**条数**不等于模块数。同一个模块常在
        `if arkts static` 和 `dynamic` 两个分支里各 import 一次，AbilityKit
        实测 188 条引用只指向 104 个模块。所以这里数的是去重后的对端。
        """
        other = 'module_id' if column == 'kit_id' else 'kit_id'
        pair = (f"SELECT DISTINCT {other} FROM arkts_kit_relations WHERE scan_id=? AND {column}=? "
                f"AND resolution_status='resolved' AND evidence_state='confirmed' AND relation_type=?")
        args = (self.scan_id, entity_id)
        declared = {r[0] for r in self.connection.execute(pair, (*args, 'declared_membership'))}
        referenced = {r[0] for r in self.connection.execute(pair, (*args, 'entry_reference'))}
        return dict(total=len(declared | referenced), both=len(declared & referenced),
                    declared_only=len(declared - referenced),
                    referenced_only=len(referenced - declared))


    def _entity(self, table, key):
        _text(key, table.primary_key[0])
        row = self.connection.execute(f'SELECT * FROM {table.name} WHERE scan_id=? AND {table.primary_key[0]}=?', (self.scan_id, key)).fetchone()
        if row is None:
            raise QueryError('NOT_FOUND')
        return row


    def _relations(self, *, relation_type=None, condition=None, include_unspecified=False, include_candidates=False):
        if relation_type not in (None, 'declared_membership', 'entry_reference') or condition not in (None, 'dynamic', 'static', 'both', 'unknown', 'unspecified'):
            raise QueryError('INVALID_PARAM: relation filter')
        if not isinstance(include_unspecified, bool) or not isinstance(include_candidates, bool):
            raise QueryError('INVALID_PARAM: inclusion flag')
        clauses, values = [], []
        if not include_candidates:
            clauses.append("r.evidence_state='confirmed'")
        if relation_type:
            clauses.append('r.relation_type=?'); values.append(relation_type)
        if condition:
            states = [condition] + (['both'] if condition in ('dynamic', 'static') else [])
            if include_unspecified and 'unspecified' not in states:
                states.append('unspecified')
            clauses.append('r.condition_state IN (' + ','.join('?' for _ in states) + ')'); values.extend(states)
        return clauses, values


    def _source(self, row, current_repos=None):
        """Locate one declaration file in its repository, for the reader.

        按**路径最长前缀**找仓，不走外键：行上不再存 repo_id（arkts 只扫
        interface/sdk-js 一个根，那一列恒为单值）。scope 里的仓快照是扫描当时的，
        与库里现在的 repos 行比对得出是否已过期。
        """
        candidates = [repo for root, repo in self.scope['repos'].items()
                      if row['source_path'].startswith(root.rstrip('/') + '/')]
        if not candidates:
            return {'path': row['source_path'], 'content_match': 'unverified', 'source_metadata_stale': True}
        repo = max(candidates, key=lambda r: len(r['path']))
        rows = current_repos if current_repos is not None else {
            r['path']: r for r in self.connection.execute(
                'SELECT * FROM repos WHERE scan_id=?', (self.scan_id,))}
        current = rows.get(repo['path'])
        stale = current is None or any(current[k] != repo[k] for k in ('name', 'head_commit', 'remote_url', 'revision'))
        result = dict(path=row['source_path'], repo=repo, content_match='unverified', source_metadata_stale=stale)
        remote, revision = repo.get('remote_url'), repo.get('head_commit')
        if remote and revision:
            if remote.startswith('git@') and ':' in remote:
                host, path = remote[4:].split(':', 1)
                remote = 'https://' + host + '/' + path
            if remote.startswith(('https://', 'http://')):
                relative = row['source_path'][len(repo['path'].rstrip('/')) + 1:]
                result['url'] = posixpath.join(
                    remote.removesuffix('.git').rstrip('/'), 'blob',
                    quote(revision, safe=''), quote(relative, safe='/'))
        return result


    def _attach_sources(self, page):
        """Give each declaration in a page its repository location."""
        if not page['items']:
            return page
        paths = [item['source_path'] for item in page['items']]
        marks = ','.join('?' for _ in paths)
        rows = {r['source_path']: r for r in self.connection.execute(
            f'SELECT * FROM arkts_sources WHERE scan_id=? AND source_path IN ({marks})', [self.scan_id, *paths])}
        current_repos = {r['path']: r for r in self.connection.execute('SELECT * FROM repos WHERE scan_id=?', (self.scan_id,))}
        for item in page['items']:
            item['source'] = self._source(rows[item['source_path']], current_repos)
        return page


    def _implementations(self, row):
        """实现它的 .so，连同它在镜像里的实际位置。

        没有 `impl_so_path` 表示"不知道由谁实现"；有而 `impl_elf_id` 为空表示
        按本产品架构构造的实现路径不在镜像里。两者是不同的事实，不要都当成空。
        """
        if not row['impl_so_path']:
            return None
        result = {k: row[k] for k in ('impl_so_path', 'impl_napi_name', 'impl_match')
                  if row[k] is not None}
        if row['impl_elf_id'] and self._available('elf_modules', 'elf_modules', 'install_targets'):
            found = self.connection.execute(
                'SELECT t.dest AS installed_at, e.file_name, e.partition '
                'FROM elf_modules e LEFT JOIN install_targets t ON t.id = e.install_target_id '
                'WHERE e.id = ?', (row['impl_elf_id'],)).fetchone()
            if found:
                result.update({k: v for k, v in dict(found).items() if v is not None})
        return result


    def _mentioned_in(self, kit_id):
        """没有入口文件时，这个分组在哪里被提到过。

        label_only 的 Kit **根本没被定义**——只是某个模块头上写了个对不上入口的
        标签，所以 `sources` 恒为空。空列表会被读成"查不到它的定义文件"，而事实是
        它没有定义文件。能给出的最好答案是"谁提过它"，这里就给这个。
        """
        rows = self.connection.execute(
            'SELECT s.source_path, m.module_key FROM arkts_kit_relations r '
            'JOIN arkts_sources s ON s.scan_id=r.scan_id AND s.id=r.source_id '
            'LEFT JOIN arkts_modules m ON m.scan_id=r.scan_id AND m.id=r.module_id '
            'WHERE r.scan_id=? AND r.kit_id=? GROUP BY s.source_path, m.module_key '
            'ORDER BY s.source_path LIMIT 200', (self.scan_id, kit_id)).fetchall()
        return dict(note='该分组没有入口文件，它只出现在下列模块的 @kit 标签里',
                    total=len(rows), items=[dict(r) for r in rows])
