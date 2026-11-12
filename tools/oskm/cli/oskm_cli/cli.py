#!/usr/bin/env python3
# coding=utf-8
"""只读查询 CLI：`oskm-cli ask / arch / diff / sql / validate-db`。

这一层**不手写子命令**。52 个工具的子命令、参数、类型、枚举、帮助文本全部由
`REGISTRY` 里的 JSON Schema 生成——手抄一份就是又一处会漂的副本（工具数已经在
四份文档里各漂过一次）。加一个工具 = 注册一次，CLI 和 `--help` 自动就有。

这是**独立产物**：不下载、不写盘、不认识 `~/.oskm`、不读 `.env`。
把 DB / SDK / CLI 本身装到位是 skill 的职责（`bootstrap.py`），
分工与理由见 `docs/architecture/cli-skill-split.md`。
`oskm_schema` 是唯一的例外依赖——schema 契约必须只有 CLI 这一处，
所以打 pyz 时把它 stage 进归档。

分层：`oskm` 包（采集）不许 import `oskm_cli`，反过来也不许。两个 CLI 因此
**没有共同入口**——扫描走 `python3 -m oskm.cli`，查询走本模块
（`python3 -m oskm_cli` / pyz / skill 的 `bootstrap.py`）。
2026-11-12 之前有个 `packages/oskm/oskm.py` 在外面按子命令名分派，已删除：
它要手抄一份查询侧子命令清单，漂了会把命令送去扫描侧，报出
"invalid choice: <你的 --db 路径>"这种方向完全错的错误。

退出码沿用 `oskm/cli.py` 的既有口径，不另造一套：
    0 正常 / 2 参数错 / 3 库打不开 / 5 工具返回 error
`validate-db` 复用 2 表示"不兼容"，与旧 `agentic.runtime validate-db` 一致。
"""
import argparse
import json
import sys
from pathlib import Path

from . import __version__
from .database import validate_db
from .query.session import SessionManager
from .query.tools import REGISTRY, dispatch, export

# JSON Schema 的 type → argparse 的 type。实测 130 个参数里 124 个落在这三行，
# 剩下 6 个是 array/object，单独处理（见 _add_argument）。
_SCALARS = {'string': str, 'integer': int, 'number': float}

EXIT_OK, EXIT_USAGE, EXIT_NO_DB, EXIT_TOOL_ERROR = 0, 2, 3, 5

# 会话管理在 CLI 里退化成参数，不作为命令暴露；但不从 REGISTRY 删，
# 否则要动 tools/ 层。`ask --list` 把它们归到「内部」。
INTERNAL = {'open_session', 'close_session', 'switch_session', 'list_sessions',
            'attach_secondary', 'detach_secondary', 'diff_scans'}


class CliError(Exception):
    def __init__(self, message, code=EXIT_USAGE):
        super().__init__(message)
        self.code = code


# ---------------------------------------------------------------- 库的定位

def resolve_db(args):
    """确定要打开哪个库。

    **不猜默认产品。** `artifacts/` 下的目录布局很容易被误认成"N 个产品"，
    而实际只有个别目录放 knowledge.db。宁可报错也不蒙一个。

    `parents` 的下标按 `cli/oskm_cli/cli.py` 的深度算；在 pyz 里 `__file__`
    指向归档内部，推导出的候选不存在——后面每个候选都有 `is_file()` 守卫，
    所以只是退回 `cwd()` 那一条，不会炸。
    """
    if args.db:
        return Path(args.db[0])
    if args.product:
        package_root = Path(__file__).resolve().parents[2]
        candidates = [
            Path.cwd() / 'artifacts' / args.product / 'knowledge.db',
            package_root / 'artifacts' / args.product / 'knowledge.db',
        ]
        # Source checkout compatibility: cli/oskm_cli/cli.py -> repo root.
        source_root = Path(__file__).resolve().parents[4]
        candidates.append(source_root / 'artifacts' / args.product / 'knowledge.db')
        for candidate in candidates:
            if candidate.is_file():
                return candidate
        return candidates[0]
    raise CliError('need --db PATH or --product NAME')


