/* 3.1 安装产物（install_targets 5804 行，并上 install_modules 的信息）。

   一行 = 一个装进镜像的**条目**：普通文件、软链接、或一次整目录安装。
   软链接来自 SMI 的 symlink_file（776 条）——它们在镜像里真实存在，
   以前完全不在库里，按路径反查一条都查不到。

   模块与条目是 1:N：5501 个模块放出 6579 个条目，
   由「同模块条目」列与展开行体现，不另做一个模块列表。

   写法见 model/fields.js 顶部。 */
export const GROUPS = ['文件', '安装模块', '归属']

export const COLUMNS = [
  { key: 'dest', label: '安装路径', group: '文件', type: 'text', min: 300,
    fixed: true, show: true, primary: true, full: 64,
    meaning: '这个文件最终落在镜像里的位置，相对分区根目录。',
    reading: '最长的一条 108 字符，超出部分点开看全文。'
           + '两个模块装到同一路径会记 `INSTALL_DEST_AMBIGUOUS`（本次 8 条）。' },
  { key: 'file_name', label: '文件名', group: '文件', type: 'text', min: 200, show: true,
    meaning: '安装路径的最后一段。',
    reading: '单独成列是为了能按文件名排序与搜索——按全路径排会被目录名主导。' },
  { key: 'partition', label: '分区', group: '文件', type: 'badge', width: 120, show: true,
    badgeClass: () => 'b-module',
    meaning: '文件落在哪个分区：system / vendor / updater / ramdisk …',
    reading: '取安装路径的第一段。本次 system 5020、updater 425、vendor 335。' },
  { key: 'directory', label: '整目录安装', group: '文件', type: 'bool3', width: 124,
    meaning: '这一条装的是单个文件，还是把整个目录拷过去。',
    reading: '**三态**：是 / 否 / 未声明。整目录安装只有少数几条，'
           + '但它们在按路径反查时要特殊处理（最长前缀匹配）。' },
  { key: 'entry', label: '类型', group: '文件', type: 'badge', width: 108, show: true,
    value: r => (r.link_target_path ? '软链接' : r.directory ? '整目录' : '文件'),
    badgeClass: r => (r.link_target_path ? 'b-repo' : 'b-module'),
    meaning: '这个条目在镜像里是一个文件、一个软链接，还是一次整目录安装。',
    reading: '**由 `link_target_path` 是否为空推导，不是单独一列**——'
           + '"是不是软链接"这件事观测一次就够了。软链接来自 SMI 的 `symlink_file`'
           + '（本模块在这些位置建链接）或 `symlink_path`（dest 本身就是个链接）。' },
  { key: 'size', label: '大小', group: '文件', type: 'bytes', width: 118, align: 'right',
    show: true,
    meaning: '这个条目在镜像里自己占的字节数。',
    reading: '扫描时对包内文件取 `lstat`，**不跟随软链接**——链接的目标往往自己也被'
           + '单独安装，跟随会把同一份字节算两遍。整目录安装取目录下的合计。'
           + '**这是对产物的观测，不是声明**，所以它有列但不进 `record`。'
           + '为空表示包里没有这个文件（质量页记 TARGET_MISSING）。' },
  { key: 'link_target_path', label: '软链接指向', group: '文件', type: 'text', min: 220,
    meaning: '这个条目是软链接时，链接目标的全路径（与 dest 同格式）；不是软链接则为空。',
    reading: '由 `readlink` 结果解析为全路径（去掉 ../ 和 bare name 相对性）。'
           + '可通过 `link_target_id` 直接关联到目标行。'
           + '注意链接本身只占几十字节，真正的体积记在它指向的那个安装产物上。' },
  { key: 'depth', label: '路径层级', group: '文件', type: 'num', width: 110, align: 'right',
    meaning: '安装路径有几层目录。',
    reading: '由路径算出，不是库里的列。镜像树最深 6 层。' },

  { key: 'label', label: '安装模块', group: '安装模块', type: 'label', min: 300, show: true,
    full: 64, link: r => (r.module_id ? { path: `/e/install_modules/${r.module_id}` } : null),
    meaning: '装出这个文件的 GN target（label）。',
    reading: '**归属判定的根据**——label 指向产物真实所在的目录，比 part_name 声明可信。'
           + '最长 159 字符。' },
  { key: 'siblings', label: '同模块条目', group: '安装模块', type: 'num', width: 124,
    align: 'right', show: true,
    meaning: '这个模块一共往镜像里放了几个条目。**1 表示一对一，>1 就是 1:N**。',
    reading: '**文件和软链接一起算**——收录 symlink_file 之后，一个模块可能装 1 个'
           + '文件再建 8 个链接，这里显示 9。想只看文件就按「类型」筛。' },
  { key: 'module_type', label: '模块类型', group: '安装模块', type: 'text', width: 140,
    meaning: '构建系统给这个目标的类型（动态库 / 可执行 / 资源 …）。',
    reading: '原样取自 system_module_info.json 的 `type`。' },
  { key: 'source', label: '构建产物', group: '安装模块', type: 'text', min: 240, full: 60,
    meaning: '安装前这个文件在 out 目录下的位置。',
    reading: '即"从哪拷到哪"里的"从哪"。' },
  { key: 'install_enable', label: '参与安装', group: '安装模块', type: 'bool3', width: 118,
    meaning: '这个模块是否真的装进镜像。',
    reading: '**三态**：是 / 否 / 未声明。' },
  { key: 'ordinal', label: '清单序号', group: '安装模块', type: 'num', width: 118, align: 'right',
    meaning: '它在 system_module_info.json 里的位置。',
    reading: '定位用：照它去原始清单里找这一条。' },

  { key: 'component', label: '归属部件', group: '归属', type: 'text', min: 190, show: true,
    link: r => (r.component_id ? { path: `/e/components/${r.component_id}` } : null),
    meaning: '这个文件属于哪个部件。统计部件体积、排查"谁装了这个文件"都看它。',
    reading: '由模块的 label 推导。推不出的会记 `MODULE_COMPONENT_UNRESOLVED` 等。' },
  { key: 'repo', label: '代码仓', group: '归属', type: 'text', min: 160, show: true,
    link: r => (r.repo_id ? { path: `/e/repos/${r.repo_id}` } : null),
    meaning: '归属部件所在的代码仓。',
    reading: '按 component.repo_id 关联。' },
  { key: 'subsystem', label: '子系统', group: '归属', type: 'text', width: 160,
    meaning: '部件所属子系统。',
    reading: '取自构建索引。system_module_info.json 自带的那份不一致时不采纳，'
           + '只记 `MODULE_SUBSYSTEM_DIFFERS`（本次 35 条）。' },
]
