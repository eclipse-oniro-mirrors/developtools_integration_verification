/* 1.3 HDI服务（hdis，57 行）。写法见 model/fields.js 顶部。 */
export const GROUPS = ['身份', '加载', '归属']

export const COLUMNS = [
  { key: 'service_name', label: '设备服务名', group: '身份', type: 'text', min: 210,
    fixed: true, show: true, primary: true,
    meaning: 'HDI 设备对外暴露的服务名，上层按它获取设备接口。',
    reading: '取自 HCB 里设备节点的 `serviceName`。' },
  { key: 'module_name', label: '驱动模块', group: '身份', type: 'text', min: 210, show: true,
    meaning: '实现这个设备的驱动模块名，通常就是 .so 的文件名。',
    reading: '取自 `moduleName`。' },
  { key: 'library', label: '驱动库路径', group: '身份', type: 'text', min: 220,
    meaning: '驱动 .so 在镜像里的安装路径。',
    reading: '归属判定靠它反查安装模块。查不到会在质量页记 `LIBRARY_UNMATCHED`——'
           + '本次扫描有 11 条。' },
  { key: 'node', label: 'HCB 节点', group: '身份', type: 'text', min: 200,
    meaning: '这个设备在 HCB 配置树里的节点路径。',
    reading: '定位用：出问题时照它去 HCB 里找这段声明。' },

  { key: 'host', label: '宿主进程', group: '加载', type: 'text', width: 170, show: true,
    link: r => (r.service_id ? { path: `/runtime/unit/${r.service_id}` } : null),
    meaning: '这个驱动跑在哪个 hdf_devhost 进程里。同一宿主里的驱动共享崩溃域。',
    reading: '**经 service_id 关联 services 取**，不是 hdis 表上的列：'
           + '扫描器已经去掉了 `process` 列，宿主进程名写在宿主服务的 `-n` 参数里。' },
  { key: 'preload', label: '加载时机', group: '加载', type: 'num3', width: 118, align: 'right',
    meaning: 'HDF 的 preload 策略：决定这个驱动是开机就加载、按需加载还是不加载。',
    reading: '原样取自 `preload`。**三态**：有值 / 显式 0 / 未声明。'
           + '具体数值的含义以 HDF 文档为准，扫描器不做解释。' },
  { key: 'priority', label: '优先级', group: '加载', type: 'num3', width: 104, align: 'right',
    meaning: '同一宿主内驱动的加载顺序，数值小的先加载。',
    reading: '取自 `priority`。**三态**。' },
  { key: 'policy', label: '服务策略', group: '加载', type: 'num3', width: 110, align: 'right',
    meaning: 'HDF 的 policy：这个设备以什么形式对外提供服务（不发布 / 内核态 / 用户态…）。',
    reading: '原样取自 `policy`，数值含义以 HDF 文档为准。**三态**。' },
  { key: 'permission', label: '权限位', group: '加载', type: 'num3', width: 104, align: 'right',
    meaning: '设备节点的访问权限。',
    reading: '原样取自 `permission`。**三态**。' },

  { key: 'component', label: '归属部件', group: '归属', type: 'text', min: 180, show: true,
    link: r => (r.component_id ? { path: `/e/components/${r.component_id}` } : null),
    meaning: '这个驱动属于哪个部件。',
    reading: '由 library 反查安装模块、再到部件。11 条因为 library 匹配不上而留空。' },
  { key: 'repo', label: '代码仓', group: '归属', type: 'text', width: 160, show: true,
    link: r => (r.repo_id ? { path: `/e/repos/${r.repo_id}` } : null),
    meaning: '归属部件所在的代码仓。',
    reading: '按 component.repo_id 关联。' },
  { key: 'subsystem', label: '子系统', group: '归属', type: 'text', width: 150,
    meaning: '部件所属子系统。', reading: '取自构建索引。' },
  { key: 'install_label', label: '安装模块', group: '归属', type: 'label', min: 230,
    meaning: '装出驱动 .so 的 GN target。', reading: '归属判定的依据。' },
]
