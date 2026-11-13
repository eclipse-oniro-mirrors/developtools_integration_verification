"""两个产物（CLI 与 Skill）的测试共用的合成库与真库辅助。

放在 `packages/oskm/` 顶层而不是任何一侧的 `tests/` 里，是因为：

- `fixture.py` 从 `oskm_schema` 生成一个 schema 完整的库。skill 侧的
  `install` / `validate-db` 用例需要一个"合法但可被改坏"的库来验证回滚，
  CLI 侧的实体工具用例需要同一个库来验证查询。用**同一份生成逻辑**，
  否则两侧对"什么叫 schema 完整"的理解会各自漂移。
- `testdb.py` 只负责定位真实库（`OSKM_TEST_DB`）并按 `scans.cpu_arch`
  为 CLI 功能测试选择样本；skill 测试不使用真实库。它不属于任何一个发布产物。

两个模块都不随产物发布：`build_cli.py` 与 `build_skill.py` 都不 stage 这个目录
（两边各有一条门禁盯着：`PyzContents::test_no_collectors_tests_or_maintainer_docs`
与 `SkillBundleTests::test_the_query_engine_is_not_bundled`）。

## 为什么在 `packages/oskm/` 顶层，而不是塞进某一侧的 `tests/`

实测的使用方（`grep -rl "from oskm_testing"`）：**`cli/tests/` 8 个文件、
`skills/…/tests/` 6 个文件、`oskm/tests/` 0 个**。`fixture.py` 双边共用，
`testdb.py` 只服务 CLI：

| 模块 | cli/tests | skills/…/tests |
|---|---:|---:|
| `fixture.py`（造 schema 完整的合成库） | 3 | 6 |
| `testdb.py`（定位真库 + 按 cpu_arch 归一 + 样本选择器） | 6 | 0 |

所以两个备选都不成立：

- 放进 `cli/tests/`：skill 侧测试就要 import **另一个产物的测试目录**，
  这比共用一个顶层包更糟——它把"测试代码"也变成了跨产物依赖，
  而设计文档 §7.3 只允许 skill 侧 import `oskm_cli`（运行代码），
  没允许它 import CLI 的测试。
- 拆成两份：`fixture.py` 一旦有两份，"什么叫 schema 完整"就会各自漂，
  而 skill 侧的 `install` / `validate-db` 用例恰恰要靠它造"合法但可被改坏"的库。

它和 `oskm_schema/` 是同一类东西：**两侧共用、两侧都不发布的中立包**，
所以放在同一层、用同一种 `oskm_*` 命名。
"""
