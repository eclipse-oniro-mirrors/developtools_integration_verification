# Component Links 采集器设计

schema 1.0.0 | 依赖：components, args, install_modules

## 输入与范围

后处理采集器：不读源码、不读构建产物，只读三个上游采集器已提交的表，把两条跨域关联用 `UPDATE` 写到 components 的子表上。自身只 INSERT 一行审计记录。

| 关联 | components 侧 | 目标表 | 关联键 |
|---|---|---|---|
| features → gn_args | `features.value`（feature 名） | `gn_args` | `features.value = gn_args.name`（gn_args 表 `UNIQUE (scan_id, name)`） |
| innerapis → install_modules | `innerapis.name`（原始 GN label，声明时已不带 toolchain 后缀） | `install_modules` | `innerapis.name = install_modules.label` |

innerapis.name 来自 bundle.json `build.inner_kits[].name` / `build.inner_api[].name`，声明时即 `//path:target` 形态；install_modules.label 由 SMI label 经 `strip_label` 去后缀。实测 rk3568 全量 1711 条 distinct name 均已是不带后缀形态，可直接等值 JOIN。

## schema 变更（components 侧）

components 表族新增两列，由 ComponentsCollector 在 emit 时填 `NULL`。列的**存在**是 components 的 schema 责任（2.0.0 → 2.1.0）；列的**非 NULL 填充**是 component_links 的责任。详见 [components/design.md](../components/design.md)。

```sql
ALTER TABLE features   ADD COLUMN gn_arg_id         INTEGER REFERENCES gn_args(id) ON DELETE SET NULL;
ALTER TABLE innerapis  ADD COLUMN install_module_id INTEGER REFERENCES install_modules(id) ON DELETE SET NULL;
CREATE INDEX idx_features_gn_arg    ON features(scan_id, gn_arg_id);
CREATE INDEX idx_innerapis_module   ON innerapis(scan_id, install_module_id);
```

## 审计表

component_links 拥有的唯一表，单行/scan，记录本次链接命中与未命中计数：

```sql
CREATE TABLE component_links_run (
    id                   INTEGER PRIMARY KEY,
    scan_id              INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    linked_features      INTEGER NOT NULL,
    unresolved_features  INTEGER NOT NULL,
    linked_innerapis     INTEGER NOT NULL,
    unresolved_innerapis INTEGER NOT NULL
);
```

`RESULT_FIELD = None`：本采集器不发布消费方记录。消费者通过查 features/innerapis 表的关联列拿链接，审计行只用于诊断与 provenance。

## 关联算法

### features → gn_args

精确等值 JOIN，gn_args 表 `UNIQUE (scan_id, name)` 保证子查询至多一行：

```sql
UPDATE features SET gn_arg_id = (
    SELECT g.id FROM gn_args g
    WHERE g.scan_id = features.scan_id AND g.name = features.value
) WHERE scan_id = ?
```

rk3568 预期：~1351 features 行，gn_args 覆盖 ~97%，约 40 个 unresolved（条件配置未展开的 feature）。

### innerapis → install_modules

通过 stripped label 等值 JOIN：

```sql
UPDATE innerapis SET install_module_id = (
    SELECT m.id FROM install_modules m
    WHERE m.scan_id = innerapis.scan_id AND m.label = innerapis.name
) WHERE scan_id = ?
```

rk3568 预期：~670 innerapis 行，命中率取决于 inner_kits/inner_api 是否都构建出来（实测 distinct name 1711，JOIN 命中 1234 = 72.1%，未匹配的是静态库/header-only/构建工具等未安装到镜像的 target）。

## 采集流程

```python
@register
class ComponentLinksCollector(BaseCollector):
    NAME = 'component_links'
    DEPENDS_ON = ('components', 'args', 'install_modules')
    SCHEMA_VERSION = '1.0.0'
    TABLES = (COMPONENT_LINKS_RUN,)
    RESULT_FIELD = None
    EXPORT_ORDER = 'id'
    ATTRIBUTION_PREFIXES = ()
```

拓扑：`repos → components → args → install_modules → component_links → elf_modules → ...`

`collect(ctx)` 在事务外只读，做三件事：
1. 三态检查上游：`ctx.upstream.ran('args')` / `ran('install_modules')` / `failed(...)`
2. SELECT 找未匹配 features 与 innerapis，对每个发 advisory issue（带 feature_name / innerapi_name + component 上下文）
3. emit 一行审计（计数）

`post_insert(connection, scan_id)` 在 `_persist` 的事务内做 UPDATE（与 `install_modules.post_insert` 同机制，runner.py:76-78）：
1. `UPDATE features SET gn_arg_id = NULL WHERE scan_id = ?` — 重置防 stale
2. `UPDATE innerapis SET install_module_id = NULL WHERE scan_id = ?` — 重置
3. 两条 UPDATE 填值（见上节"关联算法"）

collect() 算计数、post_insert 写值——两侧用同一 SQL 逻辑，单线程扫描下结果一致。

## issue 规则

| 条件 | code | 级别 |
|---|---|---|
| args 选中但 failed | `ARGS_UNAVAILABLE` | warning |
| install_modules failed 或 inventory 不完整 | `INSTALL_INDEX_INCOMPLETE` | warning |
| feature 在 gn_args 无匹配 | `FEATURE_VALUE_UNRESOLVED`（带 feature_name + component） | info |
| innerapi 在 install_modules 无匹配 | `INNERAPI_MODULE_UNRESOLVED`（带 innerapi_name + component） | warning |