def _database_not_found_message(path):
    """库不存在时该说什么。

    CLI **自己不下载数据**，所以文案一律指向 skill 的 `bootstrap.py`。
    `~/.oskm/knowledge.db` 单独一支：那是托管运行时的固定位置，
    能给出确定的安装命令；其余路径只提示检查 `--db`，不承诺自动下载。
    """
    path = Path(path).expanduser()
    if path.name == 'knowledge.db' and path.parent.name == '.oskm':
        root = path.parent
        command = f'python3 <skill>/bootstrap.py install --runtime-root {root}'
        setup = (
            '首次使用请用 ohos-design-architecture-evidence-query skill 安装：'
            '先在其 oskm_runtime/.env（或环境）中配置 OSKM_DOWNLOAD_ENDPOINT，'
            f'再执行 `{command}`。CLI 本身不下载数据。')
        return f'database not found: {path}. {setup}'
    return (
        f'database not found: {path}. 检查 --db 路径；托管运行时请用 '
        'ohos-design-architecture-evidence-query skill 的 '
        '`python3 <skill>/bootstrap.py install --runtime-root ~/.oskm` 安装，'
        '再用 --db ~/.oskm/knowledge.db 查询。'
        'CLI 不会为任意缺失路径自动下载。'
    )


def open_session(args):
    """打开库。**不刷新、不联网、不跑 integrity_check。**

    旧实现在这里调 `runtime.ensure_runtime()`，于是每次查询都对 19 MB 库跑一遍
    `PRAGMA integrity_check`。库是 skill 的 `install` 校验通过后才原子落盘的，
    之后没有任何代码路径会改它——按查询次数重付安装期的成本没有意义。
    自动刷新移到了 skill 的 bootstrap（廉价检查，见 cli-skill-split.md §5.3）。
    """
    path = resolve_db(args)
    if not path.is_file():
        raise CliError(_database_not_found_message(path), EXIT_NO_DB)
    manager = SessionManager()
    result = manager.open(str(path), scan_id=args.scan_id)
    if isinstance(result, dict) and 'error' in result:
        raise CliError(f'cannot open {path}: {result["error"]}', EXIT_NO_DB)
    return manager


# ---------------------------------------------------------------- 参数生成

def _add_argument(parser, name, spec, required):
    kind = spec.get('type')
    help_text = spec.get('description', '')
    if kind == 'boolean':
        parser.add_argument(f'--{name}', action='store_true', help=help_text)
    elif kind == 'array':
        # nargs='+' 而不是逗号分隔：逗号在 GN label 和路径里都出现，
        # 拿它当分隔符迟早会把一个值劈成两半。
        parser.add_argument(f'--{name}', nargs='+', required=required,
                            help=help_text or '(可给多个值)')
    elif kind == 'object':
        parser.add_argument(f'--{name}', type=json.loads, required=required,
                            help=(help_text + ' (JSON 对象)').strip())
    else:
        extra = {'choices': spec['enum']} if spec.get('enum') else {}
        parser.add_argument(f'--{name}', type=_SCALARS.get(kind, str),
                            required=required, default=spec.get('default'),
                            help=help_text, **extra)


def build_ask(sub):
    ask = sub.add_parser('ask', allow_abbrev=False,
                         help='直接调用任意一个查询工具（52 个，全部由 schema 生成）')
    ask.add_argument('--list', action='store_true', help='列出全部工具后退出')
    ask.add_argument('--markdown', action='store_true',
                     help='与 --list 合用，输出 Markdown 表（供生成 skill 的工具索引）')
    tools = ask.add_subparsers(dest='tool')
    for tool in export():
        one = tools.add_parser(tool['name'], allow_abbrev=False,
                               help=tool['description'][:72],
                               description=tool['description'])
        schema = tool['inputSchema']
        required = set(schema.get('required', ()))
        for name, spec in schema.get('properties', {}).items():
            _add_argument(one, name, spec, name in required)
    return ask


