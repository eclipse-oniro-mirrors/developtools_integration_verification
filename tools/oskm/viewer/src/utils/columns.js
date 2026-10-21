export const TABLE_CONFIG = {
  repos: {
    table: 'repos', alias: 'r', defaultSort: 'name',
    columns: [
      { key: 'name', label: 'Name', sort: true },
      { key: 'path', label: 'Path', truncate: 40 },
      { key: 'revision', label: 'Revision', sort: true, filterKey: 'revision', filterOptions: ['master'] },
      { key: 'groups', label: 'Groups', truncate: 30 },
      { key: 'head_commit', label: 'Commit', truncate: 8 },
    ],
    filters: ['revision'],
    search: ['name', 'path'],
  },
  components: {
    table: 'components', alias: 'c', defaultSort: 'name',
    columns: [
      { key: 'name', label: 'Name', sort: true },
      { key: 'subsystem', label: 'Subsystem', sort: true, filterKey: 'subsystem' },
      { key: 'manifest', label: 'Manifest', truncate: 40 },
      { key: 'repo_name', label: 'Repo', computed: true },
      { key: 'issue_count', label: 'Issues', sort: true, type: 'int', computed: true },
    ],
    filters: ['subsystem', 'repo_id', 'has_issues'],
    search: ['name', 'subsystem'],
    joins: 'LEFT JOIN repos r2 ON r2.id = c.repo_id AND r2.scan_id = __SCAN__',
    extraCols: "r2.name AS repo_name, (SELECT COUNT(*) FROM issues WHERE scan_id = __SCAN__ AND component = c.name) AS issue_count",
  },
  services: {
    table: 'services', alias: 's', defaultSort: 'cfg',
    columns: [
      { key: 'cfg', label: 'Cfg', sort: true, truncate: 40 },
      { key: 'name', label: 'Name', sort: true },
      { key: 'type', label: 'Type', sort: true, badge: true, filterKey: 'type', filterOptions: ['sa', 'hdf', 'default'] },
      { key: 'executable', label: 'Executable', truncate: 30 },
      { key: 'uid', label: 'UID' },
      { key: 'component_name', label: 'Component', computed: true },
    ],
    filters: ['type', 'component_id'],
    search: ['name', 'cfg'],
    joins: 'LEFT JOIN components c2 ON c2.id = s.component_id AND c2.scan_id = __SCAN__',
    extraCols: "c2.name AS component_name",
  },
  sas: {
    table: 'sas', alias: 'sa', defaultSort: 'sa_id',
    columns: [
      { key: 'sa_id', label: 'SA ID', sort: true, type: 'int' },
      { key: 'process_name', label: 'Process', sort: true, truncate: 30, computed: true },
      { key: 'libpath', label: 'Libpath', truncate: 30 },
      { key: 'component_name', label: 'Component', computed: true },
    ],
    filters: ['component_id'],
    search: ['libpath'],
    joins: 'LEFT JOIN components c2 ON c2.id = sa.component_id AND c2.scan_id = __SCAN__ LEFT JOIN services sv ON sv.id = sa.service_id AND sv.scan_id = __SCAN__',
    extraCols: "c2.name AS component_name, sv.name AS process_name",
  },
  hdis: {
    table: 'hdis', alias: 'h', defaultSort: 'service_name',
    columns: [
      { key: 'service_name', label: 'Service', sort: true, truncate: 30 },
      { key: 'module_name', label: 'Module', sort: true, truncate: 30 },
      { key: 'process_name', label: 'Process', truncate: 20, computed: true },
      { key: 'component_name', label: 'Component', computed: true },
    ],
    filters: ['component_id'],
    search: ['service_name', 'module_name'],
    joins: 'LEFT JOIN components c2 ON c2.id = h.component_id AND c2.scan_id = __SCAN__ LEFT JOIN services sv ON sv.id = h.service_id AND sv.scan_id = __SCAN__',
    extraCols: "c2.name AS component_name, sv.name AS process_name",
  },
  install_modules: {
    table: 'install_modules', alias: 'im', defaultSort: 'ordinal',
    columns: [
      { key: 'label', label: 'Label', sort: true, truncate: 40 },
      { key: 'type', label: 'Type', sort: true, badge: true, filterKey: 'type', filterOptions: ['lib', 'etc', 'bin', 'sa_info', 'app', 'unknown'] },
      { key: 'source', label: 'Source', truncate: 30 },
      { key: 'component_name', label: 'Component', computed: true },
      { key: 'install_enable', label: 'Enable', sort: true, type: 'bool' },
    ],
    filters: ['type', 'component_id'],
    search: ['label', 'source'],
    joins: 'LEFT JOIN components c2 ON c2.id = im.component_id AND c2.scan_id = __SCAN__',
    extraCols: "c2.name AS component_name",
  },
  elf_modules: {
    table: 'elf_modules', alias: 'e', defaultSort: 'dest',
    columns: [
      { key: 'position', label: 'Position', sort: true },
      { key: 'dest', label: 'Dest', sort: true, truncate: 46, computed: true },
      { key: 'partition', label: 'Partition', sort: true, badge: true,
        filterKey: 'partition', filterOptions: ['system', 'vendor', 'updater', 'ramdisk'] },
      { key: 'file_name', label: 'File', sort: true, truncate: 30 },
      { key: 'soname', label: 'SONAME', truncate: 30 },
      { key: 'format', label: 'Format', sort: true },
      { key: 'api_type', label: 'API Type', sort: true, badge: true,
        filterKey: 'api_type', filterOptions: ['public_api', 'inner_api', 'internal_api'] },
      { key: 'category', label: 'Category', sort: true,
        type: 'tags', filterKey: 'category', filterMode: 'json-array',
        filterOptions: ['napi', 'ndk', 'ani', 'cangjie', 'extension',
          'platform_sdk', 'platform_sdk_indirect', 'chipset_sdk',
          'chipset_sdk_indirect', 'sa', 'hdi', 'hdi_proxy', 'hdi_stub',
          'anco', 'other'] },
      { key: 'type', label: 'Type', sort: true },
      { key: 'machine', label: 'Machine', sort: true, type: 'int' },
      { key: 'dynamic', label: 'Dynamic', type: 'bool' },
      { key: 'needed', label: 'Needed', truncate: 36 },
      { key: 'component_name', label: 'Component', computed: true },
      { key: 'module_label', label: 'Module', computed: true },
    ],
    search: [{ expr: 't2.dest' }, 'file_name', 'soname'],
    joins: `JOIN install_targets t2 ON t2.scan_id = e.scan_id AND t2.id = e.install_target_id
      LEFT JOIN components c2 ON c2.id = e.component_id AND c2.scan_id = __SCAN__
      LEFT JOIN install_modules im ON im.id = e.install_module_id AND im.scan_id = __SCAN__`,
    extraCols: 't2.dest AS dest, c2.name AS component_name, im.label AS module_label',
  },
  elf_module_dependencies: {
    table: 'elf_module_dependencies', alias: 'd', defaultSort: 'caller_id',
    columns: [
      { key: 'caller_id', label: 'Caller', sort: true, type: 'int' },
      { key: 'needed_ordinal', label: 'Ordinal', sort: true, type: 'int' },
      { key: 'needed_name', label: 'Needed', sort: true, truncate: 34 },
      { key: 'callee_id', label: 'Callee', sort: true, type: 'int' },
      { key: 'callee_dest', label: 'Callee Dest', truncate: 44, computed: true },
    ],
    search: ['needed_name', { expr: 'callee_t.dest' }],
    joins: `LEFT JOIN elf_modules callee ON callee.scan_id = d.scan_id AND callee.id = d.callee_id
      LEFT JOIN install_targets callee_t ON callee_t.scan_id = callee.scan_id
        AND callee_t.id = callee.install_target_id`,
    extraCols: 'callee_t.dest AS callee_dest',
  },
  issues: {
    table: 'issues', alias: 'i', defaultSort: 'severity', noId: true,
    columns: [
      { key: 'code', label: 'Code', sort: true, badge: 'severity' },
      { key: 'severity', label: 'Severity', sort: true, filterKey: 'severity', filterOptions: ['error', 'warning', 'info'] },
      { key: 'collector', label: 'Collector', sort: true, filterKey: 'collector', filterOptions: ['repos', 'components', 'install_modules', 'services', 'hdi', 'sas'] },
      { key: 'path', label: 'Path', truncate: 40 },
      { key: 'component', label: 'Component', sort: true },
      { key: 'advisory', label: 'Advisory', sort: true, type: 'bool', filterKey: 'advisory', filterOptions: ['0', '1'] },
    ],
    filters: ['collector', 'severity', 'advisory'],
    search: ['code', 'path'],
  },
}

/* 导航已移到 src/model/nav.js —— 它属于产品面结构，不是表格列定义。 */

export const TYPE_BADGES = {
  sa: { class: 'sa', color: 'var(--green)' },
  hdf: { class: 'hdi', color: 'var(--orange)' },
  default: { class: 'repo', color: 'var(--gray)' },
  lib: { class: 'module', color: 'var(--purple)' },
  etc: { class: 'module', color: 'var(--purple)' },
  bin: { class: 'service', color: 'var(--cyan)' },
  sa_info: { class: 'sa', color: 'var(--green)' },
  app: { class: 'repo', color: 'var(--gray)' },
  unknown: { class: 'repo', color: 'var(--gray)' },
}

export const SEVERITY_COLORS = {
  error: 'var(--red)',
  warning: 'var(--orange)',
  info: 'var(--blue)',
}