所有 issue 均 advisory——不影响 scan status，不阻断下游。`ATTRIBUTION_PREFIXES = ()`：本采集器无非 advisory issue 路径（上游 failed 时也只发 advisory，让消费方自行判断是否信任 NULL）。

## 容错设计

| 场景 | 处理 |
|---|---|
| args 未选（`--without args`） | DEPENDS_ON 级联跳过 component_links；features.gn_arg_id 全 NULL |
| args 跑失败 | 检测 `ctx.upstream.failed('args')`，发 `ARGS_UNAVAILABLE`，跳过 features UPDATE |
| install_modules 未选 / 失败 | 同上 |
| gn_args 表空（gn 工具未找到） | features 全部 unresolved，每个发 `FEATURE_VALUE_UNRESOLVED` |
| install_modules 表空 | innerapis 全部 unresolved |
| 单个 feature 无匹配 | gn_arg_id 留 NULL，发 advisory |
| 单个 innerapi 无匹配 | install_module_id 留 NULL，发 advisory |

## re-run 语义

| 场景 | 结果 |
|---|---|
| `--only component_links --reuse-upstream` | ✅ 刷新 links；features/innerapis 行不变，UPDATE 重写关联列 |
| `--only components --reuse-upstream` | ⚠️ features DELETE+INSERT，关联列重置 NULL；component_links 未重跑，links 丢失直到再跑 |
| `--only args --reuse-upstream` | ⚠️ gn_args 拿新 surrogate id；features.gn_arg_id 指向已删除的旧 id（ON DELETE SET NULL 在 args DELETE 时清空，但--reuse-upstream 不触发 args DELETE） |
| `--only components`（无 reuse） | ✅ 框架自动级联跑 component_links |

第二、三行是 `--reuse-upstream + surrogate id` 模型的固有问题（`services.install_module_id` 在 install_modules 单独重跑时同样失效），非本方案独有。建议在 `oskm scan --help` 文档化：单跑 components 或 args/install_modules 后，建议再跑 `--only component_links --reuse-upstream` 刷新 links。

## 查询接口

```sql
-- 查某部件所有 feature 的实际值
SELECT f.value AS feature_name, g.current_value, g.value_type, g.has_override
FROM features f
LEFT JOIN gn_args g ON g.id = f.gn_arg_id
WHERE f.scan_id = ? AND f.component_id = ?;

-- 查 innerapi 关联的安装模块
SELECT i.name AS innerapi_label, m.label AS install_label, m.id AS install_module_id
FROM innerapis i
LEFT JOIN install_modules m ON m.id = i.install_module_id
WHERE i.scan_id = ? AND i.component_id = ?;

-- 全扫描命中率
SELECT
  (SELECT COUNT(*) FROM features   WHERE scan_id = ? AND gn_arg_id         IS NOT NULL) AS linked_features,
  (SELECT COUNT(*) FROM features   WHERE scan_id = ?)                       AS total_features,
  (SELECT COUNT(*) FROM innerapis  WHERE scan_id = ? AND install_module_id IS NOT NULL) AS linked_innerapis,
  (SELECT COUNT(*) FROM innerapis  WHERE scan_id = ?)                       AS total_innerapis;

-- 未关联 innerapis（排查用）
SELECT c.name AS component, i.name AS innerapi, i.field, i.source_index
FROM innerapis i
JOIN components c ON c.id = i.component_id
WHERE i.scan_id = ? AND i.install_module_id IS NULL
ORDER BY c.name, i.name;
```

## 与 components 的所有权分割

| 资产 | 所有者 | 责任 |
|---|---|---|
| `features` 表 schema（含 `gn_arg_id` 列定义） | ComponentsCollector | SCHEMA_VERSION 2.1.0；emit 时填 NULL |
| `features.gn_arg_id` 列的 NULL → 非 NULL 填充 | ComponentLinksCollector | post_insert UPDATE |
| `innerapis` 表 schema（含 `install_module_id`、`label_stripped`） | ComponentsCollector | SCHEMA_VERSION 2.1.0；emit 时填 NULL / 派生值 |
| `innerapis.install_module_id` 列的 NULL → 非 NULL 填充 | ComponentLinksCollector | post_insert UPDATE |
| `component_links_run` 表 schema 与数据 | ComponentLinksCollector | SCHEMA_VERSION 1.0.0 |

双边文档：[components/design.md](../components/design.md) 列出列定义；本文件列出 UPDATE 算法、issue 规则与 re-run 语义。

## 实施步骤

| 步骤 | 内容 | 门槛 |
|---|---|---|
| 1 | components 加三列、bump schema 2.0.0→2.1.0；emit 时填 NULL/strip_label | 225 测试全绿；features.gn_arg_id 全 NULL，innerapis.label_stripped 与 install_modules.label 同算法 |
| 2 | 跑 `SELECT ... LEFT JOIN install_modules` 验证 innerapis 命中率 | rk3568 命中率 ≥ 80%（若低，检查 strip_label 算法差异） |
| 3 | 跑 `SELECT ... LEFT JOIN gn_args` 验证 features 命中率 | rk3568 命中率 ≥ 95%（gn_args 已验证 97.3%） |
| 4 | 新建 `collectors/component_links/`：collector.py + models.py | 框架可注册，component_links 出现在 `oskm scan` 子命令 |
| 5 | 实现 collect()（SELECT + issue + emit 审计）+ post_insert()（UPDATE） | rk3568 一次扫描后 features.gn_arg_id / innerapis.install_module_id 非空率与步骤 2/3 一致 |
| 6 | 单元测试 + rk3568 验收 | 覆盖率与命中率断言；--reuse-upstream 行为测试 |
