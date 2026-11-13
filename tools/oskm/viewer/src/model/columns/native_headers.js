/* Native SDK 头文件映射（native_headers）。

   一行只表达“这个 ELF 提供这个头文件”，不是“这个头文件属于这个部件”。
   部件、安装模块等归属字段都经 ELF JOIN 得到，避免在映射表里冗余存储。 */
export const GROUPS = ['头文件', 'Native SDK 库', '匹配方式', '归属']

export const MATCH_STRATEGIES = {
  'build_gn': 'BUILD.gn',
  'header_library': '@library',
  symbol: '符号匹配',
}

export const COLUMNS = [
  { key: 'header_path', label: '源码头文件', group: '头文件', type: 'path', min: 360,
    fixed: true, show: true, primary: true, full: 64,
    meaning: 'interface/sdk_c 里的源码头文件，相对工程根目录。',
    reading: 'GN 的 sources 声明会把它安装进 SDK sysroot；这里保留源路径，方便回代码仓。' },
  { key: 'sourceUrl', label: '源码', group: '头文件', type: 'text', width: 90, show: true,
    value: r => (r.sourceUrl ? '查看 ↗' : ''),
    href: r => r.sourceUrl || null,
    meaning: '在代码仓里打开这份头文件。',
    reading: '公开托管仓用扫描当时的提交号拼 blob 链接；codehub 开源仓用分支名拼 files 链接。未做内容比对。' },

  { key: 'dest', label: '镜像库路径', group: 'Native SDK 库', type: 'path', min: 260, show: true,
    link: r => (r.elf_module_id ? { entity: 'elf_modules', id: r.elf_module_id } : null),
    meaning: '这个 Native SDK ELF 在产品镜像中的实际路径。',
    reading: '经 native_headers.elf_module_id → install_targets.dest JOIN 重建。' },
  { key: 'soname', label: 'SONAME', group: 'Native SDK 库', type: 'text', min: 200,
    value: r => r.soname || r.file_name,
    meaning: '应用链接这个库时使用的逻辑名。',
    reading: '未声明 SONAME 时退回文件名，不把两种事实混写回数据库。' },
  { key: 'file_name', label: '文件名', group: 'Native SDK 库', type: 'text', width: 200,
    meaning: 'ELF 文件名。',
    reading: '与 SONAME 通常相同，但不是同一条事实。' },
  { key: 'partition', label: '分区', group: 'Native SDK 库', type: 'badge', width: 110,
    badgeClass: () => 'b-module',
    meaning: '库所在的镜像分区。',
    reading: '同名库可能出现在多个分区；每条路径一行。' },

  { key: 'match_strategy', label: '匹配方式', group: '匹配方式', type: 'enum', width: 130,
    show: true, value: r => MATCH_STRATEGIES[r.match_strategy] || r.match_strategy,
    meaning: '采集器用哪类证据建立库与头文件的映射。',
    reading: 'BUILD.gn 声明最可靠；@library 次之；符号匹配是唯一极兜底。' },

  { key: 'component', label: '归属部件', group: '归属', type: 'text', min: 180, show: true,
    link: r => (r.component_id ? { entity: 'components', id: r.component_id } : null),
    meaning: '构建并安装这个 Native SDK 库的部件。',
    reading: '通过 ELF 的 component_id JOIN 得到；native_headers 本身不存部件。' },
  { key: 'subsystem', label: '子系统', group: '归属', type: 'text', width: 150,
    meaning: '归属部件所在的子系统。',
    reading: '来自 components 索引，用于观察 Native SDK 能力跨子系统分布。' },
  { key: 'label', label: '安装模块', group: '归属', type: 'label', min: 260,
    link: r => (r.install_module_id ? { entity: 'install_modules', id: r.install_module_id } : null),
    meaning: '装出这个 ELF 的 GN target。',
    reading: '点链接可查看同模块安装出的其它文件。' },
]
