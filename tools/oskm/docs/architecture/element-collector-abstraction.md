# 采集器取数模式的共性抽取：`RecordShape` + `ElementCollector`

日期：2026-10-18；状态：**已全部实施**。`core/shape.py` + `ElementCollector` 已落地，sas/hdi/services 均已迁移，`install_modules` 是第一个按本抽象新写的采集器。

## 1. 问题陈述

四个采集器都在走同一条流水线：

```
发现源文件 → 读成文档对象 → 在文档里定位元素数组 → 逐元素：字段拆成「提升字段 + 其余」
→ 投射成表列 → （归属 / 关联）→ 写行；导出时再逆向走一遍
```

但每一段都是各写各的。真正的成本不在"流程相似"，而在：**同一个双射被手写了四遍**。

| 同一个双射的四种写法 | 位置 | services | hdi | sas |
| --- | --- | --- | --- | --- |
| 正向：原始元素 → 记录 | `records.py: make_record()` | ✔ | ✔ | ✔ |
| 反向：记录 → 原始元素（写 `record` 列） | `records.py: raw_service/raw_hdi/raw_sa()` | ✔ | ✔ | ✔ |
| 取值：按原字段名读（查询、质量检查） | `records.py: field_value()` | ✔ | ✔ | ✔ |
| 导出：行 → 发布记录 | `collector.py: export_record()` | ✔ | ✔ | ✔ |

`sas` 与 `hdi` 的这三个函数**逐字符相同**，只有 `PRIMARY_FIELDS` 不同：

```python
# system_abilities/records.py 与 hdi/records.py，除常量外完全一致
def field_value(record, name):
    return record.get(name, UNSET) if name in PRIMARY_FIELDS else record.get('config', {}).get(name, UNSET)

def raw_x(record):
    return {**{k: record[k] for k in PRIMARY_FIELDS if k in record}, **record.get('config', {})}

def make_record(<context...>, raw):
    record = dict(<context...>, **{k: raw[k] for k in PRIMARY_FIELDS if k in raw})
    extra = {k: v for k, v in raw.items() if k not in PRIMARY_FIELDS}
    if extra:
        record['config'] = extra
    return record
```

`services` 是同一个形状加一对互逆的派生操作（`path` ↔ `executable`/`args`，以及由 `executable` 推 `type`）。

这四处必须**永远保持互逆**——`record` 列存的是 `raw_x(record)`，导出时再 `make_record(..., raw)` 还原，任何一侧改了而另一侧没改，数据就静默损坏。现在没有任何机制保证，只靠人工对齐。

### 1.1 两处同源的次级重复

**(a) 列投射声明不完整。** `FIELDS = (('cfg','cfg','text'), ...)` + `project_columns()` 已经是声明式的，但只覆盖顶层字段；`config` 里的字段绕过声明手写了 8 行：

```python
# services                              # hdi                                   # sas
secon=projection(config.get('secon')),  device_match_attr=projection(...),      dump_level=projection(..., 'int'),
sandbox=projection(..., 'int'),         permission=projection(..., 'int'),      auto_restart=projection(..., 'bool'),
importance=projection(..., 'int'),      priority=projection(..., 'int'),
```

而 `field_value()` 的语义恰好就是"primary 走顶层，其余走 config"——这 8 行本来就该由同一张声明表覆盖。

**(b) `quality.py` 里四份一样的 `add()` 闭包。**

## 2. 设计

### 2.1 `RecordShape`：一个声明，四个方向

```python
# core/shape.py
@dataclass(frozen=True)
class RecordShape:
    """元素声明与发布记录之间的双射，唯一真源。

    make / raw / value / 导出四个方向全部由它派生，所以不可能互相漂移。
    """
    context: tuple = ()       # 扫描推导的身份列（cfg / profile / hcb+node），不来自元素
    document: Mapping = {}    # 记录键 <- 外层文档键，如 hdi 的 {'process': 'hostName'}
    primary: tuple = ()       # 元素里提升到记录顶层的键
    bucket: str = 'config'    # 其余键的去处；None 表示整个元素原样作记录
    derive: Callable = None   # (record) -> None，派生字段（services 的 path 拆分 + type）
    undo: Callable = None     # (record) -> dict，把派生字段还原成原始键

    def make(self, context, document, raw): ...   # 正向
    def raw(self, record): ...                    # 反向，make 的精确逆
    def value(self, record, key): ...             # 按原字段名取值
```

