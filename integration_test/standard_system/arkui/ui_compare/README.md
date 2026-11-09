# ui_compare 样本仓约定

本目录为 OpenHarmony **UI 截图对比 / 非截图断言** 样本工程集合。开发约定与流水线见 skill **ohxtsuicompare**。

## 工程角色

| 工程 | 角色 | 是否接受新业务 Suite |
|------|------|----------------------|
| **uiCompareTest_12** | **活跃模板**（RichEditor 族最全；`createWindow` + 具名 `snapShot` + base/dark） | 仅作克隆源，一般不在此堆新需求 |
| **uiCompareTest_01～_11** | 历史样本 | **冻结**：不新增业务 Suite；仅允许注释统一、对比 json 补齐等卫生改动 |
| **uiCompareTest_13** | **0803 截图对比新工程** | 适合视觉 golden 的新需求 |
| **uiAssertTest_01** | **0803 非截图断言新工程** | TDD/日志/UEC/外设等不适合截图的用例 |

## 用例注释规范（强制）

每条 `it` 上方须为：

```text
    /*
     * @tc.number : <完整测试号>
     * @tc.name   : <英文短标题，勿直接填测试号>
     * @tc.desc   : <英文描述：说明本用例验证的接口/属性/行为>
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
```

字段顺序与空格对齐以上模板；缺字段须补齐。`@tc.desc` **必填**，用英文说明测的是什么接口或场景。

工具：`python3 tools/unify_tc_comments.py`（会尽量从用例号与 0803 xlsx 名称生成英文 name/desc，并保留 CRLF）。

## 对比配置

- 工程根须有 `uiCompareTest_XX.json` 或 `.json5`，含 DeviceTest `driver` / `kits` / **`extra`** 成对 webp。
- **`snapShot()` 无参**：无法可靠登记 `extra`；历史工程保留现状；**新工程禁止无参**，必须 `snapShot("测试号_01")`。

## Agent / 开发禁改

- 勿改 `ets/testability/pages/test/` 下孤儿副本（以 `ets/test/` 为准）。
- 勿整目录覆盖 `model/`；勿提交 `autosign/`、`hypium/`、`build/`。
- 新需求只进 **uiCompareTest_13** / **uiAssertTest_01**。

## 需求分流文档

- [docs/0803_snap_cases.md](docs/0803_snap_cases.md) — 适合截图
- [docs/0803_assert_cases.md](docs/0803_assert_cases.md) — 非截图断言
- [docs/0803_manual_cases.md](docs/0803_manual_cases.md) — 暂缓/人工/外仓

## 工具

- [tools/unify_tc_comments.py](tools/unify_tc_comments.py) — 统一活跃 Suite 注释
- [tools/gen_or_fill_uicompare_json.py](tools/gen_or_fill_uicompare_json.py) — 补齐/回填对比 json5
- [tools/split_0803_xlsx.py](tools/split_0803_xlsx.py) — 从 xlsx 生成分流清单
