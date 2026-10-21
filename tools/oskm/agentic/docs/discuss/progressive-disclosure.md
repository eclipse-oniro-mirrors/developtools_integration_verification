# Agent 使用 oskm MCP 的渐进式披露讨论

日期：2026-10-21
状态：**讨论稿**，发散分析场景与方案，待收敛。

## 1. 问题

oskm MCP 暴露 43 个工具。Agent 启动时 `tools/list` 返回全部定义，每个工具含 name + description + JSON Schema，约 150-270 token/工具。43 个工具合计约 **6500-11600 token**，占 200K context 的 3-6%。

这不致命，但带来两个问题：

1. **注意力分散**：Agent 看到所有工具定义，但不清楚在什么场景该用哪个。43 个工具名摆在面前，Agent 可能选错工具或在无关工具上"试探"。
2. **缺乏工作流引导**：工具是平铺的（按域分），但 Agent 的工作是按流程走的（理解 → 设计 → 实现 → 验证）。Agent 不清楚"开始做 OpenHarmony 开发时，第一步该查什么"。

opencode 官方文档明确警告：
> MCP servers add to your context, so you want to be careful with which ones you enable.

## 2. Agent 在 OpenHarmony 设计/开发中的典型场景

### 场景 A：理解现有部件（"改 ability_runtime 之前先看现状"）

```
Agent 工作流：
1. get_component('ability_runtime')         → 部件基本信息 + attached_counts
2. component_innerapis(id)                   → 已有对外接口
3. component_features(id)                    → 已有特性开关
4. component_attached(id, 'services')        → 提供哪些系统服务
5. component_dependencies(id)                 → 依赖哪些部件
6. component_dependents(id)                  → 谁依赖它（影响面）
```

**当前问题**：Agent 需要知道调这 6 个工具的顺序和组合。如果只是看到 43 个工具的平铺列表，Agent 可能先调 `sql_query` 手写 SQL，而不是用 typed 工具。

### 场景 B：排查构建错误（"libfoo.z.so 找不到依赖 libbar.z.so"）

```
1. search_elf_modules(query='libfoo')        → 找到 ELF 路径
2. elf_dependencies(dest, max_distance=3)    → 看依赖树，确认 libbar 是否在闭包里
3. owner_of('system/lib/libbar.z.so')        → libbar 属于哪个部件
4. search_elf_modules(query='libbar')        → 确认 libbar 是否在镜像中
```

**当前问题**：Agent 不清楚 `elf_dependencies` 支持 BFS 闭包遍历，可能逐条手写 SQL 查依赖边。

### 场景 C：设计新特性（"给 ability_runtime 加一个新 feature"）

```
1. get_component('ability_runtime')          → 当前状态
2. component_features(id)                    → 现有 feature 命名模式
3. get_gn_arg('ability_runtime_power')      → 看一个已有 feature 的 gn_arg 声明格式
4. git_url(manifest_path)                    → 获取 bundle.json 的 git URL，准备编辑
```

**当前问题**：Agent 不知道 `get_gn_arg` 返回 `source_url`（指向 .gni 声明文件），也不知道 `git_url` 可以从路径构建 git 访问 URL。

### 场景 D：跨扫描对比（"这次扫描和上次比新增了哪些部件"）

```
1. attach_secondary(baseline.db, 'baseline') → 挂载基线库
2. diff_scans('components', scan_a, scan_b, 'baseline') → 结构化差异
3. detach_secondary('baseline')              → 清理
```

**当前问题**：Agent 完全不知道这个工作流存在——它需要先 `attach` 再 `diff` 再 `detach`，是一个有状态的三步序列。

### 场景 E：HDI 驱动开发（"加一个新的 HDI 设备节点"）

```
1. search_hdis(query='audio')               → 找同类设备参考
2. get_hdi(service_name='...')               → 看具体设备声明
3. service_hosted(service_id, 'hdis')        → 看宿主服务管理了哪些设备
4. owner_of(library_path)                    → 驱动库属于哪个部件
```

## 3. 渐进式披露策略

### 策略 1：AGENTS.md 工作流引导（推荐，成本最低）

在 `packages/oskm/AGENTS.md`（或项目根的 AGENTS.md）中写入工作流引导，让 Agent 在每次会话开始时读到：

```markdown
## oskm 知识库使用

当需要查询 OpenHarmony 系统架构信息时，使用 oskm MCP 工具。

### 查部件
- 先调 `get_component(name)` 获取基本信息
- 再按需调 `component_features` / `component_innerapis` / `component_attached`
  / `component_dependencies` / `component_dependents`

### 查文件归属
- 调 `owner_of(dest)` 直接获取部件名

### 查编译参数
- 调 `get_gn_arg(name)` 获取当前值与声明位置

### 查 ELF 依赖
- 先 `search_elf_modules(query)` 找到 ELF
- 再 `elf_dependencies(dest, max_distance=3)` 看依赖闭包

### 查 SA/HDI
- `get_sa(sa_id)` 按 ID 查 SA 服务
- `search_services(query)` 按名搜系统服务
- `service_hosted(service_id)` 看宿主的 SA 服务/HDI 设备

### 跨扫描对比
- 先 `attach_secondary(db_path, alias)` 挂载基线库
- 再 `diff_scans(entity, scan_a, scan_b, db_b)` 做差异对比
- 完成后 `detach_secondary(alias)` 清理

### 任意 SQL（逃生口）
- `sql_query(sql)` 受限只读 SQL，自动注入 scan_id

### 开始前
- 调 `open_session(db_path)` 连接数据库（如果未自动连接）
```

