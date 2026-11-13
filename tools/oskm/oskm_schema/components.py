"""部件及其特性/接口/系统能力的表结构。

采集侧（`oskm/collectors/components`）与查询侧（`cli/oskm_cli/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `cli/oskm_cli/` 能独立发布——
理由与被否掉的软链方案见 `docs/architecture/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


COMPONENTS = Table(
    'components',
    columns=(
        Column('name', nullable=False),
        Column('subsystem'),
        Column('manifest'),
        Column('repo_id', 'INTEGER', references='repos(id)'),
        Column('deps', 'JSON'),
        # No features/syscap columns: `record` already holds the manifest's own
        # arrays verbatim, and the expanded values live in the features/syscaps
        # tables, which are what every query actually wants (json_each can never
        # use an index). A column would be a third copy of the same fact.
        Column('record', 'JSON'),
    ),
    primary_key=('name',),
    surrogate=True,
    indexes=(Index('idx_components_subsystem', ('scan_id', 'subsystem')),
             Index('idx_components_repo', ('scan_id', 'repo_id'))),
)


INNERAPIS = Table(
    'innerapis',
    columns=(
        Column('component_id', 'INTEGER', nullable=False, references='components(id)'),
        Column('field', nullable=False),            # inner_kits | inner_api
        Column('source_index', 'INTEGER', nullable=False),
        Column('name', nullable=False),             # GN label, as declared
        Column('external_name'),                    # what external_deps refers to
        Column('install_module_id', 'INTEGER',
               references='install_modules(id)', on_delete='SET NULL'),  # component_links fills
        Column('record', 'JSON', nullable=False),   # the element verbatim
    ),
    surrogate=True,
    indexes=(Index('idx_innerapis_external', ('scan_id', 'external_name')),
             Index('idx_innerapis_component', ('scan_id', 'component_id')),
             Index('idx_innerapis_module', ('scan_id', 'install_module_id'))),
)


FEATURES = Table(
    'features',
    columns=(
        Column('component_id', 'INTEGER', nullable=False, references='components(id)'),
        Column('source_index', 'INTEGER', nullable=False),
        Column('value', nullable=False),
        Column('gn_arg_id', 'INTEGER',
               references='gn_args(id)', on_delete='SET NULL'),  # component_links fills
    ),
    surrogate=True,
    indexes=(Index('idx_features_value', ('scan_id', 'value')),
             Index('idx_features_component', ('scan_id', 'component_id')),
             Index('idx_features_gn_arg', ('scan_id', 'gn_arg_id'))),
)


def _value_table(name):
    """A component's declared string list, one row per element.

    syscap and features are near one-to-one with components (measured: 304
    distinct values for 306 syscap entries, 1351 for 1351 features), so this is
    not normalisation for sharing. It exists because json_each can never use an
    index, and because comparing two scans becomes a plain EXCEPT.
    """
    return Table(
        name,
        columns=(
            Column('component_id', 'INTEGER', nullable=False, references='components(id)'),
            Column('source_index', 'INTEGER', nullable=False),
            Column('value', nullable=False),
        ),
        surrogate=True,
        indexes=(Index(f'idx_{name}_value', ('scan_id', 'value')),
                 Index(f'idx_{name}_component', ('scan_id', 'component_id'))),
    )


SYSCAPS = _value_table('syscaps')


TABLES = (COMPONENTS, FEATURES, INNERAPIS, SYSCAPS)
