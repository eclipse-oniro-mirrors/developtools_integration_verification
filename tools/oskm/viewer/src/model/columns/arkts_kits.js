/* Kit（arkts_kits，51 行）。

   两种 Kit 的"来源"不是一回事：
   - entry_backed(49)：kits/ 下有入口文件，能 import。
   - label_only(2)：**从没被定义过**，只是某个模块头上写了一个对不上任何入口的 @kit 标签。
   所以"入口文件"和"被提及于"分成两列，不合并成一个数字。 */
export const GROUPS = ['身份', '来源', '关联']

export const COLUMNS = [
  { key: 'kit_key', label: 'Kit', group: '身份', type: 'text', min: 300,
    fixed: true, show: true, primary: true, full: 64,
    meaning: 'Kit 的身份。@kit.<名字>，或没匹配到入口时 label:<原标签>。',
    reading: 'label: 开头的不是可导入的 Kit，是保留下来的源码分类。' },
  { key: 'name', label: '名称', group: '身份', type: 'text', min: 220, show: true,
    meaning: '去掉前缀的展示名，保留原始大小写和内部空格。',
    reading: '不做模糊匹配：带空格的 "Automatic Scene Configuration Kit" 不会被自动并到'
           + ' @kit.AutomaticSceneConfigurationKit——两侧事实分别保留。' },
  { key: 'import_name', label: '可 import 名', group: '身份', type: 'text', min: 220, show: true,
    meaning: '能写进 import 语句的名字。',
    reading: 'label_only 分组为空——它没有入口文件，没法 import。' },
  { key: 'origin', label: '来历', group: '身份', type: 'enum', width: 130, show: true,
    meaning: '这个 Kit 是怎么被发现的。entry_backed=SDK 里有入口文件；'
           + 'label_only=只在某个模块的 @kit 标签里出现过。',
    reading: 'entry_backed(49) 是扫 kits/ 目录发现的；label_only(2) 是扫模块文件头时，'
           + '遇到一个对不上任何入口的标签**临时造出来的分组**——'
           + 'API10LessDeprecatedModules 和 "Automatic Scene Configuration Kit"。'
           + '后者带空格，采集器不做模糊匹配并到 @kit.AutomaticSceneConfigurationKit，'
           + '两侧事实分别保留。' },

  { key: 'entries', label: '入口文件', group: '来源', type: 'num', width: 110, align: 'right', show: true,
    meaning: '定义这个 Kit 的入口文件数。入口里的 import 清单就是 Kit 的实际组成。',
    reading: '扫 SDK 的 kits/ 目录得到。@kit.ArkUI 有动/静两份，所以 49 个 entry_backed Kit '
           + '对应 50 份入口文件。**label_only 这一列为 0 不是漏采**——它没有入口文件，'
           + '看隔壁"被提及于"。' },
  { key: 'mentioned_in', label: '被提及于', group: '来源', type: 'num', width: 110, align: 'right', show: true,
    meaning: '只对 label_only 计算：有几份模块文件的头部提到了它。',
    reading: '从关系证据反查 source_id 得到。这类分组**没有定义文件**——它根本没被定义，'
           + '只是某个模块头上写了个对不上入口的标签，能给出的最好答案就是"它在哪里被提到过"。'
           + '有入口的 Kit 这一列**留空而不是 0**，因为对它们这个问题没有意义。' },

  { key: 'modules', label: '关联模块', group: '关联', type: 'num', width: 110, align: 'right', show: true,
    meaning: '这个 Kit 的成员模块数（去重）。两条来路的**并集**：'
           + '模块自己写的 @kit 标签，以及入口文件 import 的模块。',
    reading: '全库 1,273 对 (Kit, 模块) 关系里，609 对两边都有、662 对只有标签、2 对只被引用。'
           + '**两条来路不一致是正常的**——标签是模块的自我声明，import 是入口的实际组成，'
           + '合成一个数字就把"谁说的"抹掉了，所以点进详情页会按来路拆开。'
           + '范围 1–505（最大的是 ArkUI）。'
           + '另外：**被引用不等于该模块的全部 API 都由这个 Kit 导出**，这里只说"有引用关系"。' },
  { key: 'unresolved', label: '未解析引用', group: '关联', type: 'num', width: 120, align: 'right',
    meaning: '入口里没能对上某个 SDK 模块的引用数。',
    reading: '**本产品全库 0 条**——864 条入口引用全部唯一命中。列留着是因为"没对上"有四种'
           + '完全不同的原因，换个 SDK 就会出现：ambiguous（多个模块同名，采集器不猜）、'
           + 'not_found（名字合法但 SDK 里没有）、out_of_scope（指向外部包或别的 Kit，'
           + '**本来就不该解析，不是缺陷**）、unsupported（语法不支持或路径非法）。'
           + '把这四种都渲染成空白，就等于把"查不到"和"没有"说成一回事。' },
]
