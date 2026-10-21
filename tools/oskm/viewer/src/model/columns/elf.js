/* ELF 模块列表的列目录。
   物理字段是事实；machine 译文、needed 数量是 viewer 派生。 */
export const GROUPS = ['文件', 'API', 'ELF 事实', '依赖', '归属']

export const API_TYPES = ['public_api', 'inner_api', 'internal_api']

export const ELF_CATEGORIES = [
  'napi', 'ndk', 'ani', 'cangjie', 'extension',
  'platform_sdk', 'platform_sdk_indirect',
  'chipset_sdk', 'chipset_sdk_indirect',
  'sa', 'hdi', 'hdi_proxy', 'hdi_stub', 'anco', 'other',
]

const MACHINES = { 40: 'ARM', 183: 'AArch64', 247: 'RISC-V' }

function neededCount(row) {
  try {
    const v = JSON.parse(row.needed || '[]')
    return Array.isArray(v) ? v.length : 0
  } catch { return 0 }
}

function categories(row) {
  try {
    const value = JSON.parse(row.category || '[]')
    return Array.isArray(value) ? value : []
  } catch {
    return []
  }
}

export const COLUMNS = [
  { key: 'dest', label: '安装路径', group: '文件', type: 'path', min: 310, fixed: true,
    show: true, primary: true, full: 64,
    meaning: 'ELF 文件最终落在镜像里的路径，相对镜像根目录。',
    reading: '通过 `install_target_id` JOIN `install_targets.dest` 重建；ELF 是安装产物的子集。' },
  { key: 'file_name', label: '文件名', group: '文件', type: 'text', width: 190, show: true,
    meaning: '安装路径的最后一段。',
    reading: '单独成列，便于按崩溃日志里的 so 名排序和搜索。' },
  { key: 'partition', label: '分区', group: '文件', type: 'badge', width: 112, show: true,
    badgeClass: () => 'b-module',
    meaning: '文件所在的镜像分区。',
    reading: 'system 与 vendor 参与同名库命中；ramdisk、updater 是独立副本。' },

  { key: 'api_type', label: 'API 类型', group: 'API', type: 'badge', width: 132, show: true,
    badgeClass: () => 'b-module',
    meaning: '该 ELF 面向消费者的 API 层级。',
    reading: '采集端按 public category → `innerapis.install_module_id` → 其余的顺序判定；viewer 只展示落库结果。' },
  { key: 'category', label: 'Category', group: 'API', type: 'tags', min: 250, show: true,
    value: categories,
    meaning: '采集端判定的多值分类标签，按规范顺序保存。',
    reading: '一个 ELF 可同时命中多个标签；`other` 只在没有任何命中时出现。' },

  { key: 'soname', label: 'SONAME', group: 'ELF 事实', type: 'text', min: 210,
    value: r => r.soname || '未声明',
    meaning: 'ELF 动态段里的 `DT_SONAME`，即其它文件链接它时使用的逻辑名。',
    reading: '未声明 `DT_SONAME` 时显示“未声明”；它可能与文件名不同。' },
  { key: 'format', label: '字长', group: 'ELF 事实', type: 'badge', width: 112,
    badgeClass: () => 'b-module',
    meaning: 'ELF 文件的字节序和 32/64 位格式。',
    reading: '例如 ELF32LE、ELF64LE；64 位文件在 32 位产品中是例外。' },
  { key: 'machine', label: '架构', group: 'ELF 事实', type: 'text', width: 120,
    value: r => MACHINES[r.machine] || (r.machine == null ? '' : `machine ${r.machine}`),
    meaning: 'ELF 头声明的指令集架构。',
    reading: 'viewer 将常见数值翻译为 ARM / AArch64 / RISC-V，译文不写回数据库。' },
  { key: 'elf_type', label: 'ELF 类型', group: 'ELF 事实', type: 'text', width: 112,
    value: r => r.type,
    meaning: 'ELF 头中的文件类型：dyn / exec / rel。',
    reading: 'PIE 可执行文件也常标记为 dyn，因此不能仅凭 dyn 判断它是库。' },
  { key: 'dynamic', label: '有动态段', group: 'ELF 事实', type: 'bool3', width: 112,
    meaning: '该 ELF 是否包含动态段。',
    reading: '少数可重定位目标或特殊产物没有动态段；0 与未声明可区分。' },

  { key: 'neededCount', label: '直接依赖', group: '依赖', type: 'num', width: 110,
    align: 'right', show: true, value: neededCount,
    meaning: '该 ELF 的 `DT_NEEDED` 条目数量。',
    reading: 'viewer 解析 `needed` JSON 数组得到，展示的是一跳出度。' },
  { key: 'dependents', label: '被依赖', group: '依赖', type: 'num', width: 110,
    align: 'right', show: true,
    meaning: '有多少个 ELF 的 `DT_NEEDED` 直接指向它。',
    reading: '由依赖边按 `callee_id` 聚合；基础运行时的入度可能非常高。' },

  { key: 'component', label: '归属部件', group: '归属', type: 'text', min: 180, show: true,
    link: r => (r.component_id ? { entity: 'components', id: r.component_id } : null),
    meaning: '构建并安装该 ELF 的部件。',
    reading: '通过安装模块归属到部件；点列内链接可打开部件档案。' },
  { key: 'subsystem', label: '子系统', group: '归属', type: 'text', width: 150,
    meaning: '部件所属的子系统。',
    reading: '来自部件索引，用于观察 ELF 依赖跨越子系统的情况。' },
  { key: 'label', label: '安装模块', group: '归属', type: 'label', min: 260,
    link: r => (r.install_module_id ? { entity: 'install_modules', id: r.install_module_id } : null),
    meaning: '装出该 ELF 的 GN target。',
    reading: '点列内链接可查看安装模块及其它安装产物。' },
]

export const DEPENDENCY_COLUMNS = [
  { key: 'caller_id', label: '调用方 ID', group: '依赖', type: 'num' },
  { key: 'needed_ordinal', label: '序号', group: '依赖', type: 'num' },
  { key: 'needed_name', label: 'DT_NEEDED 名称', group: '依赖', type: 'text' },
  { key: 'callee_id', label: '被调方 ID', group: '依赖', type: 'num3' },
  { key: 'callee_dest', label: '命中路径', group: '依赖', type: 'path' },
]
