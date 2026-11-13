"""P1 projections: the logical module is the entity, the file is its source.

A module carries one declaration per language variant: `X.d.ts` (or `X.d.ets`)
declares it for ArkTS 1.1, `X.static.d.ets` for 1.2. Keying on the file made
those two look like two modules, which is what turned every dual-declared
module into an unresolvable import target. The key is therefore the path with
the language suffix removed, and the files hang off it -- the same shape
`arkts_kits` already used for its entry files.
"""
from .base import Column as C, Index, Table


def enum(name, values):
    return C(name, nullable=False, check=f"{name} IN ({','.join(repr(v) for v in values.split())})")


def enum2(name, values, extra):
    """枚举 + 一条跨列约束。"""
    allowed = ','.join(repr(v) for v in values.split())
    return C(name, nullable=False, check=f'{name} IN ({allowed}) AND ({extra})')


MODULES = Table('arkts_modules', columns=(
    # Path without the language suffix: api/@ohos.arkui.UIContext
    C('module_key', nullable=False),
    # The bare specifier this module can be imported by, when it has one.
    # Half the declaration files (@internal components, api/ subdirectories,
    # arkts/builtin) are only reachable by relative path and leave this NULL.
    C('module_name'),
    # Where the declaration lives. A path fact, always determinable.
    enum('declaration_scope',
         'api_named api_auxiliary internal_component internal_ets arkts_named arkts_builtin'),
    # How it is implemented. Needs evidence and may be unknown -- deliberately
    # a separate column from the scope, because the directories are mixed:
    # api/ holds both NAPI modules and ArkUI declarations.
    enum('implementation_kind', 'napi arkui arkts_builtin arkts_language type_only unknown'),
    # Which ArkTS language variants declare it. 'both' is the case that used to
    # be reported as an ambiguous import target.
    enum('language_coverage', 'dynamic static both'),

    # -- 实现它的动态库。原先是一张 arkts_module_impls 表，实测 932 行对 932 个
    #    模块、严格一对一，折叠成列后少一张表、少一次 join。
    # 本次扫描按 ScanRequest.cpu_arch 构造的实现库镜像路径：arm 落
    # system/lib/，arm64 落 system/lib64/。即使路径不在本产品镜像里（impl_elf_id 为空），
    # 也保留下来说明扫描期望的实现产物是什么。
    C('impl_so_path'),
    # NAPI 运行时注册名。多数等于 module_name 去掉 @ohos.，但 19 例不是，
    # 所以不能由模块名推出。
    C('impl_napi_name'),
    # 运行时名是怎么对上这个模块的，强度从高到低。
    # name_suffix 是兜底匹配，证据弱一些，必须能被认出来。
    C('impl_match', check="impl_match IS NULL OR impl_match IN "
                          "('module_name','declaration_path','name_suffix','arkui_engine')"),
    # 解析到镜像里的哪一行 ELF。由 arkts_links 回填——elf_modules 排采集序最后，
    # arkts 排第二，直接依赖会成环。
    C('impl_elf_id', 'INTEGER', references='elf_modules(id)')),
    primary_key=('module_key',), surrogate=True,
    indexes=tuple(Index('idx_arkts_modules_' + name, ('scan_id', name))
                  for name in ('module_name', 'declaration_scope', 'implementation_kind',
                               'language_coverage', 'impl_elf_id')))

KITS = Table('arkts_kits', columns=(C('kit_key', nullable=False), C('name', nullable=False), C('import_name'),
    C('origin', nullable=False, check="(origin='entry_backed' AND import_name IS NOT NULL) OR "
                                    "(origin='label_only' AND import_name IS NULL)")),
    primary_key=('kit_key',), surrogate=True,
    indexes=(Index('idx_arkts_kits_origin', ('scan_id', 'origin', 'name')),))

