"""ELF 模块与依赖边的表结构。

采集侧（`oskm/collectors/elf_modules`）与查询侧（`cli/oskm_cli/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `cli/oskm_cli/` 能独立发布——
理由与被否掉的软链方案见 `docs/architecture/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


ELF_MODULES = Table(
    'elf_modules',
    columns=(
        Column('position', 'INTEGER', nullable=False),
        Column('install_target_id', 'INTEGER', nullable=False,
               references='install_targets(id)'),
        Column('install_module_id', 'INTEGER', nullable=False,
               references='install_modules(id)'),
        Column('component_id', 'INTEGER', references='components(id)'),
        Column('partition', nullable=False),
        Column('file_name', nullable=False),
        Column('soname'),
        Column('format'),
        Column('api_type', nullable=False,
               check="api_type IN ('public_api', 'inner_api', 'internal_api')"),
        Column('category', 'JSON', nullable=False,
               check="json_valid(category) AND json_type(category) = 'array'"),
        Column('type'),
        Column('machine', 'INTEGER'),
        Column('dynamic', 'INTEGER', nullable=False),
        Column('needed', 'JSON', nullable=False),
    ),
    primary_key=('position',),
    surrogate=True,
    indexes=(Index('idx_elf_modules_target', ('scan_id', 'install_target_id'),
                   unique=True),
             Index('idx_elf_modules_name', ('scan_id', 'file_name')),
             Index('idx_elf_modules_install', ('scan_id', 'install_module_id')),
             Index('idx_elf_modules_component', ('scan_id', 'component_id')),
             Index('idx_elf_modules_api_type', ('scan_id', 'api_type'))),
)


ELF_MODULE_DEPENDENCIES = Table(
    'elf_module_dependencies',
    columns=(
        Column('caller_id', 'INTEGER', nullable=False, references='elf_modules(id)'),
        Column('needed_ordinal', 'INTEGER', nullable=False),
        Column('needed_name', nullable=False),
        Column('callee_id', 'INTEGER', references='elf_modules(id)'),
    ),
    primary_key=('caller_id', 'needed_ordinal'),
    surrogate=True,
    indexes=(Index('idx_elf_module_dependencies_callee', ('scan_id', 'callee_id')),
             Index('idx_elf_module_dependencies_name', ('scan_id', 'needed_name'))),
)


TABLES = (ELF_MODULES, ELF_MODULE_DEPENDENCIES,)
