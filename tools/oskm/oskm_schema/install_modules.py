"""安装模块与镜像产物的表结构。

采集侧（`oskm/collectors/install_modules`）与查询侧（`agentic/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `agentic/` 能独立发布——
理由与被否掉的软链方案见 `agentic/docs/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


INSTALL_MODULES = Table(
    'install_modules',
    columns=(
        Column('ordinal', 'INTEGER', nullable=False),
        # Derived, not projected: the GN label with its toolchain suffix removed.
        Column('label'),
        Column('label_name'),
        Column('type'),
        Column('shlib_type'),
        Column('source'),
        Column('install_enable', 'INTEGER'),
        Column('component_id', 'INTEGER', references='components(id)'),
        # The SMI row exactly as declared, including dest, part_name and
        # subsystem_name -- none of which have columns.
        Column('record', 'JSON', nullable=False),
    ),
    primary_key=('ordinal',),
    surrogate=True,
    # Not unique: rk3568 happens to build every target with one toolchain, but
    # the same target built for two toolchains strips to one label, and that is
    # exactly the case services' ORIGIN_LABEL_AMBIGUOUS exists for.
    indexes=(Index('idx_install_modules_label', ('scan_id', 'label')),
             Index('idx_install_modules_type', ('scan_id', 'type')),
             Index('idx_install_modules_component', ('scan_id', 'component_id'))),
)


INSTALL_TARGETS = Table(
    'install_targets',
    columns=(
        Column('module_id', 'INTEGER', nullable=False, references='install_modules(id)'),
        # The Nth thing this module puts in the image, counting dest[] first and
        # then symlink_file[]. Not a subscript into either array -- nothing maps
        # it back, and both arrays start at 0.
        Column('dest_index', 'INTEGER', nullable=False),
        Column('dest', nullable=False),
        # 1 when the declaration ended in '/': the whole directory belongs to
        # this module, so an exact-path lookup is not enough (see targets.py).
        Column('directory', 'INTEGER', nullable=False, default='0'),
        Column('partition'),
        Column('file_name'),
        # Observed from the package, not declared in SMI -- so deliberately
        # absent from `record`, which stays the verbatim declaration.
        # (Precedent: repos.head_commit is the same kind of observation.)
        #
        # Bytes this entry itself occupies: lstat, never following links.
        # Following them would double-count -- rk3568's one symlink
        # (system/etc/etsstdlib.abc -> ../framework/etsstdlib_bootabc.abc)
        # points at a file that is *also* installed in its own right, so a
        # followed size would add its 1.9 MB to the image total twice.
        # For a directory install it is the sum over the tree below.
        Column('size', 'INTEGER'),
        # The link_target resolved to a full image-relative path (same format
        # as `dest`), so consumers can JOIN on it without resolving ../.
        # For non-symlinks, NULL. `is_symlink` is derivable from it being
        # non-NULL, so no separate column.
        Column('link_target_path'),
        # The install_targets.id of the row whose dest == link_target_path,
        # so consumers can follow the link by row id instead of by path.
        # NULL when the target is not in the same scan (or not a symlink).
        Column('link_target_id', 'INTEGER', references='install_targets(id)'),
    ),
    surrogate=True,
    # (module, path) is the natural key: a module puts one thing at one path.
    # dest_index cannot carry it any more -- dest[] and symlink_file[] are both
    # numbered from 0, so it is now a running ordinal over the two
    # (see symlink-design.md §3.4). Measured: zero duplicate paths within a module.
    indexes=(Index('idx_install_targets_key', ('scan_id', 'module_id', 'dest'),
                   unique=True),
             Index('idx_install_targets_dest', ('scan_id', 'dest')),
             Index('idx_install_targets_partition', ('scan_id', 'partition')),
             Index('idx_install_targets_name', ('scan_id', 'file_name'))),
)


INSTALL_MODULE_TAGS = Table(
    'install_module_tags',
    columns=(
        Column('module_id', 'INTEGER', nullable=False, references='install_modules(id)'),
        Column('source_index', 'INTEGER', nullable=False),
        Column('value', nullable=False),
    ),
    surrogate=True,
    indexes=(Index('idx_install_module_tags_value', ('scan_id', 'value')),
             Index('idx_install_module_tags_module', ('scan_id', 'module_id'))),
)


TABLES = (INSTALL_MODULES, INSTALL_MODULE_TAGS, INSTALL_TARGETS,)
