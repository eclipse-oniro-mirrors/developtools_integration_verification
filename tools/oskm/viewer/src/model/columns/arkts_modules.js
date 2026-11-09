/* SDK 模块（arkts_modules，1,319 行）。

   **模块不等于文件**：一个模块可以有两份声明文件——X.d.ts 是 ArkTS 1.1，
   X.static.d.ets 是 1.2。1,567 份文件归并成 1,319 个模块，其中 198 个有两份。
   凡是"按文件"的事实（读取状态、文件头）都不在这张表，在「声明文件」视图里。 */
export const GROUPS = ['身份', '实现', '语言', '关联']

export const COLUMNS = [
  { key: 'module_key', label: '模块', group: '身份', type: 'text', min: 320,
    fixed: true, show: true, primary: true, full: 64,
    meaning: '模块的身份：SDK 相对路径，去掉语言后缀。',
    reading: 'api/@ohos.arkui.UIContext 对应磁盘上的 .d.ts 与 .static.d.ets 两份声明。'
           + '去后缀正是为了让这两份算一个模块——否则 import 它时会出现"两个候选"。' },
  { key: 'module_name', label: '可 import 名', group: '身份', type: 'text', min: 240, show: true,
    meaning: '能直接写进 import 语句的那个名字。',
    reading: '1,319 个模块里只有 643 个有。空着的 676 个是 @internal 组件、api/ 子目录的辅助声明'
           + '和 arkts/builtin——它们只能按相对路径引用，**空不是采集遗漏**。' },
  { key: 'declaration_scope', label: '声明位置', group: '身份', type: 'enum', width: 150, show: true,
    meaning: '这个模块的声明放在 SDK 的哪个目录区域。纯路径事实，永远能判定。',
    reading: 'api_named=api/ 顶层具名(640)；api_auxiliary=api/ 子目录(426)；'
           + 'internal_component/internal_ets=@internal 下的 ArkUI 声明(143)；'
           + 'arkts_named(4)/arkts_builtin(106)=arkts/ 下。'
           + '**它不告诉你怎么实现**——同一个目录里 NAPI 和 ArkUI 是混着的。' },

  { key: 'implementation_kind', label: '实现方式', group: '实现', type: 'enum', width: 140, show: true,
    meaning: '这个模块由什么实现。按证据判定，可能未知。',
    reading: 'napi(525)=映射表指明了实现它的 .so；arkui(407)=由 ArkUI 引擎实现；'
           + 'arkts_builtin(106)/arkts_language(1)=语言运行时自带；'
           + 'type_only(172)=纯类型声明，本就不需要实现；unknown(108)=有模块名但没有任何实现证据。'
           + '和"声明位置"分成两列，是因为 api_named 下同时有 505 个 napi、26 个 arkui 和 108 个 unknown。' },
  { key: 'installed_at', label: '实现 .so', group: '实现', type: 'text', min: 300, show: true, full: 64,
    link: r => (r.impl_elf_id ? { path: `/e/elf_modules/${r.impl_elf_id}` } : null),
    meaning: '实现它的动态库在本产品镜像中的实际位置。点进去看 ELF 详情。',
    reading: '**空着有四种不同含义**，看「实现方式」列区分：unknown=不知道由谁实现；'
           + 'type_only=本来就不需要实现；有"声明路径"却没有这一列=声明的路径不在本镜像里；'
           + '都不是"查询失败"。' },
  { key: 'impl_so_path', label: '声明路径', group: '实现', type: 'text', min: 300, full: 64,
    meaning: '参考数据里写的镜像路径，逐字保留不改写。',
    reading: '映射表按 64 位镜像写（system/lib64/…），32 位产品实际装在 system/lib/ 下。'
           + '本产品 932 条全部要靠这个别名才对得上——两列并排正是为了让这个差异看得见。' },
  { key: 'component', label: '实现部件', group: '实现', type: 'text', min: 180, show: true,
    link: r => (r.component_id ? { path: `/e/components/${r.component_id}` } : null),
    meaning: '实现它的 .so 由哪个部件构建出来。SDK 接口与产品部件就在这里接上。',
    reading: '经 impl_elf_id → elf_modules.component_id 得到，不是另算的。'
           + '932 个有实现的模块全部落到部件上，共涉及 113 个部件——'
           + 'ace_engine 一家占 473 个（ArkUI 全在它里面），其次 ability_runtime 84、ets_utils 28。'
           + '**这一列是整条链路的落点**：从一个 SDK 接口能一直走到构建它的仓。' },
  { key: 'impl_napi_name', label: '运行时名', group: '实现', type: 'text', min: 200,
    meaning: 'NAPI 注册这个模块时用的名字。',
    reading: '多数等于模块名去掉 @ohos.，但有 19 例不是（如 @ohos.util.stream 注册成 stream），'
           + '所以单独存一列而不是现推。arkui 实现的模块没有这个名字。' },
  { key: 'impl_match', label: '匹配方式', group: '实现', type: 'enum', width: 140,
    meaning: '运行时注册名是怎么对上 SDK 模块的。强度从高到低。',
    reading: 'module_name(501)/declaration_path(17) 是精确匹配；'
           + 'name_suffix(7) 是兜底——运行时名只与某个模块名的后缀唯一匹配，证据弱一些，'
           + '看到它要留个心眼。' },

  { key: 'language_coverage', label: '语言版本', group: '语言', type: 'enum', width: 120, show: true,
    meaning: '这个模块被哪些 ArkTS 语言版本声明。',
    reading: 'dynamic(908)=只有 1.1；static(213)=只有 1.2；**both(198)=两份声明都有**。'
           + 'both 是模块才有的属性——单份文件永远只属于一个版本。' },

  { key: 'files', label: '声明文件', group: '关联', type: 'num', width: 100, align: 'right', show: true,
    meaning: '这个模块有几份声明文件。',
    reading: '1 或 2。为 2 就是动/静双声明，点进详情能看到两份各自的路径。' },
  { key: 'kits', label: '归属 Kit', group: '关联', type: 'num', width: 100, align: 'right', show: true,
    meaning: '文件头 @kit 声明了几个 Kit 归属（去重）。',
    reading: '0 不代表没有 Kit 用它——"被 Kit 入口 import"是另一种关系，'
           + '在模块详情的证据区里。' },
]