def tool_params(args, tool_name):
    """把 argparse 的结果还原成工具参数。

    只取这个工具 schema 里声明过的键——全局参数（--db/--format…）和
    argparse 自己塞的 dest 都不能混进去，否则 handler 会以 "unknown parameter"
    直接拒掉。
    """
    schema = next(t['inputSchema'] for t in export() if t['name'] == tool_name)
    values = vars(args)
    params = {}
    for name, spec in schema.get('properties', {}).items():
        value = values.get(name)
        if value is None:
            continue
        if spec.get('type') == 'boolean' and value is False:
            continue        # store_true 没给就是 False，不是"显式传了 false"
        params[name] = value
    return params


def tool_index(markdown=False):
    by_module = {}
    for tool in REGISTRY:
        module = tool.handler.__module__.rsplit('.', 1)[-1]
        by_module.setdefault(module, []).append(tool)
    if not markdown:
        lines = []
        for module in sorted(by_module):
            mark = '（内部，skill 不介绍）' if all(t.name in INTERNAL
                                                 for t in by_module[module]) else ''
            lines.append(f'{module}{mark}')
            for tool in sorted(by_module[module], key=lambda t: t.name):
                flag = ' *' if tool.name in INTERNAL else '  '
                lines.append(f'  {flag}{tool.name:26} {tool.description}')
        lines.append('')
        lines.append('* = 会话类，CLI 里由 --db/--scan-id 或 `diff` 代替')
        return '\n'.join(lines)
    out = ['| 工具 | 模块 | 参数 | 说明 |', '|---|---|---|---|']
    for module in sorted(by_module):
        for tool in sorted(by_module[module], key=lambda t: t.name):
            if tool.name in INTERNAL:
                continue
            schema = tool.input_schema
            required = set(schema.get('required', ()))
            params = ', '.join(
                f'`{n}`' + ('' if n in required else '?')
                for n in schema.get('properties', {}))
            out.append(f'| `{tool.name}` | {module} | {params or "—"} | '
                       f'{tool.description} |')
    return '\n'.join(out)


# ---------------------------------------------------------------- 输出

def emit(payload, fmt):
    if fmt == 'json' or not isinstance(payload, dict):
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        return
    rows = next((v for v in payload.values()
                 if isinstance(v, list) and v and isinstance(v[0], dict)), None)
    if rows is None:
        for key, value in payload.items():
            print(f'{key:22} {json.dumps(value, ensure_ascii=False)[:120]}')
        return
    columns = list(rows[0])
    widths = [max(len(c), *(len(str(r.get(c, ''))) for r in rows)) for c in columns]
    print('  '.join(c.ljust(w) for c, w in zip(columns, widths)))
    print('  '.join('-' * w for w in widths))
    for row in rows:
        print('  '.join(str(row.get(c, '')).ljust(w) for c, w in zip(columns, widths)))


def run_tool(manager, name, params, fmt):
    result = dispatch(name, params, manager)
    if isinstance(result, dict) and 'error' in result:
        print(json.dumps(result, ensure_ascii=False), file=sys.stderr)
        return EXIT_TOOL_ERROR
    emit(result, fmt)
    return EXIT_OK


# ---------------------------------------------------------------- diff

def run_diff(args):
    """跨库 / 跨快照对比。

    `--db` 给两次就是跨库：CLI 在**一次调用内**开第一个库、ATTACH 第二个，
    再调 `diff_scans`。ATTACH 要的只是"同一个进程里开两个库"，而一次 CLI 调用
    本来就是一个进程——早先把它判成"CLI 做不到"是错的。
    alias 不对使用者暴露，固定用 `b`。
    """
    if len(args.db) > 2:
        raise CliError('--db 最多给两个')
    manager = open_session(args)
    scan_a = args.scan_a if args.scan_a is not None else manager.get_active().scan_id
    scan_b, db_b = args.scan_b, None
    if len(args.db) == 2:
        attached = dispatch('attach_secondary',
                            {'db_path': args.db[1], 'alias': 'b'}, manager)
        if 'error' in attached:
            raise CliError(f'cannot attach {args.db[1]}: {attached["error"]}', EXIT_NO_DB)
        db_b = 'b'
        if scan_b is None:
            scan_b = scan_a      # 两个库各自的同号快照，最常见的情形
    if scan_b is None:
        raise CliError('同一个库里对比需要 --scan-b（或再给一个 --db）')
    params = {'entity': args.entity, 'scan_a': scan_a, 'scan_b': scan_b}
    if db_b:
        params['db_b'] = db_b
    if args.fields:
        params['fields'] = args.fields
    return run_tool(manager, 'diff_scans', params, args.format)