**优点**：
- 零基础设施——就是一个 markdown 文件
- Agent 在会话开始时自动读 AGENTS.md（opencode 内置机制）
- 按工作流分场景，Agent 知道何时该用什么

**缺点**：
- 静态——无法根据当前任务动态调整
- 仍占 context（AGENTS.md 全文进 context）
- 如果 AGENTS.md 已经很长（如现有的 oskm AGENTS.md），追加 MCP 引导会增加负担

### 策略 2：Skill 文件（场景化示例）

创建 `~/.config/opencode/skills/oskm-mcp/SKILL.md`，包含场景化的工具调用序列：

```markdown
# oskm 知识库查询 Skill

## 场景：理解部件架构
当需要理解一个部件的现状时，按以下序列查询：

1. `get_component(name='ability_runtime')` → 基本信息 + 关联计数
2. `component_innerapis(component_id=返回的id)` → 对外接口列表
3. `component_features(component_id=id)` → 特性 + 编译参数值
4. `component_attached(component_id=id)` → 安装模块/系统服务/ELF
5. `component_dependencies(component_id=id)` → 正向依赖
6. `component_dependents(component_id=id)` → 反向依赖（影响面）

## 场景：排查构建错误
当遇到 "找不到依赖库" 类错误时：

1. `search_elf_modules(query='libfoo')` → 找到 ELF 镜像路径
2. `elf_dependencies(dest='system/lib/libfoo.z.so', max_distance=3)` → 依赖闭包
3. `owner_of(dest='system/lib/libbar.z.so')` → 确认缺失库的归属

## 场景：跨版本对比
当需要对比两次扫描时：

1. `attach_secondary(db_path='baseline.db', alias='baseline')`
2. `diff_scans(entity='components', scan_a=2, scan_b=1, db_b='baseline')`
3. `detach_secondary(alias='baseline')`
```

**优点**：
- 场景驱动——Agent 按场景索引，而非按工具索引
- 带调用序列（step 1→2→3），Agent 不用猜顺序
- Skill 是 opencode 一等公民，有触发关键词机制

**缺点**：
- 需要维护 skill 文件
- Skill 触发依赖关键词匹配，不匹配时不会自动加载
- 场景列举不完——新场景需手动补充

### 策略 3：按 Agent 角色分工具（opencode per-agent scoping）

定义不同 Agent 角色，每个角色只暴露相关工具子集：

```json
{
  "agent": {
    "ohos-architect": {
      "description": "OpenHarmony 架构分析",
      "tools": {
        "oskm_get_component": true,
        "oskm_component_attached": true,
        "oskm_component_dependencies": true,
        "oskm_component_dependents": true,
        "oskm_component_features": true,
        "oskm_component_innerapis": true,
        "oskm_search_components": true,
        "oskm_git_url": true,
        "oskm_list_repos": true
      }
    },
    "ohos-debugger": {
      "description": "OpenHarmony 构建问题排查",
      "tools": {
        "oskm_owner_of": true,
        "oskm_search_elf_modules": true,
        "oskm_elf_dependencies": true,
        "oskm_elf_dependents": true,
        "oskm_get_install_module": true,
        "oskm_search_install_modules": true,
        "oskm_sql_query": true
      }
    }
  }
}
```

**优点**：
- 每个 Agent 只看到相关工具，context 大幅减少
- 角色清晰，Agent 不会"试探"无关工具

**缺点**：
- 刚性——跨角色查询（如架构分析时突然要查 ELF）需要切 Agent
- 需要预定义角色，不能适应新场景
- 通用 Agent（如 opencode 默认的 build Agent）仍看到全部 43 个工具

### 策略 4：工具描述精简（减少 per-tool token）

将 43 个工具的 description 压缩到一行，把详细说明移到 spec/ 文档：

```python
# 当前
@register('get_component', 'Look up a component by name', {
    'type': 'object',
    'properties': {'name': {'type': 'string', 'description': '部件名（构建索引键，如 ability_runtime）'}},
    'required': ['name'],
})

# 精简后
@register('get_component', '部件查找', {
    'type': 'object',
    'properties': {'name': {'type': 'string'}},
    'required': ['name'],
})
```

**优点**：
- 43 工具的总 token 从 ~10K 降到 ~3K
- Agent 仍能看到所有工具，但 context 占用小

**缺点**：
- 信息丢失——Agent 可能不知道 `get_component` 返回什么、参数格式如何
- 需要配合 AGENTS.md 或 Skill 补充上下文
- JSON Schema 仍是主要 token 来源，精简 description 帮助有限

