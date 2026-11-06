/* 1.2 SA服务（sas，165 行）。写法见 model/fields.js 顶部。 */
export const GROUPS = ['身份', '运行', '归属']

export const COLUMNS = [
  { key: 'sa_id', label: 'SA 号', group: '身份', type: 'num', width: 110, align: 'right',
    fixed: true, show: true, primary: true,
    meaning: 'SystemAbility 的全局唯一编号。进程间调用按这个号找服务，不是按名字。',
    reading: '取自 SA profile 里 systemability 元素的 `name` 字段——那里写的就是号。' },
  { key: 'libpath', label: '实现库', group: '身份', type: 'text', min: 220, show: true,
    meaning: '这个 SA 的实现动态库，由宿主进程 dlopen 加载。',
    reading: '归属判定就是靠它反查安装模块的——查不到会在质量页记一条。' },
  { key: 'profile', label: 'SA 配置', group: '身份', type: 'path', min: 220,
    meaning: '声明这个 SA 的 .json profile 文件。',
    reading: '一个 profile 通常声明一个进程里的多个 SA。' },

  { key: 'host', label: '宿主进程', group: '运行', type: 'text', width: 170, show: true,
    link: r => (r.service_id ? { path: `/runtime/unit/${r.service_id}` } : null),
    meaning: '这个 SA 跑在哪个进程里。多个 SA 共用一个宿主是常态——'
           + '`foundation` 一个进程里就有 16 个。',
    reading: '**经 service_id 关联 services 取**，不是 sas 表上的列：'
           + '扫描器已经把 `process` 列去掉了，宿主是关联出来的事实。' },
  { key: 'run_on_create', label: '随进程启动', group: '运行', type: 'bool3', width: 124, show: true,
    meaning: '宿主进程一起来就加载，还是等到第一次被调用时才加载。影响开机耗时。',
    reading: '对应 profile 里的 `run-on-create`。**三态**：是 / 否 / 未声明。' },
  { key: 'distributed', label: '分布式', group: '运行', type: 'bool3', width: 100,
    meaning: '是否对外提供跨设备调用能力。',
    reading: '对应 `distributed`。**三态**。' },
  { key: 'auto_restart', label: '自动重启', group: '运行', type: 'bool3', width: 110,
    meaning: '崩溃后是否由框架自动拉起。',
    reading: '对应 `auto-restart`。**三态**。' },
  { key: 'dump_level', label: 'dump 级别', group: '运行', type: 'num3', width: 118, align: 'right',
    meaning: 'hidumper 抓取这个 SA 信息时的详细程度。',
    reading: '对应 `dump_level`。**三态**：有值 / 显式 0 / 未声明。' },

  { key: 'component', label: '归属部件', group: '归属', type: 'text', min: 180, show: true,
    link: r => (r.component_id ? { path: `/e/components/${r.component_id}` } : null),
    meaning: '这个 SA 属于哪个部件。',
    reading: '由 libpath 反查安装模块、再到部件。查不到则留空。' },
  { key: 'repo', label: '代码仓', group: '归属', type: 'text', width: 160, show: true,
    link: r => (r.repo_id ? { path: `/e/repos/${r.repo_id}` } : null),
    meaning: '归属部件所在的代码仓。',
    reading: '按 component.repo_id 关联。' },
  { key: 'subsystem', label: '子系统', group: '归属', type: 'text', width: 150,
    meaning: '部件所属子系统。',
    reading: '取自构建索引，不是 bundle.json。' },
  { key: 'install_label', label: '安装模块', group: '归属', type: 'label', min: 230,
    meaning: '装出 libpath 这个库的 GN target。',
    reading: '归属判定的依据。注意不是 profile 的安装者——'
           + 'profile 由一个无 label 的 sa_info 聚合装出，按 label 永远找不到。' },
]