三个域的声明全文：

```python
# services
SHAPE = RecordShape(
    context=('cfg',),
    primary=('name', 'uid', 'gid', 'start-mode', 'ondemand'),
    derive=split_path,      # path -> executable/args，并按 executable 推 type
    undo=rebuild_path,      # executable/args -> path，丢弃 type
)

# hdi
SHAPE = RecordShape(context=('hcb', 'node'), document={'process': 'hostName'},
                    primary=('serviceName', 'moduleName', 'policy', 'preload'))

# system_abilities
SHAPE = RecordShape(context=('profile',), document={'process': 'process'},
                    primary=('name', 'libpath', 'run-on-create', 'distributed'))
```

`document` 这一项解决的是现在 hdi / sas 导出时的特例：外层文档的 `process`（hdi 里叫 `hostName`）属于父节点而非元素本身，所以**不能**混进 `record`，只能单独存一列、导出时再并回来。把它做成声明，这个"为什么不合并"的约束就写在一处，而不是散在两个 `export_record()` 的注释里。

**消失的代码**：`sas/records.py`、`hdi/records.py` 整个删除（`identity()` 等少量工具函数保留）；`services/records.py` 只剩 `service_type` 和那对 `derive`/`undo`，约 12 行。

**新增的保证**：框架级性质测试——对每个声明了 `SHAPE` 的采集器，扫描出的每条记录都断言

```python
canonical(SHAPE.raw(record)) == canonical(原始元素)
SHAPE.make(context, document, SHAPE.raw(record)) == record
```

rk3568 上一次跑 386 条。这是目前完全缺失的一层保护。

### 2.2 补全列投射声明

`project_columns()` 增加一个参数，缺省键回落到 bucket：

```python
def project_columns(record, fields, shape=None):
    for column, key, kind in fields:
        value = shape.value(record, key) if shape else record.get(key, UNSET)
        if value is UNSET:
            continue
        projected[column] = value if kind == 'json' else projection(value, kind)
```

于是手写的 8 行消失，`config` 内外的字段用同一张表声明：

```python
FIELDS = (('cfg','cfg','text'), ('name','name','text'), ('uid','uid','text'),
          ('start_mode','start-mode','text'), ('ondemand','ondemand','bool'),
          ('args','args','json'), ('gid','gid','json'),
          ('secon','secon','text'),          # ← 原先手写 projection(config.get(...))
          ('sandbox','sandbox','int'),       # ←
          ('importance','importance','int'))  # ←
```

> **一个不能省的区别**：`type` / `executable` / `label` 是**派生 / 归属**字段，不是元素声明。`shape.value()` 对它们返回 `UNSET`，它们继续由 `derive` 和 `LINK_COLUMNS` 单独给。不能混进 `FIELDS`，否则上一轮刚确立的 `record` = 原始全集（见 `sqlite-registry-architecture.md` §4.2）会被破坏。

### 2.3 `ElementCollector`：流水线模板

```python
class ElementCollector(BaseCollector):
    """按『源文件 → 文档 → 元素数组 → 记录 → 行』取数的采集器模板。

    collect() 与 export_record() 由框架生成；领域只实现两个抽象方法。
    不适合这个形状的领域直接继承 BaseCollector，不要半实现本类
    ——那正是上一代可选 hook 基类失败的方式（见 sqlite-registry-architecture.md §2）。
    """
    SHAPE: RecordShape
    FIELDS: tuple                 # (列, 元素键, 类型)
    LINK_COLUMNS: tuple = ()      # 归属 / 宿主外键列，如 ('component_id', 'service_id')
    OVERLAY: tuple = ()           # 导出时从列覆盖回记录的派生字段，如 ('label', 'library')

    @abstractmethod
    def sources(self, ctx):
        """产出源文件路径。越界、读不动、超限在这里报 issue。"""

    @abstractmethod
    def elements(self, ctx, path):
        """解析一个源文件，产出 (context元组, document字典, 元素, pointer)。
        这是唯一与格式耦合的地方——JSON、HCB 二进制、将来的 GN，都在这里吸收。"""

    def enrich(self, ctx, records): ...   # 可选：归属与跨域关联（ownership.py / linking.py）
    def quality(self, ctx, records): ...  # 可选：advisory 检查（quality.py）
    def columns(self, ctx, record): ...   # 可选：声明覆盖不到的列
```