### 策略 5：分层 MCP（gateway + detail）

拆成两层 MCP server：

- **Gateway MCP**（5-8 个工具）：`open_session` + `query`（一个万能工具，接受自然语言描述，内部路由到具体工具）
- **Detail MCP**（43 个工具）：默认不加载，Gateway 内部按需调用

```python
@register('query', 'Query the OpenHarmony knowledge base', {
    'properties': {
        'question': {'type': 'string', 'description': '自然语言问题'}
    }
})
def query(params, manager):
    # 内部路由：解析问题 → 选择工具 → 调用 → 返回
    # 或返回 "建议调用 get_component(name=...)"
```

**优点**：
- Agent 只看到 1 个工具，context 极简
- 自然语言接口，Agent 不需要学工具名

**缺点**：
- 需要实现 NLU/路由逻辑（复杂）
- 丧失 typed 工具的确定性——Agent 不能精确控制查询
- 延迟增加（多一层路由）
- 调试困难

### 策略 6：MCP Resources（文档型 prompt 注入）

实现 §6.2 设计的资源 URI，作为 Agent 的"说明书"：

```
oskm://guide/start    → "开始前：先调 open_session(db_path=...)"
oskm://guide/component → "查部件：get_component → component_features/innerapis/attached/dependencies"
oskm://guide/elf      → "查 ELF：search_elf_modules → elf_dependencies"
oskm://guide/diff     → "对比：attach_secondary → diff_scans → detach_secondary"
```

Agent 在需要时 `resources/read` 对应 guide，获取该场景的工具调用序列。

**优点**：
- 按需加载——只在需要时读对应 guide
- 不占 base context（resources 不像 tools 那样在启动时全量列出）

**缺点**：
- 需要实现资源 URI（当前标记为"未实施"）
- Agent 需要知道 guide 资源存在才会去读——鸡生蛋问题
- 需要配合 AGENTS.md 提示"有 guide 资源可读"

## 4. 方案对比

| 策略 | 实现成本 | Token 节省 | 灵活性 | 推荐度 |
|------|---------|-----------|--------|--------|
| 1. AGENTS.md 引导 | 极低（写 markdown） | 不省（引导本身占 context） | 高（覆盖所有场景） | ★★★★★ 首选 |
| 2. Skill 文件 | 低（写 skill） | 中（Skill 按需加载） | 中（场景列举不全） | ★★★★ 次选 |
| 3. 按 Agent 角色分工具 | 中（配 opencode.json） | 高（每角色 8-15 工具） | 低（刚性） | ★★★ 特定场景 |
| 4. 工具描述精简 | 低（改 Python） | 中（~10K→~3K） | 不影响 | ★★★ 辅助手段 |
| 5. 分层 MCP（gateway） | 高（实现路由） | 极高（1 工具） | 低（丧失精确控制） | ★★ 不推荐 |
| 6. MCP Resources | 中（实现资源） | 高（按需读） | 高 | ★★★★ 第二阶段 |

## 5. 推荐组合方案

### Phase 1（立即落地）：AGENTS.md + 工具描述精简

1. **在 `packages/oskm/AGENTS.md` 追加 oskm MCP 使用引导**——按场景列出工具调用序列，让 Agent 读到后知道"该用什么、怎么用"
2. **精简 43 个工具的 description**——从长句改为一行中文，减少 per-tool token

### Phase 2（按需）：Skill 文件 + per-agent scoping

1. **创建 `~/.config/opencode/skills/oskm/SKILL.md`**——包含 5-6 个场景的详细调用序列（场景 A-E），Agent 在遇到匹配关键词时加载
2. **定义 `ohos-architect` / `ohos-debugger` Agent**——各自只暴露相关工具子集，减少 context

### Phase 3（后续）：MCP Resources 实现

1. **实现 §6.2 设计的资源 URI**——`oskm://guide/*` 资源作为场景化说明书，Agent 按需读取

## 6. 待讨论的问题

1. **AGENTS.md 放哪？** 放 `packages/oskm/AGENTS.md`（已有文件，追加）还是项目根 `AGENTS.md`（全局可见）？
2. **工具描述用中文还是英文？** opencode 的 Agent 默认用英文，但用户对话可能用中文。双语太长，单语选哪个？
3. **Skill 触发关键词怎么设计？** "oskm""知识库""部件""依赖"——太宽泛会误触发，太窄会漏触发。
4. **43 个工具是否需要全部启用？** 是否有些工具（如 `aggregate`/`list_entities`）Agent 几乎不会直接用，可以默认禁用？
5. **open_session 的时机？** 当前 server 无 `--db` 启动，Agent 需要先调 `open_session`。但 Agent 可能不知道 db 路径——AGENTS.md 应该写入常用路径，还是让用户提供？
6. **多库对比的引导？** `attach → diff → detach` 是有状态三步序列，Agent 容易忘记 `detach`。是否在 diff_scans 的返回值里提醒"完成后请调 detach_secondary"？