# ---------------------------------------------------------------- sql

def read_sql(args):
    """SQL 从文件或 stdin 读，避免 shell 引号地狱。

    带头注释的 SQL 文件曾经被 `check_sql` 判成 NOT_READ_ONLY（它取第一个
    空白分隔的 token，拿到的是 `--`）。已在 `query/security.py` 修掉，
    这里只负责把原文取进来，不做任何改写——改写等于绕过校验。
    """
    if args.sql and args.file:
        raise CliError('--sql 与 --file 二选一')
    if args.sql:
        return args.sql
    if not args.file:
        raise CliError('need --sql TEXT or --file PATH (use - for stdin)')
    if args.file == '-':
        return sys.stdin.read()
    path = Path(args.file)
    if not path.is_file():
        raise CliError(f'sql file not found: {path}')
    return path.read_text(encoding='utf-8')


def run_sql(args):
    manager = open_session(args)
    params = {'sql': read_sql(args)}
    if args.param:
        params['params'] = args.param
    if args.limit is not None:
        params['limit'] = args.limit
    return run_tool(manager, 'sql_query', params, args.format)


# ---------------------------------------------------------------- arch

def _call(manager, name, params):
    """编排用的内部调用：出错就返回 None，由各 arch 命令决定怎么表达。

    arch 的硬约束之一是**只能编排已有工具，不得写新 SQL**。所有 arch 命令
    都只经过这里，这条约束就是可检查的（见 tests/test_arch.py）。
    """
    result = dispatch(name, params, manager)
    return None if isinstance(result, dict) and 'error' in result else result


def _count(manager, table):
    page = _call(manager, 'list_entities', {'table': table, 'page': {'limit': 1}})
    return (page or {}).get('total')


def _row(manager, table, row_id):
    """按主键取一行。

    `component_*` 这批工具收的是 `component_id` 而不是名字，而
    `get_component` 返回的 `repo` 也是 id——所以编排里需要 id→行 的通用一跳。
    走 `list_entities` 而不是新 SQL，符合 arch 的硬约束。
    """
    if not row_id:
        return None
    page = _call(manager, 'list_entities',
                 {'table': table, 'filters': {'id': row_id}, 'page': {'limit': 1}})
    items = (page or {}).get('items') or []
    return items[0] if items else None


def arch_overview(manager, _args):
    info = _call(manager, 'get_scan_info', {}) or {}
    subsystems = _call(manager, 'aggregate',
                       {'table': 'components', 'group_by': ['subsystem']}) or {}
    counts = {label: _count(manager, table) for label, table in (
        ('repos', 'repos'), ('components', 'components'),
        ('install_modules', 'install_modules'), ('install_targets', 'install_targets'),
        ('elf_modules', 'elf_modules'), ('services', 'services'),
        ('sas', 'sas'), ('hdis', 'hdis'), ('gn_args', 'gn_args'),
        ('arkts_modules', 'arkts_modules'), ('arkts_kits', 'arkts_kits'))}
    return {'product': info.get('product'), 'scan_id': info.get('scan_id'),
            'subsystems': len(subsystems.get('groups', [])),
            'counts': counts,
            'top_subsystems': subsystems.get('groups', [])[:10]}


def arch_trace(manager, args):
    """镜像文件 → 安装模块 → 部件 → 子系统 → 代码仓，外加它实现的 SDK 接口。"""
    owner = _call(manager, 'owner_of', {'dest': args.target})
    if owner is None:
        raise CliError(f'not an installed file in this image: {args.target}',
                       EXIT_TOOL_ERROR)
    component = _call(manager, 'get_component', {'name': owner['component']}) or {}
    # get_component 同时返回 repo_id 与 repo 名字；_row 按数字 id 查 repos。
    repo = _row(manager, 'repos', component.get('repo_id')) or {}
    leaf = args.target.rsplit('/', 1)[-1]
    sdk = _call(manager, 'list_arkts_modules', {'implemented_by': leaf, 'limit': 20}) or {}
    deps = _call(manager, 'elf_dependencies', {'dest': args.target, 'max_distance': 1}) or {}
    return {'file': args.target,
            'install_module': owner.get('install_module'),
            'component': owner.get('component'),
            'subsystem': component.get('subsystem'),
            'repo': repo.get('name'),
            'repo_url': repo.get('remote_url'),
            'sdk_modules': [m['module_key'] for m in sdk.get('items', [])],
            'direct_dependencies': deps.get('total')}


