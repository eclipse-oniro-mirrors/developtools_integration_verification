"""Read-only module/Kit tools. All filtering and pagination live in ArktsQuery."""
from ..arkts import ArktsQuery
from ..errors import QueryError
from . import register, ToolError

TEXT = {'type': 'string'}
PAGE = {'limit': {'type': 'integer', 'minimum': 1, 'maximum': 200, 'default': 50}, 'page_token': TEXT}
RELATION = {
    'relation_type': {'type': 'string', 'enum': ['declared_membership', 'entry_reference']},
    'condition': {'type': 'string', 'enum': ['dynamic', 'static', 'both', 'unknown', 'unspecified']},
    'include_unspecified': {'type': 'boolean', 'default': False},
    'include_candidates': {'type': 'boolean', 'default': False},
}


def tool(name, method, description, properties, required=()):
    def handler(params, manager):
        if not isinstance(params, dict) or set(params) - set(properties):
            raise ToolError('INVALID_PARAM', 'unknown parameter')
        missing = set(required) - set(params)
        if missing:
            raise ToolError('MISSING_PARAM', ', '.join(sorted(missing)))
        try:
            return getattr(ArktsQuery(manager.get_active()), method)(**params)
        except QueryError as exc:
            raise ToolError(str(exc).split(':', 1)[0], str(exc)) from exc
    register(name, description, {'type': 'object', 'properties': properties,
        'required': list(required), 'additionalProperties': False})(handler)


tool('list_arkts_kits', 'list_kits',
     '分页查询 SDK Kit 与标签分组。origin=label_only 的分组没有入口文件，不可 import；'
     '列出成员不表示这些 API 在本产品可用',
     {**PAGE, 'query': TEXT, 'origin': {'type': 'string', 'enum': ['entry_backed', 'label_only']}})
tool('list_arkts_modules', 'list_modules',
     '分页查询 SDK 逻辑模块（同一模块的动/静两份声明合为一个模块）。'
     '除按声明位置/实现方式筛选外，还可用 component 或 implemented_by 反查'
     '"某个部件/某个 .so 实现了哪些 SDK 接口"',
     {**PAGE, 'query': TEXT,
      'declaration_scope': {'type': 'string', 'enum': ['api_named', 'api_auxiliary', 'internal_component',
                                                       'internal_ets', 'arkts_named', 'arkts_builtin']},
      'implementation_kind': {'type': 'string', 'enum': ['napi', 'arkui', 'arkts_builtin',
                                                         'arkts_language', 'type_only', 'unknown']},
      'declaration_format': {'type': 'string', 'enum': ['d.ts', 'd.ets', 'static.d.ets']},
      'language_coverage': {'type': 'string', 'enum': ['dynamic', 'static', 'both']},
      'membership': {'type': 'string', 'enum': ['declared', 'undeclared']},
      # 反向查询：这两个参数是实现映射接入全库关联图之后才可能的。
      # component 需要 elf_modules/components 在库里，缺表会明确报
      # CAPABILITY_UNAVAILABLE，而不是静默返回 0 条。
      'component': dict(TEXT, description='按实现它的 .so 所属部件名精确筛选，例如 ace_engine'),
      'implemented_by': dict(TEXT, description='按实现库路径子串筛选，例如只传 libimage.z.so。'
                                               '库中存的是已按本次扫描 cpu_arch 构造的完整路径')})
tool('list_arkts_declarations', 'list_declarations', '分页查询声明文件本身（模块声明与 Kit 入口），含读取状态与仓内位置',
     {**PAGE, 'query': TEXT, 'role': {'type': 'string', 'enum': ['module', 'kit_entry']},
      'language_variant': {'type': 'string', 'enum': ['dynamic', 'static']},
      'read_status': {'type': 'string',
                      'enum': ['ok', 'unreadable', 'encoding_failed', 'limit_exceeded', 'path_invalid']}})
tool('get_arkts_kit', 'get_kit',
     'Kit 详情、入口文件与分页原文证据。member_routes 给出成员的两条来路'
     '（模块自己的 @kit 标签 / 入口的 import）各自多少、重合多少；'
     '没有入口文件的 label_only 分组改给 mentioned_in（谁提过它）',
     {'kit_key': TEXT, 'limit': PAGE['limit'], 'source_page_token': TEXT, 'evidence_page_token': TEXT}, ('kit_key',))
tool('get_arkts_module', 'get_module',
     '模块详情、各语言版本的声明文件、实现 so（含镜像实际位置）及分页归属/引用证据。'
     'implementation 为 null 表示没有实现证据，不等于"没有实现"——'
     '看 module.implementation_kind 区分 type_only / arkts_builtin / unknown',
     {'module_key': TEXT, 'limit': PAGE['limit'], 'declaration_page_token': TEXT, 'evidence_page_token': TEXT}, ('module_key',))
tool('arkts_kit_modules', 'kit_modules',
     'Kit 的去重成员模块，或未解析的引用。relation_type 可只取一条来路。'
     '注意引用**条数**不等于模块数：同一模块常在 if arkts static / dynamic 两个分支里'
     '各 import 一次。被引用也不证明该模块的全部 API 都由这个 Kit 导出',
     {**PAGE, **RELATION, 'kit_key': TEXT, 'view': {'type': 'string', 'enum': ['resolved', 'unresolved']}}, ('kit_key',))
tool('arkts_module_kits', 'module_kits',
     '模块所属的 Kit/标签分组。relation_type 区分"模块自己声明的归属"与"被入口引用"——'
     '两者会不一致，而且不一致是正常的',
     {**PAGE, **RELATION, 'module_key': TEXT}, ('module_key',))