框架生成的两个方法：

```python
    def collect(self, ctx):
        records = []
        for path in self.sources(ctx):
            records.extend((self.SHAPE.make(c, d, raw), p)
                           for c, d, raw, p in self.elements(ctx, path))
        self.enrich(ctx, records)
        self.quality(ctx, records)
        table = self.TABLES[0].name
        for position, (record, _) in enumerate(records):
            links = {c: record.pop(c, None) for c in self.LINK_COLUMNS}
            ctx.emit(table, dict(position=position, record=self.SHAPE.raw(record), **links,
                                 **project_columns(record, self.FIELDS, self.SHAPE),
                                 **self.columns(ctx, record)))

    @classmethod
    def export_record(cls, row, connection, scan_id):
        raw = parse_json(row['record'].encode())[0]
        context = tuple(row[c] for c in cls.SHAPE.context)
        document = {key: parse_json(row[column].encode())[0]
                    for key, column in cls.SHAPE.document_columns()
                    if row[column] is not None}
        record = cls.SHAPE.make(context, document, raw)
        for column in cls.OVERLAY:               # label / library 等派生列
            if row[column] is not None:
                record[column] = row[column]
        rejoin_service(record, row, cls, connection, scan_id)
        return rejoin_component(record, row, cls, connection, scan_id)
```

三个 `export_record()`（实测 41 行）归零。

---

## 3. 迁移后各域剩下什么

| | 迁移前 | 迁移后 |
| --- | --- | --- |
| **services** | `collector.py` 118 + `records.py` 40 | `SHAPE` 7 行 + `FIELDS` 10 行 + `sources`（复用 `discovery.py`）+ `elements` 约 8 行 + `enrich` 约 6 行；`records.py` 只剩 `service_type` / `derive` / `undo` |
| **hdi** | `collector.py` 131 + `records.py` 19 | `SHAPE` 2 行 + `FIELDS` + `elements` 包住 HCB 树遍历；`records.py` 删除 |
| **system_abilities** | `collector.py` 122 + `records.py` 24 | 同上；`records.py` 只剩 `identity()` |
| **components** | `collector.py` 313 | **不迁移**，保持 `BaseCollector`，只复用 `project_columns` 和子表外键 helper |

---

## 附：components 去掉 features / syscap 两列（2026-10-19）

同一个事实原先存了三份：

1. `components.record` —— bundle.json 的原始对象，本来就含 `features` / `syscap`
2. `components.features` / `components.syscap` —— 两个 JSON 列
3. `features` / `syscaps` 两张独立表 —— 展开后的值，带索引

第 2 份是纯冗余。查询真正要用的是第 3 份（`json_each` 用不上索引，所以当初才建的表），
而"原始声明"第 1 份已经逐字保留。删掉两列后：

- `record` 不变，`export_record` 发布的文档不变（它从 `record` 取）
- `features` / `syscaps` 表不变
- 少两列、少一次投影

实现上与 `build` 同一个模式：`emit_values()` 展开之后把键从待 emit 的 dict 里 pop 掉，
注释说明"它活在 record 里"。

**在前端暴露出一个错配**：viewer 的列目录里 `features` / `syscaps` 描述的是
"关联行的计数"（列表视图那一列），而库里的同名列装的是原始 JSON 数组——
名字撞了、含义不是一回事，档案页因此把计数的说明挂到了数组上。
现在列没了，这两个键落进"其它声明"，并由专门的条目给出正确的说明。