# One row per declaration file. 十二个按文件的列原先分散在两张表里，收敛到这一张。
#
# 只装 SDK 里的声明文件。采集过程用到的参考数据（napi-map.json）不入库——
# 它是扫描器自带的，不是被扫源码树的内容；它的摘要记在 collector_runs.scope 里。
SOURCES = Table('arkts_sources', columns=(
    C('source_path', nullable=False),
    C('module_id', 'INTEGER', references='arkts_modules(id)'),
    C('kit_id', 'INTEGER', references='arkts_kits(id)'),
    # 文件名不是合法 @kit.<Name> 的 Kit 入口，保留行与读取状态，kit_id 为空——
    # 那时只有 role 能说明它是个 Kit 入口。
    enum2('role', 'module kit_entry',
          "(role='module' AND module_id IS NOT NULL AND kit_id IS NULL) OR "
          "(role='kit_entry' AND module_id IS NULL)"),
    # 文件名后缀：语法事实，一份文件只有一个。
    enum('declaration_format', 'd.ts d.ets static.d.ets'),
    # 后缀对应的 ArkTS 语言版本。单值，不会同时 static+dynamic——
    # "两个版本都有"是模块级的事实，见 arkts_modules.language_coverage。
    enum('language_variant', 'dynamic static'),
    # 文件**内容**声明它适用于哪种模式，与后缀无关：一份普通 .d.ts 写上
    # 'use static' 同样会判成 static。枚举保持与后端 IR 一致的五个取值，
    # 当前 header 提取器只会产出 static / unspecified。
    enum('file_condition', 'unspecified dynamic static both unknown'),
    # 上面那个判断的依据：找到了哪些标记、在第几字节。
    # static_suffix 的 span 为 null（依据是文件名，不是某段字节），
    # use_static 带指令本身的跨度。
    C('condition_evidence', 'JSON', nullable=False),
    C('byte_size', 'INTEGER'),
    enum('read_status', 'ok unreadable encoding_failed limit_exceeded path_invalid'),
    enum('header_status', 'ok no_tag partial failed'),
    # 每个提取能力在这份文件上跑成什么样：{能力: 状态}。
    # 只存状态——extractor_version 全库一个值，已在 scope.backend.capabilities 里，
    # 逐行重复四遍白占 57% 的表空间。
    # 保持 JSON 而不是拆成固定列：新增一个能力就多一个键，不必改表结构，
    # 这与"加一个事实 = 加一个提取器 + 一条注册"的扩展契约一致。
    C('coverage', 'JSON', nullable=False),
    # 文件头的字节跨度。原文不存：整段是许可证样板，承载归属的 @kit 标签
    # 已作为关系原文保留。
    C('header_span', 'JSON')),
    primary_key=('source_path',), surrogate=True,
    indexes=(Index('idx_arkts_sources_module', ('scan_id', 'module_id', 'language_variant')),
             Index('idx_arkts_sources_kit', ('scan_id', 'kit_id', 'source_path')),
             Index('idx_arkts_sources_status', ('scan_id', 'role', 'read_status'))))

RELATIONS = Table('arkts_kit_relations', columns=(C('evidence_key', nullable=False),
    C('kit_id', 'INTEGER', nullable=False, references='arkts_kits(id)'),
    C('module_id', 'INTEGER', references='arkts_modules(id)'),
    # The file the evidence was read from. Non-null for both relation types:
    # a span only exists inside a file.
    C('source_id', 'INTEGER', nullable=False, references='arkts_sources(id)'),
    C('relation_type', nullable=False, check="(relation_type='declared_membership' AND module_id IS NOT NULL "
        "AND statement_kind='kit_tag' AND target_kind='module' AND resolution_status='resolved') OR "
        "(relation_type='entry_reference' AND "
        "((resolution_status='resolved' AND module_id IS NOT NULL) OR (resolution_status!='resolved' AND module_id IS NULL)))"),
    enum('evidence_state', 'confirmed candidate'),
    enum('statement_kind', 'kit_tag import_from side_effect_import export_from unsupported'),
    C('source_path', nullable=False), C('start_byte', 'INTEGER', nullable=False, check='start_byte >= 0'),
    C('end_byte', 'INTEGER', nullable=False, check='end_byte > start_byte'),
    C('line', 'INTEGER', nullable=False, check='line >= 1'), C('column', 'INTEGER', nullable=False, check='column >= 1'),
    C('target_text'), enum('target_kind', 'module kit external unknown'),
    enum('resolution_status', 'resolved ambiguous not_found out_of_scope unsupported'),
    C('resolution_method'), C('resolution_reason'), C('candidate_keys', 'JSON', nullable=False),
    enum('condition_state', 'unspecified dynamic static both unknown'), C('condition_evidence', 'JSON', nullable=False),
    C('record', 'JSON', nullable=False)), primary_key=('evidence_key',), surrogate=True,
    indexes=(Index('idx_arkts_rel_kit', ('scan_id', 'kit_id', 'resolution_status', 'module_id')),
             Index('idx_arkts_rel_module', ('scan_id', 'module_id', 'relation_type')),
             Index('idx_arkts_rel_status', ('scan_id', 'resolution_status', 'evidence_key')),
             Index('idx_arkts_rel_source', ('scan_id', 'source_id'))))

# Declaration order is insert order: sources reference modules and kits,
# relations reference all three.
TABLES = (MODULES, KITS, SOURCES, RELATIONS)
