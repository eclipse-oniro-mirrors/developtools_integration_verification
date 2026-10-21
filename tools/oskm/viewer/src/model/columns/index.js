/* 按表名取列目录。档案页靠它把原始列名换成人话、并带出 ⓘ 说明——
   列表里已经写过一遍的东西，详情里不该退回 `dest_index` 这种字段名。

   没有登记的表（install_modules / innerapis / syscaps / …）回退到原始列名，
   档案页照样能打开，只是没有解释。 */
import { COLUMNS as services, GROUPS as gServices } from './services.js'
import { COLUMNS as sas, GROUPS as gSas } from './sas.js'
import { COLUMNS as hdis, GROUPS as gHdis } from './hdis.js'
import { COLUMNS as repos, GROUPS as gRepos } from './repos.js'
import { COLUMNS as components, GROUPS as gComponents } from './components.js'
import { COLUMNS as targets, GROUPS as gTargets } from './targets.js'
import { COLUMNS as elf, GROUPS as gElf,
         DEPENDENCY_COLUMNS as elfEdges } from './elf.js'

const BY_TABLE = {
  services, sas, hdis, repos, components, install_targets: targets,
  elf_modules: elf, elf_module_dependencies: elfEdges,
  /* 安装模块没有自己的列表视图，但它的字段在安装产物的目录里写过了 */
  install_modules: targets,
}
const GROUPS_BY_TABLE = {
  services: gServices, sas: gSas, hdis: gHdis, repos: gRepos,
  components: gComponents, install_targets: gTargets, install_modules: gTargets,
  elf_modules: gElf,
}

/** 该表的字段分组顺序。档案页按它给属性区分段——
 *  列目录里本来就分好了（身份 / 依赖 / 产出 …），
 *  档案页原先按 PRAGMA 的物理列序排，等于把这份分组浪费掉了。 */
export const groupsOf = table => GROUPS_BY_TABLE[table] || []

const cache = new Map()
export function catalogOf(table) {
  if (!cache.has(table)) {
    const list = BY_TABLE[table] || []
    cache.set(table, Object.fromEntries(list.map(c => [c.key, c])))
  }
  return cache.get(table)
}

/* 列表目录用的是驼峰键（host / argsText / installLabel…），库里是下划线。
   档案页按库里的列名查，所以要兜一层别名。 */
const GLOBAL_ALIAS = {
  install_module_id: 'installLabel', start_mode: 'startMode', args: 'argsText',
  module_id: 'label', label_name: 'label', type: 'kind',
}
const TABLE_ALIAS = {
  elf_modules: { type: 'elf_type', needed: 'neededCount' },
}

/* 库里有、但列表里不展示的列。没有这一层它们会在档案页里退回原始列名。 */
const EXTRA = {
  '*': {
    position: { label: '声明序号',
      meaning: '这条记录在它所属源文件里的出现次序，从 0 开始。',
      reading: '扫描器用它做主键，也是回到原文件定位这一条的最快办法。' },
  },
  services: {
    name: { label: '服务名',
      meaning: 'init 配置里声明的服务名。HDF 驱动宿主的**进程名**另写在 `-n` 参数里，与它不是一回事。',
      reading: '原样取自 .cfg 的 name 字段；缺失会记 FIELD_MISSING。' },
  },
  components: {
    /* 这三个是 bundle.json 的**原始声明**（JSON 数组/对象）。
       列目录里同名的 features / syscaps 描述的是**关联行的计数**（列表视图那一列），
       两者名字撞了但不是一回事——所以 EXTRA 要盖过列目录，见下面的查找顺序。 */
    deps: { label: '依赖声明', group: '依赖',
      meaning: 'bundle.json 里声明的依赖，`components` 是部件依赖、`third_party` 是三方库。',
      reading: '逐字保留。指向本产品不存在的部件会记 COMPONENT_DEP_UNRESOLVED（本次 43 条）。' },
    features: { label: 'feature 声明', group: '产出',
      meaning: '这个部件对外暴露的可配置特性名。',
      reading: '原始数组。同名被两处声明会记 FEATURE_DUPLICATE。' },
    syscap: { label: 'syscap 声明', group: '产出',
      meaning: '这个部件声明提供的 SysCap 名。',
      reading: '原始数组。同名被两处声明会记 SYSCAP_DUPLICATE（本次 2 条）。' },
  },
  install_targets: {
    dest_index: { label: '目标序号',
      meaning: '同一个安装模块装出多个文件时，这是其中第几个。',
      reading: '95% 的模块只装 1 个文件，所以多数是 0。' },
  },
  install_modules: {
    ordinal: { label: '清单序号',
      meaning: '它在 system_module_info.json 里的位置。',
      reading: '定位用：照它去原始清单里找这一条。' },
  },
}

/* 查找顺序：**本表的 EXTRA 优先于列目录**。
   因为列目录描述的是列表视图里那一列（常常是关联行的计数），
   而档案页要描述的是库里那一列本身——components 的 features 就是这么撞上的。 */
export function columnMeta(table, key) {
  const cat = catalogOf(table)
  return EXTRA[table]?.[key] || cat[key]
         || cat[TABLE_ALIAS[table]?.[key]] || cat[GLOBAL_ALIAS[key]]
         || EXTRA['*'][key] || null
}
