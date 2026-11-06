/* 1.1 系统服务（services，164 行）的列目录。写法见 model/fields.js 顶部。 */
import { KINDS } from '../runtime.js'

const KIND_LABEL = Object.fromEntries(Object.entries(KINDS).map(([k, v]) => [k, v.label]))

export const GROUPS = ['身份', '归属', '装载', '运行身份与安全']

/* type   'text' | 'num' | 'num3' | 'bool' | 'bool3' | 'list' | 'path' | 'badge'
          bool3/num3 = 三态：有值 / 显式 0 / 未声明。0 与未声明是两个不同的事实，
          不能都渲染成空白。
   width  定宽；min 则是弹性列——至少要有一列用 min，否则窗口宽时右边留一条空白。 */
export const COLUMNS = [
  {
    key: 'host', label: '进程名', group: '身份', type: 'text', min: 190,
    fixed: true, show: true, primary: true,
    meaning: 'init 拉起的进程。普通服务就是服务名；HDF 驱动宿主的真实进程名写在 ' +
             '启动参数 `-n <host>` 里，与服务名不是一回事。',
    reading: '一条 services 声明即一个运行单元——库里没有"进程"表，' +
             '但 sas / hdis 都以 services.id 为外键，所以服务声明就是进程。',
  },
  {
    key: 'kind', label: '类型', group: '身份', type: 'badge', width: 110, show: true,
    value: r => KIND_LABEL[r.kind] ?? r.kind, badgeClass: r => `b-${r.kind}`,
    value: r => KIND_LABEL[r.kind] ?? r.kind, badgeClass: r => `b-${r.kind}`,
    meaning: 'init 服务类型 `type`：`sa` 是 SystemAbility 宿主，由 sa_main 拉起一组 SA；' +
             '`hdf` 是 HDF 驱动宿主；`default` 是普通守护进程。',
    reading: '由 services.type 映射：sa→SA 宿主，hdf→驱动宿主，default→守护进程，' +
             '其余→未分类。',
  },
  {
    key: 'cfg', label: '启动配置', group: '身份', type: 'path', min: 240, show: true,
    meaning: '声明这个服务的 init .cfg 文件。',
    reading: '相对产品包根目录的路径，就是扫描时读到的那个文件。',
  },
  {
    key: 'executable', label: '可执行文件', group: '身份', type: 'text', width: 200,
    meaning: '`path` 的第一项，即真正被 exec 的二进制。',
    reading: 'SA 宿主基本都是 /system/bin/sa_main，区分进程要看启动参数而不是这一列。',
  },
  {
    key: 'argsText', label: '启动参数', group: '身份', type: 'text', min: 240,
    meaning: '`path` 里可执行文件之后的参数。',
    reading: 'HDF 宿主的 `-n <host>` 就在这里，进程名由它决定。',
  },

  {
    key: 'component', label: '归属部件', group: '归属', type: 'text', width: 180, show: true,
    link: r => (r.componentId ? { path: `/e/components/${r.componentId}` } : null),
    meaning: '这个进程属于哪个部件，决定了改动影响面与问题该派给谁。',
    reading: '由服务的安装模块反查：可执行文件路径 → install_modules → components。' +
             '查不到会留空，并在质量页记一条 ORIGIN_UNMATCHED。',
  },
  {
    key: 'repo', label: '代码仓', group: '归属', type: 'text', width: 160, show: true,
    link: r => (r.repoId ? { path: `/e/repos/${r.repoId}` } : null),
    meaning: '归属部件所在的代码仓。',
    reading: '按 component.repo_id 关联。',
  },
  {
    key: 'subsystem', label: '子系统', group: '归属', type: 'text', width: 150,
    meaning: '部件所属的子系统。',
    reading: '取自构建索引（不是 bundle.json）——两者不一致时以索引为准，' +
             '差异在质量页记为 SUBSYSTEM_DIFFERS。',
  },
  {
    key: 'installLabel', label: '安装模块', group: '归属', type: 'label', min: 220,
    meaning: '装出这个可执行文件的 GN target（label）。',
    reading: '归属判定就是从它推导的——label 指向产物真实所在的目录，比 part_name 声明可信。',
  },

  {
    key: 'contentCount', label: '装载数', group: '装载', type: 'num', width: 104,
    align: 'right', show: true,
    meaning: '这个进程里跑了多少个 SA（sa 宿主）或多少个设备（hdf 宿主）。',
    reading: '按 sas.service_id / hdis.service_id 统计。守护进程通常是 0。',
  },
  {
    key: 'partCount', label: '涉及部件', group: '装载', type: 'num', width: 118,
    align: 'right', show: true,
    meaning: '装载的内容分别来自几个部件。',
    reading: '对装载内容的归属部件去重计数。',
  },
  {
    key: 'mixed', label: '混装', group: '装载', type: 'bool', width: 100,
    trueText: r => `⚠ ${r.partCount}`,
    trueText: r => `⚠ ${r.partCount}`, show: true,
    meaning: '**一个进程里装了多个部件的内容。** 改动影响面、崩溃定位、内存归因都卡在这里——' +
             '进程崩了，不看装载清单就不知道该找哪个部件。',
    reading: '涉及部件数 > 1 即为混装。这是运行视图最想让人看见的那个结论。',
  },
  {
    key: 'issues', label: '问题', group: '装载', type: 'num', width: 96,
    align: 'right', show: true, warn: true, warn: true,
    meaning: '这份 .cfg 上有多少条扫描层问题（不含 advisory）。',
    reading: '按 issues.path 后缀匹配 cfg 统计。点进质量页可看具体是什么。',
  },

  {
    key: 'uid', label: '运行用户', group: '运行身份与安全', type: 'text', width: 150, show: true,
    meaning: '进程以哪个用户身份运行。权限边界的第一道线。',
    reading: '**存的是用户名不是数字**（root、access_token…），所以按字母序排，不是数值序。',
  },
  {
    key: 'gid', label: '用户组', group: '运行身份与安全', type: 'list', width: 160,
    meaning: '附加用户组，决定能访问哪些按组授权的资源。',
    reading: '库里是 JSON 数组存成 TEXT。列上显示个数，悬停看完整列表；排序按个数。',
  },
  {
    key: 'secon', label: 'SELinux 上下文', group: '运行身份与安全', type: 'text', width: 210,
    meaning: '形如 `u:r:<domain>:s0`，决定这个进程落在哪个 SELinux 域、' +
             '进而受哪些策略约束。',
    reading: '原样取自 .cfg 的 secon 字段。',
  },
  {
    key: 'sandbox', label: '沙箱', group: '运行身份与安全', type: 'bool3', width: 108,
    meaning: 'init 的沙箱隔离开关。关闭意味着这个进程不进独立挂载命名空间。',
    reading: '**三态**：`0` 是显式关闭，空白是根本没声明（走默认）。两者不是一回事，' +
             '所以不合并显示。',
  },
  {
    key: 'importance', label: '重要级', group: '运行身份与安全', type: 'num3', width: 112,
    align: 'right',
    meaning: '进程优先级（nice 值），越小越优先。',
    reading: '**三态**：有值 / 显式 0 / 未声明。未声明走 init 默认。',
  },
  {
    key: 'startMode', label: '启动时机', group: '运行身份与安全', type: 'text', width: 120,
    meaning: '`boot` 随 init 启动；`condition` 等条件满足后再启动。',
    reading: '对应 .cfg 里的 `start-mode`。未声明的走默认时机。',
  },
  {
    key: 'ondemand', label: '按需启动', group: '运行身份与安全', type: 'bool3', width: 110,
    meaning: '开机不拉起，等到有人访问它的 SA 或 socket 时才拉起。' +
             '影响开机耗时与常驻内存。',
    reading: '**三态**：1 / 0 / 未声明。',
  },
]