def arch_impact(manager, args):
    """谁会受影响。镜像路径走 ELF 反向依赖，部件名走部件反向依赖。"""
    if '/' in args.target:
        result = _call(manager, 'elf_dependents', {'dest': args.target})
        if result is None:
            raise CliError(f'unknown ELF: {args.target}', EXIT_TOOL_ERROR)
        return {'kind': 'elf', 'target': args.target, **result}
    component = _call(manager, 'get_component', {'name': args.target})
    if component is None:
        raise CliError(f'unknown component: {args.target}', EXIT_TOOL_ERROR)
    result = _call(manager, 'component_dependents',
                   {'component_id': component['id']}) or {}
    return {'kind': 'component', 'target': args.target, **result}


def arch_provides(manager, args):
    """一个部件对外提供什么：SysCap、InnerAPI、以及它实现的 SDK 模块。"""
    component = _call(manager, 'get_component', {'name': args.target})
    if component is None:
        raise CliError(f'unknown component: {args.target}', EXIT_TOOL_ERROR)
    cid = component['id']
    syscaps = _call(manager, 'component_syscaps', {'component_id': cid}) or {}
    innerapis = _call(manager, 'component_innerapis', {'component_id': cid}) or {}
    sdk = _call(manager, 'list_arkts_modules',
                {'component': args.target, 'limit': 200}) or {}
    return {'component': args.target, 'subsystem': component.get('subsystem'),
            'syscaps': [s.get('name') for s in syscaps.get('syscaps', [])],
            'innerapi_count': len(innerapis.get('innerapis', [])),
            'sdk_module_total': sdk.get('total'),
            'sdk_modules': [m['module_key'] for m in sdk.get('items', [])][:20]}


def arch_switch(manager, args):
    """一个编译参数控制了哪些部件的特性。

    反向一跳（gn_arg → features）没有专门工具，走通用的 `list_entities`
    按 `gn_arg_id` 过滤——**仍然没有新 SQL**，符合 arch 的硬约束。
    """
    arg = _call(manager, 'get_gn_arg', {'name': args.target})
    if arg is None:
        raise CliError(f'unknown gn arg: {args.target}', EXIT_TOOL_ERROR)
    features = _call(manager, 'list_entities',
                     {'table': 'features', 'filters': {'gn_arg_id': arg['id']},
                      'page': {'limit': 100}}) or {}
    return {'name': arg['name'], 'current_value': arg.get('current_value'),
            'default_value': arg.get('default_value'),
            'declared_in': arg.get('decl_file'), 'source_url': arg.get('source_url'),
            'feature_count': arg.get('feature_count'),
            'features': [f.get('value') for f in features.get('items', [])]}


def arch_runtime(manager, args):
    """一个服务（进程）托管了哪些 SA 与 HDI。"""
    found = _call(manager, 'search_services', {'query': args.target, 'limit': 5})
    results = (found or {}).get('results', [])
    if not results:
        raise CliError(f'no service matches: {args.target}', EXIT_TOOL_ERROR)
    out = []
    for service in results:
        hosted = _call(manager, 'service_hosted', {'service_id': service['id']}) or {}
        owner = _row(manager, 'components', service.get('component_id')) or {}
        out.append({'service': service.get('name'), 'cfg': service.get('cfg'),
                    'component': owner.get('name'),
                    'sas': [s.get('sa_id') for s in hosted.get('sas', [])],
                    'hdis': [h.get('service_name') for h in hosted.get('hdis', [])]})
    return {'query': args.target, 'services': out}


