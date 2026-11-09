/* 声明文件（arkts_sources，1,567 行）。

   这张表回答：磁盘上有哪些 SDK 声明文件、每份读得怎么样、它声明了什么。
   "模块"是另一张表——一个模块可以有两份声明文件（动态 1.1 + 静态 1.2），
   这正是分两张表的原因。

   采集过程用到的参考数据（napi-map.json）不入库，它不是 sdk-js 仓里的文件。 */
export const GROUPS = ['文件', '语言与条件', '读取结果', '声明的实体']

export const COLUMNS = [
  { key: 'source_path', label: '文件路径', group: '文件', type: 'text', min: 420,
    fixed: true, show: true, primary: true, full: 64,
    meaning: '这份文件在源码树里的位置，相对工程根目录。',
    reading: '注意与"模块"那一列的坐标系不同：模块键相对 SDK 根（import 语句在那个坐标系里解析），'
           + '这里相对工程根，才能定位到仓里的文件。' },
  { key: 'source_url', label: '源码', group: '文件', type: 'text', width: 90, show: true,
    value: r => (r.source_url ? '查看 ↗' : ''),
    href: r => r.source_url || null,
    meaning: '在代码仓里打开这份文件。',
    reading: 'blue 区用扫描当时的提交号拼 blob 链接；yellow 区 codehub 开源镜像用分支名拼 '
           + 'files 链接。内容未与扫描快照逐字节比对。' },
  { key: 'byte_size', label: '大小', group: '文件', type: 'bytes', width: 100, align: 'right',
    meaning: '这份文件实际读到了多少字节。',
    reading: '是**实际读取量**，不是 lstat 报的文件大小——读取被单文件预算截断时两者会不同，'
           + '所以单独记一个观测值。全库 1,567 份无一为空，合计 43.7 MB，'
           + '最大一份 1,116,502 字节。' },

  { key: 'declaration_format', label: '后缀', group: '语言与条件', type: 'enum', width: 120, show: true,
    meaning: '文件名末尾那一段，不含任何解释。',
    reading: 'd.ts / d.ets / static.d.ets。它决定下一列的"语言版本"。' },
  { key: 'language_variant', label: '语言版本', group: '语言与条件', type: 'enum', width: 110, show: true,
    meaning: '后缀对应的 ArkTS 语言版本：.static.d.ets 是 1.2，其余是 1.1。',
    reading: '**每份文件只有一个值**，不会"两个都是"。'
           + '"两个版本都有"是模块的属性（模块列表的"语言版本"列会显示 both），'
           + '那种模块有两份声明文件，每份自己仍然只属于一个版本。' },
  { key: 'file_condition', label: '适用模式', group: '语言与条件', type: 'enum', width: 120,
    meaning: '文件**内容**声明它适用于哪种模式——与后缀无关。',
    reading: '规则只有一条：文件头里找到条件标记（.static. 后缀或 \'use static\' 指令）就是 static，'
           + '否则 unspecified。所以一份普通 .d.ts 写上 \'use static\' 也会是 static。'
           + 'unspecified 不等于"两种模式都支持"，只是没有显式声明。' },
  { key: 'condition_evidence', label: '判定依据', group: '语言与条件', type: 'text', min: 260, full: 48,
    meaning: '上一列凭什么这么判：找到了哪些标记、在第几个字节。',
    reading: 'static_suffix 的位置是 null（依据是文件名，不是文件里的某段字节）；'
           + 'use_static 带指令本身的跨度，跨度不同是因为 BOM 和前导空白不同。'
           + '本产品 302 份文件显式写了 \'use static\'。' },

  { key: 'read_status', label: '读取', group: '读取结果', type: 'enum', width: 120, show: true,
    meaning: '这份文件本身读到了吗。',
    reading: 'ok / unreadable / encoding_failed / limit_exceeded / path_invalid。'
           + '读失败的文件仍然保留行，不会从清单里消失——否则"没读到"会被当成"不存在"。' },
  { key: 'header_status', label: '文件头', group: '读取结果', type: 'enum', width: 120, show: true,
    meaning: '文件头（版权注释 + JSDoc）解释得怎么样。',
    reading: 'ok=读完且有确认的 @kit 归属；no_tag=读完了，这份文件确实没写 @kit；'
           + 'partial=只有孤立标签或头部结构有问题；failed=没读成。'
           + '**no_tag 与 failed 是两件事**：前者是源码事实，后者是采集失败。' },
  { key: 'coverage', label: '提取能力状态', group: '读取结果', type: 'text', min: 300, full: 48,
    meaning: '四个提取能力各自在这份文件上跑成什么样。',
    reading: 'file.header=文件头；kit.references=顶层 import/export；condition.top_level=条件注释；'
           + 'source.utf8_spans=字节位置换算。模块声明不请求后两项，所以是 not_requested——'
           + '那是"没分析正文"，不是"分析过且没有引用"。' },
  { key: 'header_span', label: '文件头跨度', group: '读取结果', type: 'text', width: 130,
    meaning: '文件头在文件里的字节范围 [起, 止)。',
    reading: '文件头原文不入库——1,517 份去重后只有 1,241 种、整段是 Apache 许可证样板，'
           + '承载归属的 @kit 标签已作为关系原文保留。要看原文按这个范围回源码切片。' },

  { key: 'role', label: '这是什么文件', group: '声明的实体', type: 'enum', width: 130, show: true,
    meaning: 'module=它声明一个模块；kit_entry=它是 kits/ 目录下的 Kit 入口。',
    reading: '1,517 份模块声明 + 50 份 Kit 入口。文件名不是合法 @kit.<Name> 的入口，'
           + '"所属 Kit"会为空，只有这一列能说明它仍是个 Kit 入口。' },
  { key: 'module_key', label: '所属模块', group: '声明的实体', type: 'text', min: 280, show: true,
    link: r => (r.module_id ? { path: `/e/arkts_modules/${r.module_id}` } : null),
    meaning: '这份文件声明的模块。',
    reading: '只有 role=module 的 1,517 份有值；Kit 入口这一列为空。' },
  { key: 'kit_key', label: '所属 Kit', group: '声明的实体', type: 'text', min: 220, show: true,
    link: r => (r.kit_id ? { path: `/e/arkts_kits/${r.kit_id}` } : null),
    meaning: '这份文件开启的 Kit。',
    reading: '**只有 50 份 Kit 入口有值，其余 1,517 份模块声明本来就是空的**——'
           + '按文件路径排序时 kits/ 排在最后，所以首页看起来整列都空。'
           + '用上方「这是什么文件」筛 Kit 入口即可看到。' },
]