# 封顶 6 条，一一对应六类架构问题。想加第 7 条，先问它是不是真的架构级。
ARCH = {
    'overview': (arch_overview, False, '这个产品由什么构成'),
    'trace': (arch_trace, True, '某个镜像文件从哪来：安装模块 → 部件 → 仓 → SDK 接口'),
    'impact': (arch_impact, True, '改它会影响谁（镜像路径走 ELF，名字走部件）'),
    'provides': (arch_provides, True, '某个部件对外提供什么：SysCap / InnerAPI / SDK 模块'),
    'switch': (arch_switch, True, '某个编译参数控制了哪些特性'),
    'runtime': (arch_runtime, True, '某个服务托管了哪些 SA 与 HDI'),
}


def run_arch(args):
    handler, needs_target, _ = ARCH[args.question]
    if needs_target and not args.target:
        raise CliError(f'arch {args.question} 需要一个参数')
    manager = open_session(args)
    emit(handler(manager, args), args.format)
    return EXIT_OK


# ---------------------------------------------------------------- 入口

def build_parser():
    root = argparse.ArgumentParser(
        prog='oskm-cli', allow_abbrev=False,
        description='OpenHarmony 产品事实库的只读查询（独立产物，不下载数据）。')
    root.add_argument('--version', action='version',
                      version=f'oskm-cli {__version__}')
    root.add_argument('--db', action='append', default=[],
                      help='库路径；diff 可给两次做跨库对比')
    root.add_argument('--product', help='产品名，用于推导 artifacts/<product>/knowledge.db')
    root.add_argument('--scan-id', type=int, help='快照 id，缺省取最新')
    root.add_argument('--format', choices=('json', 'table'), default='json')
    sub = root.add_subparsers(dest='command', required=True)

    build_ask(sub)

    arch = sub.add_parser('arch', allow_abbrev=False, help='顶层架构问题（6 条）')
    arch.add_argument('question', choices=sorted(ARCH),
                      help='; '.join(f'{k}: {v[2]}' for k, v in sorted(ARCH.items())))
    arch.add_argument('target', nargs='?')

    diff = sub.add_parser('diff', allow_abbrev=False,
                          help='跨库或跨快照对比；--db 给两次即跨库')
    diff.add_argument('--entity', required=True,
                      help='components/gn_args/features/services/install_modules/innerapis')
    diff.add_argument('--scan-a', type=int)
    diff.add_argument('--scan-b', type=int)
    diff.add_argument('--fields', nargs='+')

    sql = sub.add_parser('sql', allow_abbrev=False, help='受限只读 SQL；建议走 --file')
    sql.add_argument('--file', help='SQL 文件路径，- 表示 stdin')
    sql.add_argument('--sql', help='直接给一段 SQL（短查询用）')
    sql.add_argument('--param', action='append', help='占位参数，可给多次')
    sql.add_argument('--limit', type=int)

    # 完整 schema 契约校验。skill 的 `install` 与 `bootstrap.py validate-db`
    # 都转发到这里——契约只有 CLI 这一处知道（见 database.py 的说明）。
    validate = sub.add_parser(
        'validate-db', allow_abbrev=False,
        help='完整校验库是否满足当前查询层的 schema 契约')
    validate.add_argument('path', help='knowledge.db 路径')
    return root


def run_validate_db(args):
    try:
        validate_db(Path(args.path).expanduser())
    except ValueError as exc:
        print(f'error: {exc}', file=sys.stderr)
        return EXIT_USAGE
    print(json.dumps({'path': str(Path(args.path).expanduser()), 'ok': True},
                     ensure_ascii=False))
    return EXIT_OK


def main(argv=None):
    args = build_parser().parse_args(argv)
    try:
        if args.command == 'validate-db':
            return run_validate_db(args)
        if args.command == 'ask':
            if args.list:
                print(tool_index(args.markdown))
                return EXIT_OK
            if not args.tool:
                raise CliError('需要工具名，或用 --list 看全部')
            return run_tool(open_session(args), args.tool,
                            tool_params(args, args.tool), args.format)
        if args.command == 'arch':
            return run_arch(args)
        if args.command == 'diff':
            return run_diff(args)
        return run_sql(args)
    except CliError as exc:
        print(f'error: {exc}', file=sys.stderr)
        return exc.code


if __name__ == '__main__':
    raise SystemExit(main())
